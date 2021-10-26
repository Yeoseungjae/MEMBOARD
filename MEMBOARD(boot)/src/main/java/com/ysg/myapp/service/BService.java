package com.ysg.myapp.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ysg.myapp.dao.BDAO;
import com.ysg.myapp.dto.Board;
import com.ysg.myapp.dto.Comment;
import com.ysg.myapp.dto.Page;

@Service
public class BService {

	@Autowired
	private BDAO dao;
	private ModelAndView mav = new ModelAndView();

	public ModelAndView bWrite(Board board) throws IllegalStateException, IOException {
		// System.out.println("[2]service : board ->" + board);
		MultipartFile BFile = board.getBFile();
		String BFileName = BFile.getOriginalFilename();

		String savePath = "C:/Users/82106/Desktop/승재/공부/오픈소스 강의/스프링/Project Files/MEMBOARD(boot)/src/main/webapp/resources/boardUpload/"+ BFileName;

		if (!BFile.isEmpty()) {
			BFile.transferTo(new File(savePath));
		}

		// bFileName을 board객체에 추가하기
		board.setBFileName(BFileName);

		int result = dao.bWrite(board);
		// System.out.println("[4]service : result ->" + result);

		if (result > 0) {
			mav.setViewName("redirect:B_list");
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

	private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
	private static final int BLOCK_LIMIT = 5; // 한 페이지에 보여줄 페이지 번호 갯수

	public ModelAndView bList(int page) {
		Page paging = new Page();

		// 전체 게시글 갯수 조회
		int listCount = dao.bListCount();
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;

		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);

		List<Board> boardList = dao.bList(paging);
		mav.addObject("boardList", boardList);
		mav.addObject("paging", paging);
		mav.setViewName("B_List");

		return mav;
	}

	public ModelAndView bView(int page, int BNo) {
		Board board = dao.bView(BNo);
		mav.addObject("view", board);
		mav.addObject("page", page);
		mav.setViewName("B_View");

		return mav;
	}

	public ModelAndView bModiForm(int page, int BNo) {
		Board board = dao.bModiForm(BNo);

		mav.addObject("modify", board);
		mav.addObject("page", page);
		mav.setViewName("B_Modify");
		return mav;
	}

	public ModelAndView bModify(int page, Board board) throws IllegalStateException, IOException {
		// 파일 이름 불러오기
		MultipartFile BFile = board.getBFile();
		String BFileName = BFile.getOriginalFilename();

		// 파일 저장경로 설정하기 : 마지막에 '/' 꼭 써주기!
		String savePath = "C:/Users/82106/Desktop/승재/공부/오픈소스 강의/스프링/Project Files/MEMBOARD(boot)/src/main/webapp/resources/boardUpload/"+ BFileName;

		// 업로드 한 파일이 있을 경우
		if (!BFile.isEmpty()) {
			BFile.transferTo(new File(savePath));
		}

		// bFileName을 board객체에 추가하기
		board.setBFileName(BFileName);

		int result = dao.bModify(board);

		if (result > 0) {
			mav.setViewName("redirect:B_view?BNo=" + board.getBNo() + "&page=" + page);
		} else {
			mav.setViewName("redirect:B_list?page=" + page);
		}
		return mav;
	}

	public ModelAndView bDelete(int page, int BNo) {
		int result = dao.bDelete(BNo);

		if (result > 0) {
			mav.setViewName("redirect:B_list?page="+page);
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

	public ModelAndView bSearch(String selectVal, String keyword) {
		List<Board> sList = dao.bSearch(selectVal, keyword);
		
		mav.addObject("sList", sList);
		mav.setViewName("BS_List");
		return mav;
	}
	
	public List<Comment> cList(int CBNo) {
		List<Comment> commentList = dao.cList(CBNo);
		return commentList;
	}

	public List<Comment> cWrite(Comment comment) {
		List<Comment> commentList = null;
		int result = dao.cWrite(comment);
		
		if(result>0) {
			commentList = dao.cList(comment.getCBNo());
		} else {
			commentList = null;
		}
		return commentList;
	}

	public List<Comment> cDelete(Comment comment) {
		List<Comment> commentList = null;
		int result = dao.cDelete(comment);
		
		if(result>0) {
			commentList = dao.cList(comment.getCBNo());
		} else {
			commentList = null;
		}
		return commentList;
	}
}
