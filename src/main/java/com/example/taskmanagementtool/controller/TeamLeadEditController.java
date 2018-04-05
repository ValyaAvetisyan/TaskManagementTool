package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Comment;
import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.CommentRepository;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.ProjectRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TeamLeadEditController {

    @Autowired
    private IssueRepository issueRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProjectRepository projectRepository;
    @Autowired
    private CommentRepository commentRepository;


    @PostMapping(value = "/teamLead/updateIssue")
    public String printStatus(@ModelAttribute("issue") Issue issue, @RequestParam("id") int id) {
        issue.setId(id);
        issueRepository.save(issue);
        return "redirect:/teamLead";
    }


    @GetMapping(value = "/teamLead/editIssue")
    public String changeIssue(@RequestParam("id") int id, ModelMap map) {
        Issue issue = issueRepository.findOne(id);
        map.addAttribute("issue", issue);
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("projects", projectRepository.findAll());
        Comment comment = new Comment();
        comment.setIssue(issue);
        map.addAttribute("comment", comment);
        map.addAttribute("comments", commentRepository.findAllByIssueId(id));
        return "teamLeadEdit";
        }

        }
