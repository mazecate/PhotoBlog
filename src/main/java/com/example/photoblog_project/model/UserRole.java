package com.example.photoblog_project.model;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private int id;

    @Column(insertable = false, updatable = false)
    private String username;
    private String role;

    @ManyToOne
    @JoinColumn(name = "username")
    private PBUser PBUser;

    public UserRole() {
    }

    public UserRole(PBUser PBUser, String role) {
        this.PBUser = PBUser;
        this.role = role;
    }

    // getters and setters of all properties
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public PBUser getUser() {
        return PBUser;
    }

    public void setUser(PBUser PBUser) {
        this.PBUser = PBUser;
    }

    public static void debugUserRole(List<UserRole> ur) {
        System.out.println("@#3123123");
        System.out.println("@#3123123");
        System.out.println("@#3123123");
        System.out.println("@#3123123");
        System.out.println("@#3123123");
        System.out.println("@#3123123");
        for (UserRole r : ur) {
            System.out.println(r.getRole());
            System.out.println(r.getUsername());
            System.out.println("\r\n");
        }
    }
}