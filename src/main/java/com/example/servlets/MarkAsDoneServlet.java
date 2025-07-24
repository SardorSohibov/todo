package com.example.servlets;

import com.example.dao.TodoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/markasdone")
public class MarkAsDoneServlet extends HttpServlet {
    private static TodoDao todoDao = TodoDao.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String todoId = req.getParameter("todoId");
        todoDao.markAsDone(todoId);
        resp.sendRedirect("mytodos.jsp");
    }
}
