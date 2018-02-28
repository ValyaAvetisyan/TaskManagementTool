package com.example.taskmanagementtool.model;

import com.example.taskmanagementtool.enumPackage.Gender;
import com.example.taskmanagementtool.enumPackage.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "user")
@Entity
public class User {
    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
   private int id;
    @Column
    private String name;
    @Column
    private String surname;
    @Column
    @Enumerated(EnumType.STRING)
    private Gender gender;
    @Column
    private String phone;
    @Column
    private String email;
    @Column
    private String password;
    @Column(name = "user_role")
    @Enumerated(EnumType.STRING)
    private Role role;
}
