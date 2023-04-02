package com.example.photoblog_project.dao;


import com.example.photoblog_project.model.Blog;
import com.example.photoblog_project.model.Comment;
import com.example.photoblog_project.model.PhotoAttactment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.awt.print.Book;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

public interface CommentRepository extends JpaRepository<Comment, UUID> {
    @Query("SELECT t FROM Comment t WHERE t.createBy = ?1")
    List<Comment> findByName(String title);


}
