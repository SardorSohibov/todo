package com.example.dao;

import com.example.model.Todo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TodoDao {
    private static TodoDao instance;
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("TodoPU");

    public static TodoDao getInstance() {
        if (instance == null) {
            instance = new TodoDao();
        }
        return instance;
    }


    public static void addTodo(Todo todo) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(todo);
        em.getTransaction().commit();
    }

    public static void deleteTodo(String id) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Todo todo = em.find(Todo.class, id);
        if (todo != null) {
            em.remove(todo);
        }
        em.getTransaction().commit();
        em.close();
    }

    public static void markAsDone(String id) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Todo todo = em.find(Todo.class, id);
        todo.setDone(true);
        em.merge(todo);
        em.getTransaction().commit();
        em.close();
    }

    public static void changeTodo(Todo todo) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(todo);
        em.getTransaction().commit();
    }

    public List<Todo> getTodosByUserId(String userID) {
        List<Todo> todos = new ArrayList<>();
        try {
            EntityManager em = emf.createEntityManager();
            TypedQuery<Todo> query = em.createQuery("from Todo t where t.userId = :userID", Todo.class);
            query.setParameter("userID", userID);
            todos = query.getResultList();
            em.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return todos;
    }
}
