package com.example.photoblog_project.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.Base64;
import java.util.UUID;

@Entity
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue
    @ColumnDefault("random_uuid()")
    private UUID id;


    private String createBy;


    private String createAt;
    private String body;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }


    @Column(name = "blog_id", insertable = false, updatable = false)
    private long blogId;

    @ManyToOne
    @JoinColumn(name = "blog_id")
    private Blog blog;






    // getters and setters of all properties

}

