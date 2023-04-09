package com.example.photoblog_project.controller;

import com.example.photoblog_project.dao.BlogService;
import com.example.photoblog_project.dao.UserService;
import com.example.photoblog_project.model.Blog;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
public class IndexController {
    @Resource
    private BlogService blogService;

    @Resource
    private UserService userService;

//     Debug use
//    @GetMapping("/")
//    public String index() {
//        return "redirect:/blog/list";
//    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/")
    public String index(ModelMap model, Principal principal) {
        boolean isLogin = false;
        if (principal != null) {
            isLogin = true;
        }

        model.addAttribute("photoList", blogService.getBlog());
        model.addAttribute("userList", userService.getAllUser());
        return "index";
    }

    public static class RegisterForm {
        private String username;
        private String password;


        private String description;

        private String phone;

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        private String email;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }
    }
    @GetMapping("/register")
    public String register() {
//    public ModelAndView register() {
//        return new ModelAndView("register", "registerForm", new RegisterForm());
        return  "register";
    }

    @PostMapping("/register")
    public View register(RegisterForm form) throws IOException {
        System.out.println(form.getUsername() + "   " + form.getPassword());
        userService.createUserAccount(form.getUsername(), form.getPassword(),form.getPhone(),form.getDescription(),form.getEmail());
        return new RedirectView("/login", true);
    }

}
