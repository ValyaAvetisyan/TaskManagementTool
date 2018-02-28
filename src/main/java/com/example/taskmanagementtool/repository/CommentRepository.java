package com.example.taskmanagementtool.repository;

import com.example.taskmanagementtool.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository  extends JpaRepository<Comment,Integer>{

}
