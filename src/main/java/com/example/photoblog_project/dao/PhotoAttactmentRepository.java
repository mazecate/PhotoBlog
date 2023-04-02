package com.example.photoblog_project.dao;


import com.example.photoblog_project.model.PhotoAttactment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface PhotoAttactmentRepository extends JpaRepository<PhotoAttactment, UUID> {


}
