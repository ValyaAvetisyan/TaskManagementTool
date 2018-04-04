package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.Project;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.ProjectRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import com.example.taskmanagementtool.security.CurrentUser;
import jdk.internal.org.objectweb.asm.Handle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;

@Controller
public class TeamLeadController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IssueRepository issueRepository;
    @Autowired
    private ProjectRepository projectRepository;
    @GetMapping(value = "/teamLead")
    public String TeamLeadPage(ModelMap map, @AuthenticationPrincipal UserDetails userDetails) {
        CurrentUser currentUser = (CurrentUser) userDetails;
        map.addAttribute("user", userRepository.findOneByEmail(currentUser.getUsername()));
        map.addAttribute("issues", issueRepository.findAllByReporterIdId(currentUser.getId()));
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("project", new Project());
        map.addAttribute("projects",projectRepository.findAll());
        map.addAttribute("issue", new Issue());
        return "teamLead";
    }

    @GetMapping(value = "/teamLead/issues")
    public String printIssue(@AuthenticationPrincipal UserDetails userDetails, @RequestParam(value = "issueId", required = false) int id, ModelMap map) {
        boolean isValid = true;
        if (id < 0) {
            isValid = false;
        }
        CurrentUser currentUser = (CurrentUser) userDetails;
        List<Issue> issues = issueRepository.findAllByReporterIdId(currentUser.getId());

        if (Objects.isNull(issues)) {
            isValid = false;
        }
        if (isValid) {
            map.addAttribute("issues", issues);
            return "teamLead";
        }
        return "login";
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

    @GetMapping("/teamLead/deleteIssue")
    public String deleteIssue(@RequestParam("id") int id) {
        Issue issue = issueRepository.findOneById(id);
        issueRepository.delete(issue);
        return "redirect:/teamLead";
    }
}
