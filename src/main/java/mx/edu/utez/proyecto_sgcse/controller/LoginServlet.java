package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private UserDao dao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if ("Iniciar".equals(accion)) {
            String email = req.getParameter("email");
            String pwd = req.getParameter("pwd");

            User user = new User();
            user.setEmail(email);
            user.setPwd(pwd);

            int r = dao.validar(user);
            if (r == 1) {
                req.getSession().getAttribute("name");
                User u = dao.getOne(email, pwd);
                HttpSession session = req.getSession();
                session.setAttribute("usuario", u);
                resp.sendRedirect("pageAdmin.jsp");
            } else {
                resp.sendRedirect("index.jsp");
            }
        } else {
            resp.sendRedirect("index.jsp");
        }
    }
}

