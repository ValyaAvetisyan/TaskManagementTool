package com.example.taskmanagementtool;

import com.example.taskmanagementtool.enumPackage.Gender;
import com.example.taskmanagementtool.enumPackage.Role;
import com.example.taskmanagementtool.model.User;
import com.example.taskmanagementtool.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SpringBootApplication
@EnableWebMvc
@EnableAsync
public class TaskmanagementtoolApplication extends WebMvcConfigurerAdapter implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(TaskmanagementtoolApplication.class, args);
	}

	@Autowired
	private UserRepository userRepository;
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		return resolver;
	}

	@Override
	public void run(String... strings) throws Exception {
		String email = "admin@mail.com";
		User oneByEmail = userRepository.findOneByEmail(email);
		if (oneByEmail == null) {
			userRepository.save(User.builder()
					.email(email)
					.password(new BCryptPasswordEncoder().encode("123456"))
					.name("admin")
					.surname("admin")
					.gender(Gender.female)
					.phone("055 000 000")
					.role(Role.ADMIN)
					.build());
		}

	}
}
