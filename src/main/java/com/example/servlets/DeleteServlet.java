package com.example.servlets;

import com.example.dao.TodoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class DeleteServlet extends HttpServlet {
    private static TodoDao todoDao = TodoDao.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String todoId = request.getParameter("todoId");
        todoDao.deleteTodo(todoId);
        response.sendRedirect("mytodos.jsp");
    }
}
