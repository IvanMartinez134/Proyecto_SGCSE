package mx.edu.utez.proyecto_sgcse.controller;


import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CarreraDao;
import mx.edu.utez.proyecto_sgcse.model.Carrera;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@WebServlet (name = "ObtenerCarrerasServlet", value="/obtenerCarreras")


public class ObtenerCarrerasServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String div = req.getParameter("division");

        CarreraDao carreraDao = new CarreraDao();

        List<Carrera> carreras = carreraDao.obtenerCarrerasPorDivision(div);





        // Convertir la lista de carreras a formato JSON

        Gson gson = new Gson();
        String jsonCarreras = gson.toJson(carreras);


        //Configuracion
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");


        // Esto envia el json al javascript

        PrintWriter out = resp.getWriter();
        out.print(jsonCarreras);
        out.flush();
    }
}
