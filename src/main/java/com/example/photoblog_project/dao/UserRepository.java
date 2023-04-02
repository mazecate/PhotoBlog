package com.example.photoblog_project.dao;

import com.example.photoblog_project.model.PBUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<PBUser, String> {
}
