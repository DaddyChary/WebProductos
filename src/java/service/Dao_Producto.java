/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import db.ConexionSingleton;
import db.ConexionSingleton;
import java.util.List;
import java.util.Optional;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.CRUD;
import model.Producto;

/**
 *
 * @author jr972
 */
public class Dao_Producto implements CRUD<Producto> {

    private ConexionSingleton oConexionSingleton;

    public Dao_Producto(ConexionSingleton oConexionSingleton) {
        this.oConexionSingleton = oConexionSingleton;
    }

    @Override
    public void insert(Producto obj) {
        String sql = "INSERT INTO productos (id, nombre, descripcion, precio) VALUES "
                + "(null, '" + obj.getNombre() + "', '" + obj.getDescripcion() + "', " + obj.getPrecio() + ")";
        try {
            oConexionSingleton.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Producto obj) {
        String sql = "DELETE FROM productos WHERE id =  '" + obj.getId() + "'";
        try {
            oConexionSingleton.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<Producto> get(int id) {
        String sql = "SELECT * FROM productos WHERE id =" + id + "";
        try {
            ResultSet oResultSet = oConexionSingleton.getConnection().createStatement().executeQuery(sql);
            if (oResultSet.next()) {
                return Optional.of(new Producto(oResultSet.getInt("id"), oResultSet.getString("nombre"),
                        oResultSet.getString("descripcion"),oResultSet.getInt("precio")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void update(Producto obj) {
        String sql = "UPDATE productos SET nombre = '" + obj.getNombre()+ "', descripcion = '" + obj.getDescripcion()+ "', precio =" + obj.getPrecio()+ " WHERE id = " + obj.getId() + "";
        try {
            oConexionSingleton.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<List<Producto>> getAll() {
        String sql = "SELECT * FROM productos";
        List<Producto> list = new ArrayList<>();
        try {
            ResultSet oResultSet = oConexionSingleton.getConnection().createStatement().executeQuery(sql);
            while (oResultSet.next()) {
                list.add(new Producto(oResultSet.getInt("id"), oResultSet.getString("nombre"),
                        oResultSet.getString("descripcion"),oResultSet.getInt("precio")));
            }
            return Optional.of(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

}
