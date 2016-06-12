package com.library.domain;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Matexo on 2016-06-12.
 */
@Entity
@Table
public class Role implements Serializable{

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    Long id;

    @OneToOne
    @JoinColumn(name = "userId")
    private User user;

    private String role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
