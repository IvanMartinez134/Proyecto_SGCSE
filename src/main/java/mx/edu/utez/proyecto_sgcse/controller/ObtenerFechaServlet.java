package mx.edu.utez.proyecto_sgcse.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CarreraDao;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.model.Carrera;
import mx.edu.utez.proyecto_sgcse.model.Cita;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name="ObtenerFechaServlet", value = "/fechaServlet")
public class ObtenerFechaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fecha = request.getParameter("fecha_recoger");
        CitaDao citaDao = new CitaDao();

        List<Cita> citas = citaDao.getAllCitas(fecha);
        String[] horas = new String[16];
        for (Cita c : citas) {
            if (!c.getHora().equals("08:00:00")) {
                horas[0] = "08:00:00";
            }
            if (!c.getHora().equals("09:00:00")) {
                horas[1] = "09:00:00";
            }
            if (!c.getHora().equals("10:00:00")) {
                horas[2] = "10:00:00";
            }
            if (!c.getHora().equals("11:00:00")) {
                horas[3] = "11:00:00";
            }
        }

        System.out.println(horas[0]);
        System.out.println(horas[1]);
        System.out.println(horas[2]);

        // Convertir la lista de carreras a formato JSON

        Gson gson = new Gson();
        String jsonHoras = gson.toJson(horas);


        //Configuracion
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");


        // Esto envia el json al javascript

        PrintWriter out = response.getWriter();
        out.print(jsonHoras);
        out.flush();
    }
}
