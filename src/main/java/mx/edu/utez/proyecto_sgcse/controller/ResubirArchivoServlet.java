package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.dao.ComentarioDao;
import mx.edu.utez.proyecto_sgcse.dao.DocumentoDao;
import mx.edu.utez.proyecto_sgcse.model.Cita;
import mx.edu.utez.proyecto_sgcse.model.Documento;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

@WebServlet (name= "ResubirArchivosServlet", value = "/ResubirArchivosJS")
@MultipartConfig
public class ResubirArchivoServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";
    DocumentoDao docDao = new DocumentoDao();
    ComentarioDao comDao = new ComentarioDao();
    CitaDao citaDao = new CitaDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cta_id = Integer.parseInt(request.getParameter("cta_id"));

        comDao.eliminarComent(cta_id);
        docDao.eliminarDoc(cta_id);
        Cita cita = new Cita();
        cita.setId(cta_id);
        cita.setStatus(2);
        citaDao.updateCitaStatus(cita);

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            Collection<Part> parts = request.getParts();
            for (Part filePart : parts) {
                String fileName = filePart.getSubmittedFileName();
                String filePath = uploadFilePath + File.separator + fileName;
                filePart.write(filePath);

                // Guardar el archivo en la base de datos
                String relativePath = UPLOAD_DIR + "/" + fileName;
                Documento d = new Documento();
                d.setDireccion(relativePath);
                d.setCta_id(Integer.parseInt(request.getParameter("cta_id")));
                docDao.agregarDoc(d);
            }

            // Establecer mensaje en la sesión y redirigir al JSP
            request.getSession().setAttribute("mensaje", "Archivos subidos correctamente.");
            response.sendRedirect("subirDoc.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensaje", "Error al subir los archivos.");
            response.sendRedirect("resubirDoc.jsp");
        }
    }

}
