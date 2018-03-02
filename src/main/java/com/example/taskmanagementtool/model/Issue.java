package com.example.taskmanagementtool.model;

import com.example.taskmanagementtool.enumPackage.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "issue")
@Entity
public class Issue {
    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    private User reporterId;

    @ManyToOne
    private User assignToId;

    @ManyToOne
    private Project projectId;
    @Column
    private String name;
    @Column
    private String description;
    @Column
    @Enumerated(EnumType.STRING)
    private Status status;
    @Column(name = "created_date")
    private String createdDate;
    @Column(name = "end_date")
    private Date endDate;
}
