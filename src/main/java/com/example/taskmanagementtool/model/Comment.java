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
    @Column(name="from_id")
    @ManyToOne
    private int fromId;
    @Column(name = "to_id")
    @ManyToOne
    private int toId;
    @Column
    private String text;
    @Column
    private String timestamp;
}
