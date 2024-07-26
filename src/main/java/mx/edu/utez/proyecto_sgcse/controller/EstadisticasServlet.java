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

    private TramiteDao tramiteDao = new TramiteDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Map<String, Object>> estadisticas = tramiteDao.obtenerEstTramites();

        Gson gson = new Gson();
        String json = gson.toJson(estadisticas);

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        out.print(json);
        out.flush();
    }
}
