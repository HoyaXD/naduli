package com.project.naduli.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.naduli.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	public int regiMember(MemberVO membervo);


}
