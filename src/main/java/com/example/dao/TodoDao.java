package com.example.dao;

import com.example.model.Todo;

import java.util.ArrayList;
import java.util.stream.Collectors;

public class TodoDao {
    private static TodoDao instance;

    public static TodoDao getInstance() {
        if (instance == null) {
            instance = new TodoDao();
        }
        return instance;
    }


    private static final ArrayList<Todo> todos = new ArrayList<>();

    public static void addTodo(Todo todo) {
        todos.add(todo);
    }

    public static void deleteTodo(String id) {
        todos.removeIf(t -> t.getId().equals(id));
    }
    public static void markAsDone(String id) {
        for (int i = 0; i < todos.size(); i++) {
            if (todos.get(i).getId().equals(id)) {
                todos.get(i).setDone(true);
            }
        }
    }
    public static void changeTodo(String id, String newText, String newName) {
        for (int i = 0; i < todos.size(); i++) {
            if (todos.get(i).getId().equals(id)) {
                todos.get(i).setText(newText);
                todos.get(i).setName(newName);
            }
        }
    }

    public ArrayList<Todo> getTodosByUserId(String userId) {
        return todos.stream()
                .filter(t -> t.getUserId().equals(userId))
                .collect(Collectors.toCollection(ArrayList::new));
    }
}
