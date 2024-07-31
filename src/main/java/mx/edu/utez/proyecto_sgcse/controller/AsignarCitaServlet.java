package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;

import java.io.IOException;


@WebServlet(name = "AsignarCitaServlet", value = "/asignarCita")
public class AsignarCitaServlet extends HttpServlet {
    private final CitaDao citaDao =  new CitaDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int vta_id = Integer.parseInt(request.getParameter("vta_id"));

        citaDao.asignarCita(id, vta_id);

    }

}
