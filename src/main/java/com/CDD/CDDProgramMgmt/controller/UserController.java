package com.CDD.CDDProgramMgmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.CDD.CDDProgramMgmt.entity.TUser;
import com.CDD.CDDProgramMgmt.service.UserService;

@RestController
@CrossOrigin(origins = "*") 
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/fildallusers")
	public List<TUser> getAllusers() {
		List<TUser> users = userService.findAllusers();
		return users;
	}
}
