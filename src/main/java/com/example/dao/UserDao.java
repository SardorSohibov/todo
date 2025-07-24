package com.example.dao;

import com.example.model.User;

import java.util.ArrayList;
import java.util.Optional;

public class UserDao {
    private static UserDao instance;

    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    private static final ArrayList<User> users = new ArrayList<User>();

    public static void addUser(User user) {
        users.add(user);
    }

    public static Optional<User> getUser(String username) {
        return users.stream()
                .filter(user -> user.getUsername().equals(username))
                .findFirst();
    }
}
