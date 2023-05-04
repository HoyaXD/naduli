package com.project.naduli.serviece;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.naduli.IService.IMemberService;
import com.project.naduli.mapper.MemberMapper;
import com.project.naduli.vo.MemberVO;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	MemberMapper MemberMapper;
	
	@Override
	public int regiMember(MemberVO membervo) {
		int result = MemberMapper.regiMember(membervo);
		return result;
	}
	
	@Override
	public int loginMember(@Param("id")String id, @Param("pw")String pw) {
		int result = MemberMapper.loginMember(id, pw);
		return result;
	}

}
