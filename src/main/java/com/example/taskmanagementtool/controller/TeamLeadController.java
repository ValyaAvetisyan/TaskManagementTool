package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.Project;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.ProjectRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class TeamLeadController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IssueRepository issueRepository;
    @Autowired
    private ProjectRepository projectRepository;

    @GetMapping( value = "/teamLead")
    public String userPage(ModelMap map){
        map.addAttribute("issues", issueRepository.findAll());
        map.addAttribute("issue", new Issue());
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("user", new User());
        map.addAttribute("projects", projectRepository.findAll());
        map.addAttribute("project", new Project());
        return "teamLead";
    }
    
    @PostMapping("/teamLead/addProject")
    public String addProject(ModelMap map, @Valid @ModelAttribute("project") Project project, BindingResult result) {
        map.addAttribute("project", new Project());
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/teamLead?message=" + sb.toString();
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

        try {
            Date date = formatter.parse(project.getEndDate());
            project.setEndDate(date.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        projectRepository.save(project);
        return "redirect:/teamLead";
    }
    @PostMapping("/teamLead/addIssue")
    public String addIssue(ModelMap map, @Valid @ModelAttribute("issue")Issue issue, BindingResult result) {
        map.addAttribute("issue", new Issue());
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/teamLead?message=" + sb.toString();
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date date = formatter.parse(issue.getEndDate());
            issue.setEndDate(date.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        issueRepository.save(issue);
        return "redirect:/teamLead";
    }


}
