package com.project.naduli.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.naduli.IService.IMemberService;
import com.project.naduli.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MemberController {
	
	@Autowired
	IMemberService memberservice;
	
	@RequestMapping(value ="/registerMember", method = RequestMethod.POST)
	public String regiMember(MemberVO membervo, String getId, String email, String tel, String postCode, String getAddress, String detailAddress, String extraAddress) {
		membervo.setId(getId+"@"+email);
		membervo.setAddress(getAddress + " " + detailAddress + " " + extraAddress);
		log.info(membervo.toString());
		memberservice.regiMember(membervo);

		return "main";
	}
	
	@RequestMapping(value ="/loginMember", method = RequestMethod.GET)
	public String login(@Param("id") String id, @Param("pw") String pw) {
		System.out.println(id + "-"+ pw);
		
		int result = memberservice.loginMember(id,pw);
		System.out.println(memberservice.loginMember(id,pw));
		if(result == 1) {
			return "성공";
		}else {
			return "로그인실패";
		}

		
	}

}
