package com.example.photoblog_project.dao;

import com.example.photoblog_project.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
}

