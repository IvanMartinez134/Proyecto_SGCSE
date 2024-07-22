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

@WebServlet(name="ActualizarContraServlet", value = "/actualizarContra")
public class ActualizarContraServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        //Para buscar la info del usuario
        UserDao dao = new UserDao();
        User u = dao.getOne(id);
        HttpSession sesion = req.getSession();
        sesion.setAttribute("usuario", u);
        //despues mandarla a un formulario para su edición
        resp.sendRedirect("cambiarContra.jsp?id="+u.getId());
    }
}
