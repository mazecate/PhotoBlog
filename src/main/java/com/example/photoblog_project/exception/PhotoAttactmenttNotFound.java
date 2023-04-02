package com.example.photoblog_project.exception;

import java.util.UUID;

public class PhotoAttactmenttNotFound extends  Exception{

    public PhotoAttactmenttNotFound(UUID id) {
        super("comment " + id + " does not exist.");
    }

}
