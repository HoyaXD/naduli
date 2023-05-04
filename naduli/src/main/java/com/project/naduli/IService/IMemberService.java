package com.project.naduli.IService;

import org.apache.ibatis.annotations.Param;

import com.project.naduli.vo.MemberVO;

public interface IMemberService {
	
	public int regiMember(MemberVO membervo);
	
	public int loginMember(@Param("id")String id, @Param("pw")String pw);

}
