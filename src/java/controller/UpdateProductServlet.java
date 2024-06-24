package controller;

import service.Dao_Producto;
import db.ConexionSingleton;
import model.Producto;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Dao_Producto;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            int precio = Integer.parseInt((request.getParameter("precio")));

            ConexionSingleton oConexionSingleton = ConexionSingleton.getIntance();
            Dao_Producto oDao_Producto = new Dao_Producto(oConexionSingleton);

            Producto producto = new Producto();
            producto.setId(id);
            producto.setNombre(nombre);
            producto.setDescripcion(descripcion);
            producto.setPrecio(precio);

            oDao_Producto.update(producto);

            response.sendRedirect("Pages/Home.jsp");
        /*} catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }*/
    }
}
