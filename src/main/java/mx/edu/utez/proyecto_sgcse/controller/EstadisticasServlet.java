package mx.edu.utez.proyecto_sgcse.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.TramiteDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;


@WebServlet(name = "EstadisticasServlet", value = "/obtenerTramites")
public class EstadisticasServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // Instancia del DAO para obtener los datos
        TramiteDao dao = new TramiteDao();
        Map<String, Integer> data = dao.obtenerEstTramites();

        // Convertir el mapa de datos a JSON usando Gson
        Gson gson = new Gson();
        String jsonData = gson.toJson(data);

        // Enviar el JSON en la respuesta
        try (PrintWriter out = resp.getWriter()) {
            out.print(jsonData);
            out.flush();
        }
    }
}

