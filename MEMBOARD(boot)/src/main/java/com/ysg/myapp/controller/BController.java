package com.ysg.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ysg.myapp.dto.Board;
import com.ysg.myapp.dto.Comment;
import com.ysg.myapp.service.BService;

@Controller
public class BController {

	@Autowired
	private BService bsvc;
	private ModelAndView mav = new ModelAndView();
	
	// B_writeForm : 게시글 작성 페이지이동
	@RequestMapping(value = "B_writeForm", method=RequestMethod.GET)
	public String writeForm() {
		return "B_Write";
	}
	
	// B_write : 게시글 작성
	@RequestMapping(value = "B_write", method=RequestMethod.POST)
	public ModelAndView bWrite(@ModelAttribute Board board) throws IllegalStateException, IOException {
		// System.out.println("[1]controller : board ->" + board);
		mav = bsvc.bWrite(board);
		return mav;
	}
	
	// B_list : 게시글 목록보기
	@RequestMapping(value = "B_list", method=RequestMethod.GET)
	public ModelAndView bList(@RequestParam(value="page", required=false, defaultValue="1") int page){
		// required=false : 필수로 page값을 받아오지 않아도 된다! / true일 경우 "B_list"로 page값을 꼭 같이 보내줘야 한다.
		// defaultValue="1" : page값이 넘어 오지 않는다면 기본값은 1로 설정
		
		// 오류방지용
		if(page<=0) {
			page = 1;
		}
		mav = bsvc.bList(page);
		return mav;
	}
	
	// B_view : 게시글 상세보기
	@RequestMapping(value = "B_view", method=RequestMethod.GET)
	public ModelAndView bView(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("BNo") int BNo){
		mav = bsvc.bView(page, BNo);
		return mav;
	}
	
	// B_modiForm : 게시글 수정페이지 이동
	@RequestMapping(value = "B_modiForm", method=RequestMethod.GET)
	public ModelAndView bModiForm(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("BNo") int BNo){
		mav = bsvc.bModiForm(page, BNo);
		return mav;
	}
	
	// B_modify : 게시글 수정
	@RequestMapping(value = "B_modify", method=RequestMethod.POST)
	public ModelAndView bModify(@RequestParam(value="page", required=false, defaultValue="1") int page, @ModelAttribute Board board) throws IllegalStateException, IOException{
		mav = bsvc.bModify(page, board);
		return mav;
	}
	
	// B_delete : 게시글 삭제
	@RequestMapping(value = "B_delete", method=RequestMethod.GET)
	public ModelAndView bDelete(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("BNo") int BNo){
		mav = bsvc.bDelete(page, BNo);
		return mav;
	}
	
	// B_search : 게시글 검색
	@RequestMapping(value = "B_search", method=RequestMethod.GET)
	public ModelAndView bSearch(@RequestParam("selectVal") String selectVal, @RequestParam("keyword") String keyword) {
		mav = bsvc.bSearch(selectVal, keyword);
		return mav;
	}
	
	// C_list : 댓글 리스트 불러오기
	
	@RequestMapping(value = "C_list", method=RequestMethod.POST)
	public @ResponseBody List<Comment> cList(@RequestParam("CBNo") int CBNo){
		List<Comment> commentList = bsvc.cList(CBNo);
		return commentList;
	}
	
	// C_write : 댓글 작성
	@RequestMapping(value = "C_write", method=RequestMethod.POST)
	public @ResponseBody List<Comment> cWrite(@ModelAttribute Comment comment){
		List<Comment> commentList = bsvc.cWrite(comment);
		return commentList;
	}
	
	// C_delete : 댓글 삭제
	@RequestMapping(value = "C_delete", method=RequestMethod.GET)
	public @ResponseBody List<Comment> cDelete(@ModelAttribute Comment comment){
		List<Comment> commentList = bsvc.cDelete(comment);
		return commentList;
	}
}
