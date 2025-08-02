package com.subjectstories;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setAttribute("username", username);

        response.sendRedirect("home.jsp");
    }
}