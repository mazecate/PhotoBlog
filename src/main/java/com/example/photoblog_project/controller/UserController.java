package com.example.photoblog_project.controller;

import com.example.photoblog_project.dao.UserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @GetMapping({"", "/", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("userList", userService.getAllUser());

        return "listUser";
    }

    public static class Form {
        private String username;
        private String password;
        private String description;
        private String phone;
        private String email;
        private String[] roles;

        // getters and setters for all properties
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

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addAdminUser", "PBUser", new Form());
    }

    @PostMapping("/create")
    public String create(Form form) throws IOException {
        userService.createAdminUser(form.getUsername(), form.getPassword(), form.getDescription(), form.getEmail(), form.getPhone(), form.getRoles());
        return "redirect:/user/list";
    }

    @GetMapping("/profile/{username}")
    public String profile(ModelMap model, @PathVariable("username") String username) {
//        model.addAttribute("username", username);
        model.addAttribute("userData", userService.getUser(username));
        return "profile";
//        return new ModelAndView("profile", "PBUser", new Form());
    }

    @GetMapping("/edit/{username}")
    public ModelAndView edit(ModelMap model, @PathVariable("username") String username) {
//        PBUser a = userService.getUser(username);
//        UserRole.debugUserRole(a.getRoles());
        model.addAttribute("userData", userService.getUser(username));
        return new ModelAndView("editUser", "PBUser", new Form());
    }

    @PostMapping("/edit/{username}")
    public String edit(Form form, @PathVariable("username") String username) throws IOException {
        userService.updateUserProfile(
                form.getUsername(), form.getPassword(),
                form.getPhone(), form.getEmail(), form.getRoles(), form.getDescription()
        );
        return "redirect:/user/list";
    }

    @GetMapping("/delete/{username}")
    public String deleteTicket(@PathVariable("username") String username) {
        userService.deleteUser(username);
        return "redirect:/user/list";
    }
}
