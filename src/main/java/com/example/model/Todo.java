package com.example.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@Getter
@Setter
@ToString
public class Todo {
    private String id;
    private String name;
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
