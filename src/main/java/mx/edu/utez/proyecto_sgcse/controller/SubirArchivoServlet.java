package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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


        String jsonResponse = String.format("{\"mensaje\": \"Archivo subido\", \"doc:\": \"%s\"}", UPLOAD_DIR + "/" + fileName);
        out.print(jsonResponse);
        out.flush();
    }

}
