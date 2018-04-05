package com.example.taskmanagementtool.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private int id;
    @ManyToOne()
//    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne()
//    @JoinColumn(name = "issue_id")
    private Issue issue;
    @Column
    private String text;
    @Column
    private String timestamp;
}
