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

@WebServlet(name = "UserServlet", value = "/login")
public class UserServlet extends HttpServlet {
    //init, destroy y doPost y/o doGet

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Aqui se va a conectar la base de datos para ubtener un usuario
        //Y en dado caso de que exita mandarlo al sistema (otra vista)

        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        UserDao dao = new UserDao();
        User u = dao.getOne(email,pwd);

        String ruta = "login.jsp";
        if(u.getEmail() != null){
            //Que el usuario si existe en la base de datos
            ruta = "index.jsp";

        }else {
            //quiere decir que el usuario no existe
            HttpSession session = req.getSession();
            session.setAttribute("mensaje","El usuario no existe en la base de datos " );
        }
        resp.sendRedirect(ruta);
    }

    public void destroy() {

    }

    public void init() throws ServletException {

    }
}
