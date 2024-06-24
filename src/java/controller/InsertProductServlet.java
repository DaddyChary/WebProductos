/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import db.ConexionSingleton;
import service.Dao_Producto;
import model.Producto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Dao_Producto;

@WebServlet("/insertProduct")
public class InsertProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        int precio = Integer.parseInt((request.getParameter("precio")));

        // Obtén la conexión de la clase de conexión singleton
        ConexionSingleton oConexionSingleton = ConexionSingleton.getIntance();

        Dao_Producto oDao_Producto = new Dao_Producto(oConexionSingleton);
        Producto nuevoProducto = new Producto();
        nuevoProducto.setNombre(nombre);
        nuevoProducto.setDescripcion(descripcion);
        nuevoProducto.setPrecio(precio);

        oDao_Producto.insert(nuevoProducto);

        response.sendRedirect("Pages/Home.jsp");
    }
}
