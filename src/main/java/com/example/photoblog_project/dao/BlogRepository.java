package com.example.photoblog_project.dao;

import com.example.photoblog_project.model.Blog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface BlogRepository extends JpaRepository<Blog, Long> {


    @Query("SELECT t FROM Blog t WHERE t.createBy = ?1")
    List<Blog> findByName(String title);


}