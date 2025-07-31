package com.example.servlets;

import com.example.dao.TodoDao;
import com.example.model.Todo;
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
        String userId = request.getSession().getAttribute("userId").toString();
        Todo todo = new Todo();
        todo.setId(id);
        todo.setName(name);
        todo.setText(text);
        todo.setUserId(userId);
        todoDao.changeTodo(todo);
        response.sendRedirect("mytodos.jsp");
    }
}
