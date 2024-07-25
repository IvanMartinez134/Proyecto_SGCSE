package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.DocumentoDao;
import mx.edu.utez.proyecto_sgcse.model.Documento;

import java.io.IOException;

public class VerPdfServlet extends HttpServlet {



    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        DocumentoDao dao = new DocumentoDao();
        Documento doc = dao.obtenerDoc(id);


    }
}
