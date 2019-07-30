package com.spring.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberVO;
import com.spring.mypage.MyPageDAO;
import com.spring.mypage.OneVO;

/**
 * @Class Name : BoardServiceImpl.java
 * @Description :
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2019.07.25 박현민 최초생성
 * 
 * @author bit 2조
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *      Copyright (C) by Bit All right reserved.
 */

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String getMemberNickname(String m_email) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		String m_nickname = boardDAO.getMemberNickname(m_email);
		
		return m_nickname;
	}

	@Override
	public MemberVO getMember(int id) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		MemberVO member = boardDAO.getMember(id);
		
		return member;
	}

	@Override
	public int insertBoardFree(FreeVO freeVO) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		int result = boardDAO.insertBoardFree(freeVO);
		
		return result;
	}

	@Override
	public int updateBoardFree(FreeVO freeVO) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		int result = boardDAO.updateBoardFree(freeVO);
		
		return result;
	}

	@Override
	public FreeVO selectBoardFree(int bf_bno) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		FreeVO freeVO = boardDAO.selectBoardFree(bf_bno);
		
		return freeVO;
	}

	@Override
	public int insertBoardShare(ShareVO shareVO) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		int result = boardDAO.insertBoardShare(shareVO);
		
		return result;
	}

	@Override
	public int updateBoardShare(ShareVO shareVO) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		int result = boardDAO.updateBoardShare(shareVO);
		
		return result;
	}

	@Override
	public ShareVO selectBoardShare(int bs_bno) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		ShareVO shareVO = boardDAO.selectBoardShare(bs_bno);
		
		return shareVO;
	}

	@Override
	public int getMemberId(String m_email) {
		BoardDAO boardDAO = sqlSession.getMapper(BoardDAO.class);
		int id = boardDAO.getMemberId(m_email);
		return id;
	}

}
