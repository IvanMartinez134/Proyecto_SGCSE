package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "MostrarVentanillasServlet", value = "/mostrarVentanillas")
public class MostrarVentanillasServlet extends HttpServlet {

    private UserDao dao = new UserDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchText = request.getParameter("searchText");

        List<User> vents;

        if (searchText != null && !searchText.isEmpty()) {

            vents = dao.BuscarVen(searchText);
        } else {

            vents = dao.getAllVen();
        }

        request.setAttribute("users", vents);
        request.getRequestDispatcher("consVentanilla.jsp").forward(request, response);
    }



}
