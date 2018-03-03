package com.example.taskmanagementtool.controller;

import com.example.taskmanagementtool.enumPackage.Role;
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

    @PostMapping("/addUser")
    public String saveUser(@Valid @ModelAttribute("user") User user, @RequestParam(value = "image") MultipartFile file ) throws IOException {
        File dir = new File(imageUploadPath);
        if (!dir.exists()) {
            dir.mkdir();
        }
        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File picture = new File(imageUploadPath + picName);
        file.transferTo(picture);
        user.setPicUrl(picName);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/";

    }

//    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
//    public String addBrand(@ModelAttribute(name = "product") Product product, @RequestParam(value = "image") MultipartFile file) throws IOException {
//        File dir = new File(imageUploadPath);
//        if (!dir.exists()) {
//            dir.mkdir();
//        }
//        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//        File picture = new File(imageUploadPath + picName);
//        file.transferTo(picture);
//        product.setPicUrl(picName);
//        productRepository.save(product);
//        return "redirect:/admin";
//    }

    @RequestMapping(value = "/user/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream(imageUploadPath + fileName);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }
    }



