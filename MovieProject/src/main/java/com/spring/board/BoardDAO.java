package com.spring.board;

import com.spring.member.MemberVO;
import com.spring.mypage.OneVO;

/**
* @Class Name : BoardDAO.java
* @Description : 
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.25     박현민      최초생성

* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

public interface BoardDAO {
	
	public String getMemberNickname(String m_email);	//멤버 닉네임 가져오기
	public MemberVO getMember(int id);
	public int getMemberId(String m_email);		//멤버 아이디 가져오기
	
	// 자유게시판 등록 / 수정
	public int insertBoardFree(FreeVO freeVO);	 // 자유게시판 등록
	public int updateBoardFree(FreeVO freeVO);	// 자유게시판 수정
	public FreeVO selectBoardFree(int bf_bno);	// 자유게시판 상세정보 가져오기

	// 나눔게시판 등록 / 수정
	public int insertBoardShare(ShareVO shareVO);	 // 나눔게시판 등록
	public int updateBoardShare(ShareVO shareVO);	// 나눔게시판 수정
	public ShareVO selectBoardShare(int bs_bno);	// 나눔게시판 상세정보 가져오기
		
	
}
