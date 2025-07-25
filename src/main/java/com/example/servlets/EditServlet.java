package com.example.servlets;

import com.example.dao.TodoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    private static TodoDao todoDao = TodoDao.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("todoId");
        String name = request.getParameter("name");
        String text = request.getParameter("text");
        todoDao.changeTodo(id, text, name);
        response.sendRedirect("mytodos.jsp");
    }
}
