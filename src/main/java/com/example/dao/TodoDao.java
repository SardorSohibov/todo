package com.example.dao;

import com.example.model.Todo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class TodoDao {
    private static TodoDao instance;

    public static TodoDao getInstance() {
        if (instance == null) {
            instance = new TodoDao();
        }
        return instance;
    }


    public static void addTodo(Todo todo) {
        PreparedStatement preparedStatement = null;
        try (Connection connection = DatabaseConnector.getConnection()) {
            String sql = "insert into todos (id,name,todo_text,is_done,user_id) values (?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, todo.getId());
            preparedStatement.setString(2, todo.getName());
            preparedStatement.setString(3, todo.getText());
            preparedStatement.setBoolean(4, todo.isDone());
            preparedStatement.setString(5, todo.getUserId());
            preparedStatement.executeUpdate();
        } catch (Exception _) {

        }
    }

    public static void deleteTodo(String id) {
        PreparedStatement preparedStatement = null;
        try (Connection connection = DatabaseConnector.getConnection()) {
            String sql = "delete from todos where id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.execute();
        } catch (Exception e) {

        }
    }

    public static void markAsDone(String id) {
        PreparedStatement preparedStatement = null;
        try (Connection connection = DatabaseConnector.getConnection()) {
            String sql = "update todos set is_done = ? where id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBoolean(1, true);
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void changeTodo(String id, String newText, String newName) {
        PreparedStatement preparedStatement = null;
        try (Connection connection = DatabaseConnector.getConnection()) {
            String sql = "update todos set name = ?, todo_text = ? where id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, newText);
            preparedStatement.setString(2, newName);
            preparedStatement.setString(3, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Todo> getTodosByUserId(String userId) {
        ArrayList<Todo> todos = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try (Connection connection = DatabaseConnector.getConnection()) {
            String sql = "select * from todos where user_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Todo todo = new Todo();
                todo.setId(resultSet.getString("id"));
                todo.setName(resultSet.getString("name"));
                todo.setText(resultSet.getString("todo_text"));
                todo.setDone(resultSet.getBoolean("is_done"));
                todo.setUserId(resultSet.getString("user_id"));
                todos.add(todo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return todos;
    }
}
