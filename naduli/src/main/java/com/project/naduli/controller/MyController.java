package com.project.naduli.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.naduli.serviece.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyController {
	 @Autowired
	    MemberService memberService;
	    @GetMapping("/")
	    public String mainPage() {
	        return "main";
	    }

	    @GetMapping("/login")
	    public void login(){
	    }
	    
	    @GetMapping("/memberJoin")
	    public void goMemberJoin() {
	    	
	    }

}
