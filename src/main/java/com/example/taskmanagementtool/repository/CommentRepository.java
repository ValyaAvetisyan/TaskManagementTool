package com.example.taskmanagementtool.repository;

import com.example.taskmanagementtool.model.Comment;
import com.example.taskmanagementtool.model.Issue;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository  extends JpaRepository<Comment,Integer>{
    List<Comment> findAllByIssueId(int id);

}
