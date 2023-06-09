package com.project.naduli.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String address;
	private String postCode;

}
