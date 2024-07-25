package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mx.edu.utez.proyecto_sgcse.dao.DocumentoDao;
import mx.edu.utez.proyecto_sgcse.model.Documento;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name= "DocumentoServlet", value = "/doc")
@MultipartConfig
public class DocumentoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Cositas apra poder poner una carpeta
            String uploadPath = getServletContext().getRealPath("") + File.separator + "/descargas";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Se procesa el archivo
            Part filePart = request.getPart("file");
            if (filePart == null) {
                throw new ServletException("El archivo subido es nulo.");

            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);


            Documento documento = new Documento();
            documento.setDireccion(fileName);
            // Guardamos el nombre del archivo en el campo direccion



            // Se llama al método para agregar el documento en la base de datos
            DocumentoDao documentoDao = new DocumentoDao();
            boolean insertado = documentoDao.agregarDoc(documento);

            if (insertado) {

                response.sendRedirect(request.getContextPath() + "/verPDF?archivo=" + fileName);
            } else {

                response.getWriter().println("Error al insertar el documento.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error en la subida del archivo: " + e.getMessage());
        }
    }

}
