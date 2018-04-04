package com.example.taskmanagementtool.repository;


import com.example.taskmanagementtool.enumPackage.Role;
import com.example.taskmanagementtool.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findOneByEmail(String email);

    User findOneById(int id);

    @Query(value = "UPDATE user SET name = :name, surname = :surname, user_role = :role where id = :id", nativeQuery = true)
    @Transactional
    @Modifying
    void updateUserById(@Param("name") String name, @Param("surname") String surname,
                        @Param("role") String role, @Param("id") int id);
}
