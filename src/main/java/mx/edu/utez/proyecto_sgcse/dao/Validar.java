package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.User;

public interface Validar {
   int validar (User user);
   int validar (String email, String pwd);


}
