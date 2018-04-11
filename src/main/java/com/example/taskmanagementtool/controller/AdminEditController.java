package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class AdminEditController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping(value = "/admin/edit")
    public String adminEdit(@RequestParam("id") int id, ModelMap map) {
        User user = userRepository.findOne(id);
        map.addAttribute("user", user);
        return "adminEdit";
    }
    @PostMapping(value = "/admin/updateUser")
    public String printUser(@ModelAttribute("user") User user ) {
         userRepository.updateUserById(user.getName(),user.getSurname(),user.getRole().name(),user.getId());
        return "redirect:/adminEdit";
    }
}
