package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.enumPackage.Status;
import com.example.taskmanagementtool.model.Issue;
import com.example.taskmanagementtool.model.Project;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.CommentRepository;
import com.example.taskmanagementtool.repository.IssueRepository;
import com.example.taskmanagementtool.repository.ProjectRepository;
import com.example.taskmanagementtool.repository.UserRepository;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AdminController {
    @Value("${taskmanagementtool.user.upload.path}")
    private String imageUploadPath;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IssueRepository issueRepository;
    @Autowired
    private ProjectRepository projectRepository;
    @Autowired
    private CommentRepository commentRepository;

    @GetMapping("/admin")
    public String userHome(ModelMap map) {
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("user", new User());
        map.addAttribute("projects", projectRepository.findAll());
        map.addAttribute("project", new Project());
        map.addAttribute("issues", issueRepository.findAll());
        map.addAttribute("issue", new Issue());
        return "admin";
    }

    @PostMapping("/admin/addUser")
    public String saveUser(ModelMap map, @Valid @ModelAttribute("user") User user, @RequestParam(value = "image") MultipartFile file, BindingResult result) throws IOException {
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("user", new User());
        File dir = new File(imageUploadPath);
        if (!dir.exists()) {
            dir.mkdir();
        }
        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File picture = new File(imageUploadPath + picName);
        file.transferTo(picture);
        user.setPicUrl(picName);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/admin?message=" + sb.toString();
        }
        userRepository.save(user);

        return "redirect:/admin";

    }

    @RequestMapping(value = "/user/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream(imageUploadPath + fileName);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }


    @PostMapping("/admin/addProject")
    public String addProject(ModelMap map, @Valid @ModelAttribute("project") Project project, BindingResult result) {
        map.addAttribute("project", new Project());
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/admin?message=" + sb.toString();
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        String dateInString = project.getEndDate();

        try {
            Date date = formatter.parse(project.getEndDate());
            project.setEndDate(date.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        projectRepository.save(project);
        return "redirect:/admin";
    }


 @PostMapping("/admin/addIssue")
    public String addIssue(ModelMap map, @Valid @ModelAttribute("issue")Issue issue, BindingResult result) {
        map.addAttribute("issue", new Issue());
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/admin?message=" + sb.toString();
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date date = formatter.parse(issue.getEndDate());
            issue.setEndDate(date.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        issueRepository.save(issue);
        return "redirect:/admin";
    }

}



