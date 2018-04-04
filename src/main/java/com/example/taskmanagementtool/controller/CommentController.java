package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Comment;
import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.repository.CommentRepository;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.security.CurrentUser;
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
import java.util.List;
import java.util.Objects;

@Controller
public class CommentController {

    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private IssueRepository issueRepository;


    @PostMapping("/user/issue/addComment")
    public String userAddComment(@AuthenticationPrincipal UserDetails userDetails, @Valid @ModelAttribute("comment") Comment comment, BindingResult result) {
        CurrentUser currentUser = (CurrentUser) userDetails;
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage()).append("<br>");
            }

            return "redirect:/user?message=" + sb.toString();
        }
comment.setUserId(currentUser.getUser());
        commentRepository.save(comment);
        return "redirect:/user";
    }


    @PostMapping("/teamLead/issue/addComment")
    public String teamLeadAddComment(@AuthenticationPrincipal UserDetails userDetails, @Valid @ModelAttribute("comment") Comment comment, BindingResult result) {
        CurrentUser currentUser = (CurrentUser) userDetails;
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage()).append("<br>");
            }
            return "redirect:/teamLead?message=" + sb.toString();
        }
        comment.setUserId(currentUser.getUser());
        commentRepository.save(comment);
        return "redirect:/teamLead";
    }

}

