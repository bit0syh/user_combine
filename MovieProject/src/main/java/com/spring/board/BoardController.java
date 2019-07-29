package com.spring.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mypage.OneVO;

/**
 * @Class Name : MyPageController.java
 * @Description : MyPage Controller
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2019.07.25 박현민 최초생성
 * @author bit 2조
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *      Copyright (C) by Bit All right reserved.
 */

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	// 자유게시판 글쓰기
	@RequestMapping(value = "/boardFreeWrite.do", method = RequestMethod.GET)
	public String freeWrite(HttpSession session, HttpServletRequest request) {

		// 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_nickname = boardService.getMemberNickname(m_email); // System.out.println("=============MyPageController.java=====================
																		// nickname : " + m_nickname);
		request.setAttribute("m_nickname", m_nickname);

		return "board/free/boardFreeWrite";
	}

	// 자유게시판 글쓰기 - 새글 등록 액션
	@RequestMapping(value = "/boardFreeWriteAction.do", method = RequestMethod.POST)
	public String boardFreeWriteAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			FreeVO freeVO) {

		freeVO.setId(boardService.getMemberId((String) session.getAttribute("m_email")));

		// bf_title, bf_source bf_content의 앞뒤 공백 제거
		freeVO.setBf_title(freeVO.getBf_title().trim());
		freeVO.setBf_source(freeVO.getBf_source().trim());
		freeVO.setBf_content(freeVO.getBf_content().trim());

		try {
			int result = boardService.insertBoardFree(freeVO);
			if (result == 0) {
				return "redirect:/boardFreeWrite.do";
			}
		} catch (Exception e) {
			System.out.println("ERROR : boardFreeWriteAction - " + e.getMessage());
		}
		return "redirect:/boardFreeList.do";

	}

	// 자유게시판 글수정하기
	@RequestMapping(value = "/boardFreeUpdate.do", method = RequestMethod.GET)
	public String boardFreeUpdate(HttpSession session, HttpServletRequest request) {

		String m_email = (String) session.getAttribute("m_email");

		// 사용자의 id를 가져옴
		int id = boardService.getMemberId(m_email);

		// bf_bno=?의 작성자와 일치하는지 확인 후 일치하면 수정페이지로, 불일치하면 리스트로
		int bf_bno = Integer.parseInt(request.getParameter("bf_bno"));
		
		FreeVO selectBoardFree = boardService.selectBoardFree(bf_bno);


		if (id != selectBoardFree.getId()) {
			return "redirect:/boardFreeList.do";
		}
		
		request.setAttribute("selectBoardFree", selectBoardFree);

		return "board/free/boardFreeUpdate";
	}

	// 자유게시판 글수정하기 - 수정 액션
	@RequestMapping(value = "/boardFreeUpdateAction.do", method = RequestMethod.POST)
	public String boardFreeUpdateAction(HttpSession session, HttpServletRequest request, FreeVO freeVO) {

		// bf_title, bf_source bf_content의 앞뒤 공백 제거
		freeVO.setBf_title(freeVO.getBf_title().trim());
		freeVO.setBf_source(freeVO.getBf_source().trim());
		freeVO.setBf_content(freeVO.getBf_content().trim());

		try {
			int result = boardService.updateBoardFree(freeVO);
			if (result == 0) {
				return "redirect:/boardFreeUpdate.do?bf_bno=" + freeVO.getBf_bno();
			}
		} catch (Exception e) {
			System.out.println("ERROR : boardFreeUpdateAction - " + e.getMessage());
		}
		return "redirect:/boardFreeGet.do?bf_bno=" + freeVO.getBf_bno();
	}

	// 나눔게시판 글쓰기
	@RequestMapping(value = "/boardShareWrite.do", method = RequestMethod.GET)
	public String shareWrite(HttpSession session, HttpServletRequest request) {
		// 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_nickname = boardService.getMemberNickname(m_email); // System.out.println("=============MyPageController.java=====================
																		// nickname : " + m_nickname);
		request.setAttribute("m_nickname", m_nickname);

		return "board/share/boardShareWrite";
	}

	// 나눔게시판 글쓰기 - 새글 등록 액션
	@RequestMapping(value = "/boardShareWriteAction.do", method = RequestMethod.POST)
	public String boardShareWriteAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ShareVO shareVO) {

		shareVO.setId(boardService.getMemberId((String) session.getAttribute("m_email")));

		// bs_title, bs_content의 앞뒤 공백 제거
		shareVO.setBs_title(shareVO.getBs_title().trim());
		shareVO.setBs_content(shareVO.getBs_content().trim());

		try {
			int result = boardService.insertBoardShare(shareVO);
			if (result == 0) {
				return "redirect:/boardShareWrite.do";
			}
		} catch (Exception e) {
			System.out.println("ERROR : boardShareWriteAction - " + e.getMessage());
		}
		return "redirect:/boardShareList.do";

	}

	// 나눔게시판 글수정하기
	@RequestMapping(value = "/boardShareUpdate.do", method = RequestMethod.GET)
	public String boardShareUpdate(HttpSession session, HttpServletRequest request) {

		String m_email = (String) session.getAttribute("m_email");

		// 사용자의 id를 가져옴
		int id = boardService.getMemberId(m_email);

		int bs_bno = Integer.parseInt(request.getParameter("bs_bno"));
		ShareVO selectBoardShare = boardService.selectBoardShare(bs_bno);

		request.setAttribute("selectBoardShare", selectBoardShare);

		return "board/share/boardShareUpdate";

	}

	// 나눔게시판 글수정하기 - 수정 액션
	@RequestMapping(value = "/boardShareUpdateAction.do", method = RequestMethod.POST)
	public String boardShareUpdateAction(HttpSession session, HttpServletRequest request, ShareVO shareVO) {

		// bs_title, bs_content의 앞뒤 공백 제거
		shareVO.setBs_title(shareVO.getBs_title().trim());
		shareVO.setBs_content(shareVO.getBs_content().trim());

		try {
			int result = boardService.updateBoardShare(shareVO);
			if (result == 0) {
				return "redirect:/boardShareUpdate.do?bs_bno=" + shareVO.getBs_bno();
			}
		} catch (Exception e) {
			System.out.println("ERROR : boardShareUpdateAction - " + e.getMessage());
		}
		return "redirect:/boardShareGet.do?bs_bno=" + shareVO.getBs_bno();
	}

}
