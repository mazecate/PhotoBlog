package com.example.photoblog_project.exception;

public class BlogNotFound extends  Exception {


    public BlogNotFound(long id) {
        super("Photoo " + id + " does not exist.");
    }

}
