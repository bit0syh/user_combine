package com.spring.member;

public interface MemberDAO {
	public int insertMember(MemberVO vo);
	
	public MemberVO userCheck(String email);
	
	public MemberVO getMember(String email);
	
	public int updateMember(MemberVO vo);
	
	public void deleteMember(String email);
	
	public String findEmail(MemberVO vo);
	
	public MemberVO findPw(MemberVO vo);
}
