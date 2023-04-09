package com.example.photoblog_project.dao;


import com.example.photoblog_project.model.PBUser;
import com.example.photoblog_project.model.UserRole;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Example;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    @Resource
    UserRepository UserRepo;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        PBUser user = UserRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : user.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new User(user.getUsername(), user.getPassword(), authorities);
    }

    @Transactional
    public List<PBUser> getAllUser() {
        return UserRepo.findAll();
    }

    @Transactional
    public PBUser getUser(String username) {
        PBUser user = UserRepo.findById(username).orElse(null);
        return user;
    }

    @Transactional
    public void createAdminUser(String username, String password, String desc,String email,String phone, String[] roles) {
        PBUser user = new PBUser(username, password, phone, email, roles, desc);
        UserRepo.save(user);
    }

    @Transactional
    public void updateUserProfile(String username, String pwd, String phone, String email, String[] roles, String description) {
        PBUser user = new PBUser(username, pwd, phone, email, roles, description);
        UserRepo.save(user);
    }


    @Transactional
    public void deleteUser(String username) {
        PBUser user = UserRepo.findById(username).orElse(null);
        if (user == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        UserRepo.delete(user);
    }

    @Transactional
    public String createUserAccount(String userName, String password, String phone, String email, String description) throws IOException {
        String[] defaultRole = {"ROLE_USER"};
        PBUser newUserAcc = new PBUser(userName, password, phone, email, defaultRole, description);
        PBUser savedUserObj = UserRepo.save(newUserAcc);
        return savedUserObj.getUsername();
    }
}