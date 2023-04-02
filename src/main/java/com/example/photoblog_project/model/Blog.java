package com.example.photoblog_project.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "blog")
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    //@Column(name = "name")
    private String createBy;


    private String title;


    private String description;
    private String createAt;

    public String getTitle() {
        return title;
    }

    public void setTitle(String titile) {
        this.title = titile;
    }

    @OneToMany(mappedBy = "blog", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<PhotoAttactment> attachments = new ArrayList<>();

    @OneToMany(mappedBy = "blog", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Comment> comments = new ArrayList<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String creatrAt) {
        this.createAt = creatrAt;
    }


    // getters and setters of all properties


    public void deleteAttachment(PhotoAttactment photo) {
        photo.setBlog(null);
        this.attachments.remove(photo);
    }

    public void deleteComment(Comment c) {
        c.setBlog(null);
        this.comments.remove(c);
    }

    public List<PhotoAttactment> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<PhotoAttactment> attachments) {
        this.attachments = attachments;
    }


    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
