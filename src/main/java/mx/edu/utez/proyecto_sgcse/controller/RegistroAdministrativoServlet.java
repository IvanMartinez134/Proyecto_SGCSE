
package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.dao.VentanillaDao;
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
        int turno = Integer.parseInt(req.getParameter("turno"));
        String tel = req.getParameter("tel");
        String pwd = req.getParameter("contrasena");
        String rPwd = req.getParameter("repetirContrasena");





        if (!pwd.equals(rPwd)) {
            req.setAttribute("errorRegistro", true);
            req.getRequestDispatcher("pageAdministrativo.jsp").forward(req, resp);
            return;
        }



        User nUser = new User();
        nUser.setNombre(nombre);
        nUser.setApll_1(apll_1);
        nUser.setApll_2(apll_2);
        nUser.setEmail(email);
        nUser.setTel(tel);
        nUser.setPwd(pwd);





        UserDao dao = new UserDao();
        boolean registroExitoso = dao.agregarVen(nUser);


        User u = dao.getOne(nUser.getEmail());
        VentanillaDao vdao = new VentanillaDao();
        vdao.agregarVen(u,turno);


        System.out.println(u.getId());


        if (registroExitoso) {

            HttpSession session = req.getSession();
            session.setAttribute("registroExitoso", true);
            resp.sendRedirect("registroAdminitivo.jsp");
        } else {
            req.setAttribute("errorRegistro", true);
            req.getRequestDispatcher("pageAdminitivo.jsp").forward(req, resp);
        }
    }


}