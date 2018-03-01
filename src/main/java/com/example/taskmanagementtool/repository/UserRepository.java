package com.example.taskmanagementtool.repository;


import com.example.taskmanagementtool.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findOneByEmail(String email);
}
