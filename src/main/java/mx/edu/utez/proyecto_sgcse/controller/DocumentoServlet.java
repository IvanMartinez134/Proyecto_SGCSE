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
import java.io.InputStream;
import java.io.IOException;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name= "DocumentoServlet", value = "/subirDoc")
@MultipartConfig
public class DocumentoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Part docpart = request.getPart("documento");


        String nameDoc = docpart.getSubmittedFileName();

        String direccion = docpart.getSubmittedFileName();

        String guardadoRuta = request.getSession().getServletContext().getRealPath("/") + "descargas" + File.separator + nameDoc;

        File guardado = new File(guardadoRuta);

        if(!guardado.exists()){
            guardado.mkdirs();
        }

        try(InputStream fileContent = docpart.getInputStream()) {
            Files.copy(fileContent, Paths.get(direccion), StandardCopyOption.REPLACE_EXISTING);
        }


        Documento doc = new Documento();
        doc.setNombre(nameDoc);
        doc.setCta_id(doc.getCta_id());
        doc.setDireccion("descargas" + nameDoc);


        DocumentoDao dao = new DocumentoDao();
        boolean ingreso = dao.agregarDoc(doc);

        if(ingreso){
            request.getRequestDispatcher("subirDoc.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }



    }

}
