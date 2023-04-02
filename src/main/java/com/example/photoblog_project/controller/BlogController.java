package com.example.photoblog_project.controller;


import com.example.photoblog_project.dao.BlogService;
import com.example.photoblog_project.exception.PhotoAttactmenttNotFound;
import com.example.photoblog_project.exception.BlogNotFound;

import com.example.photoblog_project.model.Blog;
import com.example.photoblog_project.model.Comment;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Resource
    private BlogService tPhoto;


    // Controller methods, Form-backing object, ...
    @GetMapping(value = {"", "/list"})
    public String list(ModelMap model,Principal principal) {
        model.addAttribute("photoDatabase", tPhoto.getBlog());
        model.addAttribute("username", principal.getName());
        return "list";
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("add", "createForm", new Form());
    }

    public static class Form {
        private String title;
        private String body;
        private List<MultipartFile> attachments;

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        // Getters and Setters of customerName, subject, body, attachments


        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }

    @PostMapping("/create")
    public View create(Form form, Principal principal) throws IOException {
        long blogid = tPhoto.createBlog(principal.getName(), form.getTitle(),
                form.getBody(), form.getAttachments());
        return new RedirectView("/blog/view/" + blogid, true);
    }

    /*
        @GetMapping("/view/{ticketId}")
        public String view(@PathVariable("ticketId") long ticketId,
                           ModelMap model)
                throws PhotoNotFound {
            Blog ticket = tPhoto.getTicket(ticketId);
            model.addAttribute("ticketId", ticketId);
            model.addAttribute("ticket", ticket);


            return "view";
        }
    */
    @GetMapping("/view/{blogid}")
    public ModelAndView view(@PathVariable("blogid") long blogid,
                             ModelMap model ,Principal principal) throws BlogNotFound {
        Blog blog = tPhoto.getBlog(blogid);
        model.addAttribute("blogid", blogid);
        model.addAttribute("blog", blog);
        model.addAttribute("blog", blog);
        return new ModelAndView("view", "commentForm", new commentForm());
    }

    @PostMapping("/view/{blogid}")
    public ModelAndView view(@PathVariable("blogid") long blogid,
                             ModelMap model, Principal principal, Form form) throws BlogNotFound {

        tPhoto.createComment(blogid, principal.getName(),
                form.getBody());
        Blog blog = tPhoto.getBlog(blogid);

        model.addAttribute("blogid", blogid);
        model.addAttribute("blog", blog);

        return new ModelAndView("view", "commentForm", new commentForm());
    }
/*
    @GetMapping("/{ticketId}/attachment/{attachment:.+}")
    public View download(@PathVariable("ticketId") long ticketId,
                         @PathVariable("attachment") UUID attachmentId)
            throws CommentNotFound, PhotoNotFound {
        Comment attachment = tPhoto.getAttachment(ticketId, attachmentId);
        return new DownloadingView(attachment.getName(),
                attachment.getMimeContentType(), attachment.getContents());
    }

 */

    @GetMapping("/delete/{blogid}")
    public String deletBlog(@PathVariable("blogid") long blogid)
            throws BlogNotFound {
        tPhoto.delete(blogid);
        return "redirect:/blog/list";
    }

    @GetMapping("/{blogid}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("blogid") long blogid,
                                   @PathVariable("attachment") UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        tPhoto.deleteAttachment(blogid, attachmentId);
        return "redirect:/blog/view/" + blogid;
    }

    @GetMapping("/{blogid}/deletecomment/{comment:.+}")
    public String deleteComment(@PathVariable("blogid") long blogid,
                                @PathVariable("comment") UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        tPhoto.deleteComment(blogid, attachmentId);
        return "redirect:/blog/view/" + blogid;
    }

    @GetMapping("/{blogid}/deletecomment2/{comment:.+}")
    public String deleteComment2(@PathVariable("blogid") long blogid,
                                 @PathVariable("comment") UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        tPhoto.deleteComment(blogid, attachmentId);
        return "redirect:/blog/commenthistory";
    }

    @GetMapping("/{blogid}/deletecomment3/{comment:.+}")
    public String deleteComment3(@PathVariable("blogid") long blogid,
                                 @PathVariable("comment") UUID attachmentId)
            throws BlogNotFound, PhotoAttactmenttNotFound {
        tPhoto.deleteComment(blogid, attachmentId);
        return "redirect:/blog/own_commenthistory";
    }

    @GetMapping("/edit/{blogid}")
    public ModelAndView showEdit(@PathVariable("blogid") long blogId,
                                 Principal principal, HttpServletRequest request)
            throws BlogNotFound {
        Blog blog = tPhoto.getBlog(blogId);
        if (blog == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(blog.getCreateBy()))) {
            return new ModelAndView(new RedirectView("/blog/list", true));
        }

        ModelAndView modelAndView = new ModelAndView("edit");
        modelAndView.addObject("blog", blog);

        Form createForm = new Form();
        createForm.setBody(blog.getDescription());
        createForm.setTitle(blog.getTitle());

        modelAndView.addObject("createForm", createForm);

        return modelAndView;
    }

    @PostMapping("/edit/{blogId}")
    public String edit(@PathVariable("blogId") long blogId, Form form,
                       Principal principal, HttpServletRequest request)
            throws IOException, BlogNotFound {
        Blog blog = tPhoto.getBlog(blogId);
        if (blog == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(blog.getCreateBy()))) {
            return "redirect:/blog/list";
        }

        tPhoto.updateBlog(blogId, form.getTitle(),
                form.getBody(), form.getAttachments());
        return "redirect:/blog/view/" + blogId;
    }

    @ExceptionHandler({BlogNotFound.class, PhotoAttactmenttNotFound.class})
    public ModelAndView error(Exception e) {
        return new ModelAndView("error", "message", e.getMessage());
    }


    public static class commentForm {
        private String body;

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }
    }

    @GetMapping("/commenthistory")
    public String commenthistory(ModelMap model) {
        List<Blog> c = tPhoto.getBlog();
        model.addAttribute("commentDatabase", c);
        return "comment_history";
    }

    @GetMapping("/own_commenthistory")
    public String owncommenthistory(ModelMap model, Principal principal) {
        List<Comment> c = tPhoto.getCommentbyUsername(principal.getName());
        model.addAttribute("owncommentDatabase", c);
        return "own_comment_history";
    }

    @GetMapping("/upload_history")
    public String uploadhistory(ModelMap model) {
        List<Blog> ud = tPhoto.getBlog();
        model.addAttribute("uploadDatabase", ud);
        return "upload_history";
    }

    @GetMapping("/own_upload_history")
    public String ownuploadhistory(ModelMap model, Principal principal) {
        List<Blog> ud = tPhoto.getBlogByUsername(principal.getName());
        model.addAttribute("ownuploadDatabase", ud);
        return "own_upload_history";
    }


}

