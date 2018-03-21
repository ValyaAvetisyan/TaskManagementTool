package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.model.Comment;

import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.repository.CommentRepository;
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
public class CommentController   {

    @Autowired
    private CommentRepository commentRepository;


    @GetMapping( value = "/user/issue/comment")
    public String userPage(ModelMap map){

        map.addAttribute("comments", commentRepository.findAll());
        map.addAttribute("comment", new Comment());


        return "comment";
    }

    @PostMapping("/user/addComment")
    public String addComment(@AuthenticationPrincipal UserDetails userDetails,ModelMap map,@RequestParam("id") int id, @Valid @ModelAttribute("comment")Comment comment, BindingResult result) {
        map.addAttribute("comment", new Comment());
       List<Comment> comments = commentRepository.findAllByIssueId(id);
        CurrentUser currentUser=(CurrentUser) userDetails;

        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/user?message=" + sb.toString();

        }
        comment.setUserId(currentUser.getUser());
//comment.setIssueId(id);
        commentRepository.save(comment);
        return "redirect:/user";
    }

    @GetMapping(value = "/user/printComment")
    public String printIssue(@AuthenticationPrincipal UserDetails userDetails, @RequestParam(value = "commentId", required = false) int id, ModelMap map) {
        boolean isValid = true;
        if (id < 0) {
            isValid = false;
        }
        CurrentUser currentUser=(CurrentUser) userDetails;
        List<Comment> comments =  commentRepository.findAllByIssueId(currentUser.getId());

        if (Objects.isNull(comments)) {
            isValid = false;
        }
        if (isValid) {
            map.addAttribute("comments", comments);
            return "myPage";
        }
        return "login";
    }}