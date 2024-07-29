package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import mx.edu.utez.proyecto_sgcse.dao.DocumentoDao;
import mx.edu.utez.proyecto_sgcse.model.Documento;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;


@WebServlet (name = "SubirDocServlet", value = "/subirDo")
@MultipartConfig
public class SubirDocServlet extends HttpServlet {


    private static final String UPLOAD_DIR = "descargas";



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("usr_id"); // Obtener userId de la sesión

        // Obtener citaId desde la sesión o DAO
        int citaId = (int) session.getAttribute("cta_id");

        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        // Ruta de subida
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        File file = new File(uploadPath + File.separator + fileName);
        try (InputStream input = filePart.getInputStream()) {
            java.nio.file.Files.copy(input, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }

        DocumentoDao dao = new DocumentoDao();
        Documento doc = new Documento();
        doc.setDireccion(UPLOAD_DIR + File.separator + fileName);
        doc.setCta_id(citaId);

        boolean success = dao.agregarDoc(doc);
        if (success) {
            response.sendRedirect("verPDF.jsp");
        } else {
            response.sendRedirect("Error.jsp");
        }
    }
}
