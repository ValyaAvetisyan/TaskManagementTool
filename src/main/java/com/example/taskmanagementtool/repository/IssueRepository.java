package com.example.taskmanagementtool.repository;

import com.example.taskmanagementtool.model.Issue;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IssueRepository extends JpaRepository<Issue,Integer> {

}
