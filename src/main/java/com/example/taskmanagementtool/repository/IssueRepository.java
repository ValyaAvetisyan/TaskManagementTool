package com.example.taskmanagementtool.repository;

import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface IssueRepository extends JpaRepository<Issue, Integer> {
    List<Issue> findAllByAssignToIdId(int id);
    List<Issue> findAllByReporterIdId(int id);
    Issue findOneById(int id);

    @Query(value = "UPDATE issue SET assign_to_id = :assignToId, status = :status, end_date = :endDate where id = :id", nativeQuery = true)
    @Transactional
    @Modifying
    void updateIssueById(@Param("assignToId") User assignToId, @Param("status") String status,
                         @Param("endDate") String endDate, @Param("id") int id);
}
