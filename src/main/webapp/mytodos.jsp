<%@ page import="com.example.model.Todo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.dao.TodoDao" %>
<%--
  Created by IntelliJ IDEA.
  User: sohib
  Date: 7/18/2025
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! private static TodoDao todoDao = TodoDao.getInstance();%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Todo App</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212;
            color: #e0f7fa;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            overflow-y: auto;
            padding-top: 3rem;
        }

        /* ADD BUTTON */
        .add-btn {
            position: fixed;
            top: 20px;
            right: 30px;
            background-color: #00ca4e;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s, transform 0.2s;
        }

        .add-btn:hover {
            background-color: #00e85f;
            transform: scale(1.05);
        }

        .card-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .card {
            width: 250px;
            height: 130px;
            padding: 1rem;
            background: rgba(40, 40, 40, 0.8);
            border-radius: 10px;
            backdrop-filter: blur(5px);
            border-bottom: 3px solid rgba(255, 255, 255, 0.2);
            border-left: 2px rgba(255, 255, 255, 0.3) outset;
            box-shadow: -20px 30px 40px rgba(0, 0, 0, 0.5);
            transform: skewX(10deg);
            transition: 0.4s;
            overflow: hidden;
        }

        .card:hover {
            height: 260px;
            transform: skew(0deg);
        }

        .align {
            display: flex;
            flex-direction: row;
            gap: 8px;
            padding-bottom: 0.5rem;
        }

        .btn {
            width: 14px;
            height: 14px;
            border-radius: 50%;
            box-shadow: -2px 2px 4px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }

        .done {
            background-color: #00ca4e;
        }

        .edit {
            background-color: #ffbd44;
        }

        .delete {
            background-color: #ff605c;
        }

        h1 {
            font-size: 1.1rem;
            text-align: center;
            margin: 0.5rem 0;
            color: #a7ffeb;
            text-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
        }

        p {
            font-size: 0.9rem;
            color: #b2dfdb;
            text-align: center;
            line-height: 1.4;
        }

        /* Modal background with :target */
        .modal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
        }

        .modal:target {
            display: flex;
        }

        .modal-content {
            background: rgba(40, 40, 40, 0.8);
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            max-width: 90%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .modal-content h2 {
            margin-top: 0;
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
        }

        .modal-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .modal-buttons a,
        .modal-buttons button {
            padding: 8px 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
        }

        .modal-buttons .save {
            background-color: #28a745;
            color: white;
        }

        .modal-buttons .cancel {
            background-color: #dc3545;
            color: white;
        }

        .modal-buttons .save:hover {
            background-color: #218838;
        }

        .modal-buttons .cancel:hover {
            background-color: #c82333;
        }

        .btn.done-button {
            background: none;
            border: none;
            padding: 0;
            margin: 0;
            cursor: pointer;
            outline: none;
        }

        .btn.done {
            display: inline-block;
            width: 24px;
            height: 24px;
            background-color: green;
            border-radius: 50%;
            text-align: center;
            line-height: 24px;
            color: white;
            font-weight: bold;
            font-size: 16px;
        }

        .btn.done:hover {
            background-color: darkgreen;
        }

        .btn.icon-button {
            background: none;
            border: none;
            padding: 0;
            margin: 0;
            cursor: pointer;
            outline: none;
        }

        .btn.edit, .btn.delete {
            display: inline-block;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            text-align: center;
            line-height: 24px;
            color: white;
            font-weight: bold;
            font-size: 16px;
        }

        .btn.edit {
            background-color: #007bff; /* blue */
        }

        .btn.edit:hover {
            background-color: #0056b3;
        }

        .btn.delete {
            background-color: #dc3545; /* red */
        }

        .btn.delete:hover {
            background-color: #a71d2a;
        }
    </style>
</head>

<body>

<% if (request.getMethod().equals("POST")) {
    String name = request.getParameter("name");
    String text = request.getParameter("text");
    Todo todo = new Todo(name, text, session.getId());
    TodoDao.addTodo(todo);
}%>

<!-- Modal -->
<div id="addModal" class="modal">
    <form method="post" action="/mytodos.jsp">

        <div class="modal-content">
            <h2>Add New Todo</h2>
            <div class="form-group">
                <label for="todoName">Name</label>
                <input type="text" id="todoName" placeholder="Enter todo name" required name="name">
            </div>
            <div class="form-group">
                <label for="todoText">Text</label>
                <textarea id="todoText" rows="4" placeholder="Enter todo details" required name="text"></textarea>
            </div>
            <div class="modal-buttons">
                <a href="#" class="cancel">Cancel</a>
                <button type="submit" class="save">Save</button>
            </div>
        </div>
    </form>
</div>
<a href="#addModal" class="add-btn">Add Todo</a>

<!-- TODO CARDS -->
<div class="card-container">
    <% ArrayList<Todo> todos = todoDao.getTodosByUserId(session.getId());
        for (Todo todo : todos) {%>
    <% if (!todo.isDone()) {%>
    <div class="card">
        <div class="align">

            <form method="post" action="/markasdone">
                <input type="hidden" name="todoId" value="<%= todo.getId() %>">
                <button type="submit" class="btn done-button" title="Mark as Done">
                    <span class="btn done">✓</span>
                </button>
            </form>

            <a href="#editModal_<%= todo.getId() %>" class="btn icon-button" title="Edit Todo">
                <span class="btn edit">🖉</span>
            </a>

            <form method="post" action="/delete">
                <input type="hidden" name="todoId" value="<%= todo.getId() %>">
                <button type="submit" class="btn icon-button" title="Delete Todo">
                    <span class="btn delete">⛔️</span>
                </button>
            </form>

        </div>
        <h1><%= todo.getName()  %>
        </h1>
        <p><%= todo.getText() %>
        </p>
    </div>
    <div id="editModal_<%= todo.getId() %>" class="modal">
        <form method="post" action="/edit">
            <div class="modal-content">
                <h2>Edit Todo</h2>
                <input type="hidden" name="todoId" value="<%= todo.getId() %>">

                <div class="form-group">
                    <label for="name_<%= todo.getId() %>">Name</label>
                    <input type="text" id="name_<%= todo.getId() %>" name="name"
                           value="<%= todo.getName() %>" required>
                </div>

                <div class="form-group">
                    <label for="text_<%= todo.getId() %>">Text</label>
                    <textarea id="text_<%= todo.getId() %>" name="text" rows="4" required><%= todo.getText() %></textarea>
                </div>

                <div class="modal-buttons">
                    <a href="#" class="cancel">Cancel</a>
                    <button type="submit" class="save">Save</button>
                </div>
            </div>
        </form>
    </div>

    <%
            }
        }
        for (Todo todo : todos) {
            if (todo.isDone()) {
    %>
    <div class="card">
        <div class="align">
            <form method="post" action="/delete">
                <input type="hidden" name="todoId" value="<%= todo.getId() %>">
                <button type="submit" class="btn icon-button" title="Delete Todo">
                    <span class="btn delete">⛔</span>
                </button>
            </form>
        </div>
        <h1>
            <del><%= todo.getName()  %>
            </del>
        </h1>
        <p>
            <del><%= todo.getText() %>
            </del>
        </p>
    </div>
    <%
            }
        }
    %>

</div>

</body>
</html>

