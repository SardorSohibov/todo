package com.example.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@Getter
@Setter
@ToString
@Entity
@Table(name = "todos")
public class Todo {
    @Id
    private String id;
    private String name;
    @Column(name = "todo_text")
    private String text;
    private boolean isDone;
    private String userId;

    public Todo() {

    }

    public Todo(String name, String text, String userId) {
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.text = text;
        this.isDone = false;
        this.userId = userId;
    }


}
