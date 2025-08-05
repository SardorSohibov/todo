package com.example.servlets;

import com.example.dao.TodoDao;
import com.example.model.Todo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class AddServlet extends HttpServlet {
    private static final TodoDao todoDao = TodoDao.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String text = request.getParameter("text");
        Todo todo = new Todo(name, text, (String) request.getSession().getAttribute("userId"));
        TodoDao.addTodo(todo);
        response.sendRedirect("mytodos.jsp");
    }
}
