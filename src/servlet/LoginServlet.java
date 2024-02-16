package servlet;

import db.DbManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String result = DbManager.auth(email, password);

        if ("success".equals(result)) {
            User user = DbManager.getUserByEmail(email);
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("user.jsp");
        } else {
            String errorMessage = "Invalid login or password.";
            if ("emailError".equals(result)) {
                errorMessage = "Email not found.";
            } else if ("passwordError".equals(result)) {
                errorMessage = "Incorrect password.";
            }
            req.setAttribute("error", errorMessage);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
