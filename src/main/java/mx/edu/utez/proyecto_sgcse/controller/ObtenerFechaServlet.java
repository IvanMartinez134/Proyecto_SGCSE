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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="ObtenerFechaServlet", value = "/fechaServlet")
public class ObtenerFechaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fecha = request.getParameter("fecha_recoger");
        CitaDao citaDao = new CitaDao();

        List<Cita> citas = citaDao.getAllCitas(fecha);
        ArrayList<String> horas = new ArrayList<>();
        boolean hora_1 = false, hora_2 = false, hora_3 = false, hora_4 = false,
                hora_5 = false, hora_6 = false, hora_7 = false, hora_8 = false,
                hora_9 = false, hora_10 = false, hora_11 = false, hora_12 = false,
                hora_13 = false;

        horas.add("08:00:00");
        horas.add("09:00:00");
        horas.add("10:00:00");
        horas.add("11:00:00");
        horas.add("12:00:00");
        horas.add("13:00:00");
        horas.add("14:00:00");
        horas.add("15:00:00");
        horas.add("16:00:00");
        horas.add("17:00:00");
        horas.add("18:00:00");
        horas.add("19:00:00");
        horas.add("20:00:00");

        if (citas != null) {

            for (Cita c : citas) {

                if (c.getHora().equals("08:00:00") && !hora_1) {
                    horas.remove("08:00:00");
                    hora_1 = true;
                }
                if (c.getHora().equals("09:00:00") && !hora_2) {
                    horas.remove("09:00:00");
                    hora_2 = true;
                }
                if (c.getHora().equals("10:00:00") && !hora_3) {
                    horas.remove("10:00:00");
                    hora_3 = true;
                }
                if (c.getHora().equals("11:00:00") && !hora_4) {
                    horas.remove("11:00:00");
                    hora_4 = true;
                }
                if (c.getHora().equals("12:00:00") && !hora_5) {
                    horas.remove("12:00:00");
                    hora_5 = true;
                }
                if (c.getHora().equals("13:00:00") && !hora_6) {
                    horas.remove("13:00:00");
                    hora_6 = true;
                }
                if (c.getHora().equals("14:00:00") && !hora_7) {
                    horas.remove("14:00:00");
                    hora_7 = true;
                }
                if (c.getHora().equals("15:00:00") && !hora_8) {
                    horas.remove("15:00:00");
                    hora_8 = true;
                }
                if (c.getHora().equals("16:00:00") && !hora_9) {
                    horas.remove("16:00:00");
                    hora_9 = true;
                }
                if (c.getHora().equals("17:00:00") && !hora_10) {
                    horas.remove("17:00:00");
                    hora_10 = true;
                }
                if (c.getHora().equals("18:00:00") && !hora_11) {
                    horas.remove("18:00:00");
                    hora_11 = true;
                }
                if (c.getHora().equals("19:00:00") && !hora_12) {
                    horas.remove("19:00:00");
                    hora_12 = true;
                }
                if (c.getHora().equals("20:00:00") && !hora_13) {
                    horas.remove("20:00:00");
                    hora_13 = true;
                }
            }
        }


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
