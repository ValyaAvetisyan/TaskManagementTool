package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.enumPackage.Role;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import com.example.taskmanagementtool.security.CurrentUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserRepository userRepository;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String mainPage(ModelMap map) {
        log.info("Request [GET] /");

        map.addAttribute("user", new User());
        return "login";
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String login(ModelMap map) {
        log.info("Request [GET] /");
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("user", new User());
        return "login";
    }

    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSuccess() {
        log.info("login is successful");
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal.getUser().getRole() == Role.ADMIN) {
            log.info("the role of user is Admin");
            return "redirect:/admin";
        } if (principal.getUser().getRole() == Role.USER) {
            log.info("the role of user is User");
            return "redirect:/user";
        } if (principal.getUser().getRole() == Role.TEAM_LEAD) {
            log.info("the role of user is Team Lead");
            return "redirect:/teamLead";
        }
        return "redirect:/";
    }

    @GetMapping("/login")

    public String log(ModelMap map) {
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("user", new User());
        return "login";
    }

}
