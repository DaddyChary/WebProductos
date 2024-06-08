package service;

import service.Dao_Producto;
import db.ConexionSingleton;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Producto;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ConexionSingleton oConexionSingleton = ConexionSingleton.getIntance();
        Dao_Producto oDao_Producto = new Dao_Producto(oConexionSingleton);

        Producto nuevoProducto = new Producto();
        nuevoProducto.setId(id);

        oDao_Producto.delete(nuevoProducto);

        response.sendRedirect("index.jsp");
    }
}
