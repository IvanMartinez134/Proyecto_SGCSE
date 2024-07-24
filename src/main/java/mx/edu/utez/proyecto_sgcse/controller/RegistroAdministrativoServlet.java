
package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.awt.datatransfer.DataFlavor;
import java.io.IOException;

@WebServlet (name = "RegistroAdministrativoServlet", value = "/registroVetanilla")
public class RegistroAdministrativoServlet  extends HttpServlet {



    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String apll_1 = req.getParameter("apellidoPaterno");
        String apll_2 = req.getParameter("apellidoMaterno");
        String email = req.getParameter("correo");
        int tel = Integer.parseInt(req.getParameter("tel"));
        String pwd = req.getParameter("contrasena");
        String rPwd = req.getParameter("repetirContrasena");


        // Validar que las contraseñas coincidan
        if (!pwd.equals(rPwd)) {
            req.setAttribute("errorRegistro", true);
            req.getRequestDispatcher("pageAdministrativo.jsp").forward(req, resp);
            return;
        }

        // Crear un nuevo objeto User y configurar sus propiedades
        User nUser = new User();
        nUser.setNombre(nombre);
        nUser.setApll_1(apll_1);
        nUser.setApll_2(apll_2);
        nUser.setEmail(email);
        nUser.setTel(tel);
        nUser.setPwd(pwd);

        // Instanciar UserDao para manejar la lógica de base de datos
        UserDao dao = new UserDao();
        boolean registroExitoso = dao.agregarVen(nUser);

        // Redireccionar o enviar de vuelta al formulario según el resultado del registro
        if (registroExitoso) {
            HttpSession session = req.getSession();
            session.setAttribute("registroExitoso", true);
            resp.sendRedirect("consVentanilla.jsp");
        } else {
            req.setAttribute("errorRegistro", true);
            req.getRequestDispatcher("pageEst.jsp").forward(req, resp);
        }
    }


}