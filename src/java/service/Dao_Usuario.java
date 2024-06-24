/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import db.ConexionSingleton;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.CRUD;
import model.Usuario;

/**
 *
 * @author DaddyChary
 */
public class Dao_Usuario implements CRUD<Usuario> {

    private ConexionSingleton oConexionSingleton;

    public Dao_Usuario(ConexionSingleton oConexionSingleton) {
        this.oConexionSingleton = oConexionSingleton;
    }

    @Override
    public void insert(Usuario obj) {
//        String sql = "INSERT INTO usuarios (id, nombre, apellido, correo, password, tipo_usuario) VALUES "
//                + "(null, '" + obj.getNombre() + "', '" + obj.getApellido() + "', '" + obj.getCorreo() + "',sha2('" + obj.getPassword() + "',0),'" + obj.getTipo_usuario() + ")";
        String sql = "INSERT INTO usuarios (id, nombre, apellido, correo, password, tipo_usuario) VALUES "
                + "(null, '" + obj.getNombre() + "', '" + obj.getApellido() + "', '" + obj.getCorreo() + "', '" + obj.getPassword() + "', '" + obj.getTipo_usuario() + ")";
        try {
            oConexionSingleton.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Usuario obj) {
        String sql = "DELETE FROM usuarios WHERE id =  '" + obj.getId() + "'";
        try {
            oConexionSingleton.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<Usuario> get(int id) {
        String sql = "SELECT * FROM usuarios WHERE id =" + id + "";
        try {
            ResultSet oResultSet = oConexionSingleton.getConnection().createStatement().executeQuery(sql);
            if (oResultSet.next()) {
                return Optional.of(new Usuario(oResultSet.getInt("id"), oResultSet.getString("nombre"), oResultSet.getString("apellido"),
                        oResultSet.getString("correo"), oResultSet.getString("password"), oResultSet.getInt("tipo_usuario")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void update(Usuario obj) {
        String sql = "UPDATE usuarios SET nombre = '" + obj.getNombre() + "', apellido = '" + obj.getApellido() + "', correo ='" + obj.getCorreo() + "', password = '" + obj.getPassword() + "'"
                + "tipo_usuario = " + obj.getTipo_usuario() + "  WHERE id = " + obj.getId() + "";
        try {
            oConexionSingleton.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<List<Usuario>> getAll() {
        String sql = "SELECT * FROM usuarios";
        List<Usuario> list = new ArrayList<>();
        try {
            ResultSet oResultSet = oConexionSingleton.getConnection().createStatement().executeQuery(sql);
            while (oResultSet.next()) {
                list.add(new Usuario(oResultSet.getInt("id"), oResultSet.getString("nombre"), oResultSet.getString("apellido"),
                        oResultSet.getString("correo"), oResultSet.getString("password"), oResultSet.getInt("tipo_usuario")));
            }
            return Optional.of(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    public Usuario isExist(Usuario oUsuario) {
        String sql = "SELECT * FROM usuarios WHERE nombre = '"+ oUsuario.getNombre() +"' AND password = '"+ oUsuario.getPassword() +"'";
        try {
            ResultSet oResultSet = oConexionSingleton.getConnection().createStatement().executeQuery(sql);
            if (oResultSet.next()) {
                return new Usuario(oResultSet.getInt("id"), oResultSet.getString("nombre"), oResultSet.getString("apellido"),
                        oResultSet.getString("correo"), oResultSet.getString("password"), oResultSet.getInt("tipo_usuario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
