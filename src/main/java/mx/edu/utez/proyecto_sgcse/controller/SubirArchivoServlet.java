package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.dao.DocumentoDao;
import mx.edu.utez.proyecto_sgcse.model.Cita;
import mx.edu.utez.proyecto_sgcse.model.Documento;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet (name= "SubirArchivosServlet", value = "/subirArchivosJS")
@MultipartConfig
public class SubirArchivoServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            if (uploadDir.mkdirs()) {
                System.out.println("Directory created: " + uploadFilePath);
            } else {
                System.err.println("Failed to create directory: " + uploadFilePath);
            }
        }

        List<String> filePaths = new ArrayList<>();
        boolean isSuccessful = true;

        try {
            for (Part part : request.getParts()) {
                System.out.println("Part received: " + part.getName() + ", size: " + part.getSize());

                if (part.getName().equals("archivo") && part.getSize() > 0) {
                    String fileName = part.getSubmittedFileName();
                    System.out.println("File received: " + fileName);

                    String filePath = uploadFilePath + File.separator + fileName;

                    // Asegúrate de que no haya conflictos de nombres de archivos
                    File file = new File(filePath);
                    if (file.exists()) {
                        throw new IOException("El archivo ya existe: " + filePath);
                    }

                    part.write(filePath);
                    String relativePath = UPLOAD_DIR + "/" + fileName;
                    filePaths.add(relativePath);
                    System.out.println("Archivo subido: " + relativePath);

                    DocumentoDao docDao = new DocumentoDao();
                    Documento d = new Documento();
                    d.setDireccion(relativePath);
                    d.setCta_id(Integer.parseInt(request.getParameter("cta_id")));

                    // Asegúrate de que la base de datos se actualiza correctamente
                    if (!docDao.agregarDoc(d)) {
                        isSuccessful = false;
                        throw new IOException("Error al guardar en la base de datos.");
                    }

                    System.out.println("Archivo guardado en la base de datos: " + relativePath);
                }
            }

            if (isSuccessful) {
                String jsonResponse = String.format("{\"mensaje\": \"Archivos subidos\", \"docs\": \"%s\"}", String.join(",", filePaths));
                out.print(jsonResponse);
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"mensaje\": \"Error al subir los archivos\"}");
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"mensaje\": \"Error al subir los archivos: " + e.getMessage() + "\"}");
            e.printStackTrace();
        } finally {
            out.flush();
        }


        /*
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();


        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Obtener el archivo subido
        Part filePart = request.getPart("archivo");
        String fileName = filePart.getSubmittedFileName();

        // Guardar el archivo en el servidor
        String filePath = uploadFilePath + File.separator + fileName;
        filePart.write(filePath);

        // Guardar el archivo en la sesssion
        String relativePath = UPLOAD_DIR + "/" + fileName;
        request.getSession().setAttribute("pdfPath", relativePath);

        DocumentoDao docDao = new DocumentoDao();
        Documento d = new Documento();
        d.setDireccion(relativePath);
        d.setCta_id(Integer.parseInt(request.getParameter("cta_id")));


        String jsonResponse = String.format("{\"mensaje\": \"Archivo subido\", \"doc:\": \"%s\"}", UPLOAD_DIR + "/" + fileName);
        out.print(jsonResponse);
        out.flush();

        System.out.println(relativePath);
        docDao.agregarDoc(d);
        */




    }

}
