package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.ProjectRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import com.example.taskmanagementtool.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Objects;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IssueRepository issueRepository;
    @Autowired
    private ProjectRepository projectRepository;

    @GetMapping( value = "/user")
    public String userPage(ModelMap map,@AuthenticationPrincipal UserDetails userDetails){
        CurrentUser currentUser=(CurrentUser) userDetails;

        map.addAttribute("issues", issueRepository.findAllByAssignToIdId(currentUser.getId()));
        map.addAttribute("issue", new Issue());
        map.addAttribute("users", userRepository.findAll());;
        map.addAttribute("user",new User());
    return "myPage";
    }

    @GetMapping(value = "/user/printIssue")
    public String printIssue(@AuthenticationPrincipal UserDetails userDetails, @RequestParam(value = "issueId", required = false) int id, ModelMap map) {
        boolean isValid = true;
        if (id < 0) {
            isValid = false;
        }
        CurrentUser currentUser=(CurrentUser) userDetails;
      List<Issue> issues =  issueRepository.findAllByAssignToIdId(currentUser.getId());

        if (Objects.isNull(issues)) {
            isValid = false;
        }
        if (isValid) {
            map.addAttribute("issues", issues);
            return "myPage";
        }
        return "login";
    }
}
