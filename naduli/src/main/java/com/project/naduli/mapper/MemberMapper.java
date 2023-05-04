package com.project.naduli.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.naduli.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	public int regiMember(MemberVO membervo);
	
	public int loginMember(@Param("id")String id, @Param("pw")String pw);


}
