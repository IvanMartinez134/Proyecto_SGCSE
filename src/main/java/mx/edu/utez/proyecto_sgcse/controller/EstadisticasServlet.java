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
import java.util.List;
import java.util.Map;


@WebServlet(name = "EstadisticasServlet", urlPatterns = {"/obtenerTramites"})
public class EstadisticasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TramiteDao tramiteDao = new TramiteDao();
        List<Map<String, Object>> tramites = tramiteDao.obtenerEstTramites();

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(new Gson().toJson(tramites));
        out.flush();
    }

}

