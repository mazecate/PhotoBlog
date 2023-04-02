package com.example.photoblog_project.dao;


import com.example.photoblog_project.exception.PhotoAttactmenttNotFound;
import com.example.photoblog_project.exception.BlogNotFound;

import com.example.photoblog_project.model.Blog;
import com.example.photoblog_project.model.Comment;
import com.example.photoblog_project.model.PhotoAttactment;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class BlogService {
    @Resource
    private BlogRepository tRepo;

    @Resource
    private PhotoAttactmentRepository aRepo;


    @Resource
    private CommentRepository cRepo;

    @Transactional
    public List<Blog> getBlog() {
        return tRepo.findAll();
    }

    @Transactional
    public List<Comment> getAllComment() {
        return cRepo.findAll();
    }

    @Transactional
    public Blog getBlog(long id)
            throws BlogNotFound {
        Blog blog = tRepo.findById(id).orElse(null);
        if (blog == null) {
            throw new BlogNotFound(id);
        }
        return blog;
    }

    @Transactional
    public List<Comment> getCommentbyUsername(String name) {
        List<Comment> b = cRepo.findByName(name);

        if (b == null) {
            System.out.print("nothing");
        }
        return b;
    }

    @Transactional
    public List<Blog> getBlogByUsername(String name) {
        List<Blog> b = tRepo.findByName(name);

        if (b == null) {
            System.out.print("nothing");
        }
        return b;
    }


    @Transactional
    public PhotoAttactment getAttachment(long blogid, UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        Blog blog = tRepo.findById(blogid).orElse(null);
        if (blog == null) {
            throw new BlogNotFound(blogid);
        }
        PhotoAttactment attachment = aRepo.findById(attachmentId).orElse(null);
        if (attachment == null) {
            throw new PhotoAttactmenttNotFound(attachmentId);
        }

        return attachment;
    }

    @Transactional
    public Comment getComment(long blogid, UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        Blog blog = tRepo.findById(blogid).orElse(null);
        if (blog == null) {
            throw new BlogNotFound(blogid);
        }
        Comment comment = cRepo.findById(attachmentId).orElse(null);
        if (comment == null) {
            throw new PhotoAttactmenttNotFound(attachmentId);
        }

        return comment;
    }

    @Transactional(rollbackFor = BlogNotFound.class)
    public void delete(long id) throws BlogNotFound {
        Blog deletedBlog = tRepo.findById(id).orElse(null);
        if (deletedBlog == null) {
            throw new BlogNotFound(id);
        }
        tRepo.delete(deletedBlog);
    }

    @Transactional(rollbackFor = PhotoAttactmenttNotFound.class)
    public void deleteAttachment(long blogid, UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        Blog blog = tRepo.findById(blogid).orElse(null);
        if (blog == null) {
            throw new BlogNotFound(blogid);
        }
        for (PhotoAttactment attachment : blog.getAttachments()) {
            if (attachment.getId().equals(attachmentId)) {
                blog.deleteAttachment(attachment);
                tRepo.save(blog);
                return;
            }
        }
        throw new PhotoAttactmenttNotFound(attachmentId);

    }

    @Transactional(rollbackFor = PhotoAttactmenttNotFound.class)
    public void deleteComment(long blogid, UUID commentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        Blog blog = tRepo.findById(blogid).orElse(null);
        if (blog == null) {
            throw new BlogNotFound(blogid);
        }
        for (Comment comment : blog.getComments()) {
            if (comment.getId().equals(commentId)) {
                blog.deleteComment(comment);
                tRepo.save(blog);
                return;
            }
        }
        throw new PhotoAttactmenttNotFound(commentId);
    }


    @Transactional
    public long createBlog(String customerName, String title,
                           String body, List<MultipartFile> attachments)
            throws IOException {
        Blog blog = new Blog();
        blog.setCreateBy(customerName);
        Date dateTime = new Date();
        blog.setCreateAt(dateTime.toString());
        blog.setTitle(title);
        blog.setDescription(body);

        for (MultipartFile filePart : attachments) {
            PhotoAttactment attachment = new PhotoAttactment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setBlog(blog);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                blog.getAttachments().add(attachment);
            }
        }


        Blog savedBlog = tRepo.save(blog);
        return savedBlog.getId();
    }

    @Transactional(rollbackFor = BlogNotFound.class)
    public void updateBlog(long id, String title,
                           String body, List<MultipartFile> attachments)
            throws IOException, BlogNotFound {
        Blog updatedBlog = tRepo.findById(id).orElse(null);
        if (updatedBlog == null) {
            throw new BlogNotFound(id);
        }
        updatedBlog.setDescription(body);
        updatedBlog.setTitle(title);


        for (MultipartFile filePart : attachments) {
            PhotoAttactment attachment = new PhotoAttactment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setBlog(updatedBlog);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedBlog.getAttachments().add(attachment);
            }
        }


        tRepo.save(updatedBlog);
    }


    @Transactional
    public long createComment(long id, String customerName,
                              String body) {

        Blog blog = tRepo.findById(id).orElse(null);

        Comment c = new Comment();
        c.setCreateBy(customerName);
        Date dateTime = new Date();
        c.setCreateAt(dateTime.toString());
        c.setBody(body);
        c.setBlog(blog);

        blog.getComments().add(c);
        return blog.getId();
    }
}
