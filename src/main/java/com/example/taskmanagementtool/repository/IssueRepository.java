package com.example.taskmanagementtool.repository;

import com.example.taskmanagementtool.model.Issue;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IssueRepository extends JpaRepository<Issue, Integer> {
    List<Issue> findAllByAssignToIdId(int id);
}
