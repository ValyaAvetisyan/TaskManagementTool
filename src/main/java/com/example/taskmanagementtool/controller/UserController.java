package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Comment;
import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.CommentRepository;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.ProjectRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import com.example.taskmanagementtool.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private CommentRepository commentRepository;

    @GetMapping(value = "/user")
    public String userPage(ModelMap map, @AuthenticationPrincipal UserDetails userDetails) {
        CurrentUser currentUser = (CurrentUser) userDetails;

        map.addAttribute("issues", issueRepository.findAllByAssignToIdId(currentUser.getId()));
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("user", userRepository.getOne(currentUser.getId()));
        return "myPage";
    }

    @GetMapping(value = "/user/printIssue")
    public String printIssue(@AuthenticationPrincipal UserDetails userDetails, @RequestParam(value = "issueId", required = false) int id, ModelMap map) {
        boolean isValid = true;
        if (id < 0) {
            isValid = false;
        }
        CurrentUser currentUser = (CurrentUser) userDetails;
        List<Issue> issues = issueRepository.findAllByAssignToIdId(currentUser.getId());

        if (Objects.isNull(issues)) {
            isValid = false;
        }
        if (isValid) {
            map.addAttribute("issues", issues);
            return "myPage";
        }
        return "login";
    }

    @PostMapping(value = "/user/updateIssue")
    public String printStatus(@ModelAttribute("issue") Issue issue) {
        issueRepository.updateIssueById(issue.getAssignToId(),issue.getStatus().name(),issue.getEndDate(),issue.getId());
        return "redirect:/user";
    }


    @GetMapping(value = "/user/issueDetail")
    public String changeUserData(@RequestParam("id") int id, ModelMap map) {
        Issue issue = issueRepository.findOne(id);
        map.addAttribute("issue", issue);
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("projects", projectRepository.findAll());
        Comment comment = new Comment();
        comment.setIssue(issue);
        map.addAttribute("comment", comment);
        map.addAttribute("comments", commentRepository.findAllByIssueId(id));
        return "issueDetail";
    }

    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String verify(@RequestParam("token") String token, @RequestParam("email") String email) {
        User oneByEmail = userRepository.findOneByEmail(email);
        if (oneByEmail != null) {
            if (oneByEmail.getToken() != null && oneByEmail.getToken().equals(token)) {
                oneByEmail.setToken(null);
                oneByEmail.setVerify(true);
                userRepository.save(oneByEmail);
            }
        }
        return "redirect:/login";
    }


}
