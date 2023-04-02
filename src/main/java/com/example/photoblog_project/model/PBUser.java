package com.example.photoblog_project.model;

import jakarta.persistence.*;
import org.apache.commons.lang3.StringUtils;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class PBUser {
    @Id
    private String username;

    private String password;

    private String description;

    private String phone;
    private String email;

    @OneToMany(mappedBy = "PBUser", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserRole> roles = new ArrayList<>();
    public PBUser() {}


    // For admin user
    public PBUser(String username, String password, String desc, String[] roles) {
        this.username = username;
        this.password = "{noop}" + password;

        this.description = (StringUtils.isBlank(desc)) ? "" : desc;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }

    // For normal user
    public PBUser(String username, String password, String phone, String email, String[] roles) {
        this.username = username;
        this.password = "{noop}" + password;
        this.phone = phone;
        this.email = email;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }

    // For update user
    public PBUser(String username, String password, String phone, String email, String[] roles,String description) {
        this.username = username;
        this.password = "{noop}" + password;
        this.phone = phone;
        this.email = email;
        this.description = description;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<UserRole> getRoles() {
        return roles;
    }

    public void setRoles(List<UserRole> roles) {
        this.roles = roles;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
