package com.bian.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bian.spring.entites.Course;
import com.bian.spring.service.LessonsServices;


@Controller
public class MainController {
	
	@Autowired
	private LessonsServices lessonServices;
	
	@RequestMapping("/header")
	public String header(){
		return "header";
	}
	
	@RequestMapping("/footer")
	public String footer(){
		return "footer";
	}
	
	@RequestMapping("/main")
	public String main(){
		return "main";
	}
	
	@RequestMapping("/left")
	public String left(){
		return "left";
	}
	
	@RequestMapping("/LoginHeader")
	public String LoginHeader(){
		return "LoginHeader";
	}
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping("/user_index")
	public String user_index(Map<String, Object> map,HttpServletRequest request){
		List<Course> courses = lessonServices.getRandomLesson();
		map.put("c",courses);
		request.setAttribute("cc", courses);
		System.out.println(courses);
		
		return "user_index";
	}
	
	@RequestMapping("/adminMenu")
	public String adminMenu(){
		return "adminMenu";
	}
	
	@RequestMapping("/courseContent")
	public String courseContent(){
		return "courseContent";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	
}
