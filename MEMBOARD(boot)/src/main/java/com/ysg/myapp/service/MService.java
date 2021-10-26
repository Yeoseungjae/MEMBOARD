package com.ysg.myapp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ysg.myapp.dao.MDAO;
import com.ysg.myapp.dto.Member;
import com.ysg.myapp.dto.Page;

@Service
public class MService {

	@Autowired
	private MDAO dao;
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;
	
	@Autowired
	BCryptPasswordEncoder pwEnc;;

	// 회원가입
	public ModelAndView mJoin(Member member) throws IllegalStateException, IOException {
		// System.out.println("[2]service : member -> " + member);

		// 입력받은 패스워드 -> 암호화 -> db로 전달
		member.setMPw(pwEnc.encode(member.getMPw()));
		
		// 파일 이름 가져오기(MProfile은 파일 자체, MprofileName이 파일이름)
		// MProfile > MProfileName
		MultipartFile MProfile = member.getMProfile();
		String MProfileName = MProfile.getOriginalFilename();

		// 주소 합치기
		member.setMAddr("("+member.getAddr1()+") " + member.getAddr2() + ", " + member.getAddr3());
		
		// 파일 저장위치
		String savePath = "C:/Users/82106/Desktop/승재/공부/오픈소스 강의/스프링/Project Files/MEMBOARD(boot)/src/main/webapp/resources/profile/"
				+ MProfileName;

		// 파일이 업로드 될 경우
		if (!MProfile.isEmpty()) {
			member.setMProfileName(MProfileName);
			MProfile.transferTo(new File(savePath));
		}

		int result = dao.mJoin(member);
		// System.out.println("[4]service : result -> " + result);
		if (result > 0) {
			mav.setViewName("M_Login");
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

	// 로그인
	public ModelAndView mLogin(Member member) {
		// System.out.println("[2]service : member -> " + member);
		Member encPw = dao.mView(member.getMId());
		
		// System.out.println("[4]service : encPw -> " + encPw);
		
		if(pwEnc.matches(member.getMPw(), encPw.getMPw())) {
			session.setAttribute("loginId", encPw.getMId());
			session.setAttribute("profile", encPw.getMProfileName());
			mav.setViewName("index");
		} else {
			mav.setViewName("M_Login");
		}
		return mav;
	}

	// 페이지 변수
	private static final int PAGE_LIMIT = 5;
	private static final int BLOCK_LIMIT = 5;

	// 회원목록
	public ModelAndView mList(int page) {
		// System.out.println("[2]service : page -> " + page);

		Page paging = new Page();

		int listCount = dao.mListCount();
		// System.out.println("[2-3]service : listCount -> " + listCount);

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

		List<Member> memberList = dao.mList(paging);
		// System.out.println("[4]service : memberList -> " + memberList);

		mav.addObject("memberList", memberList);
		mav.addObject("paging", paging);
		mav.setViewName("M_List");

		return mav;
	}

	// 회원 상세보기
	public ModelAndView mView(int page, String MId) {
		// System.out.println("[2]service : page -> " + page);
		// System.out.println("[2]service : MId -> " + MId);
		Member member = dao.mView(MId);
		// System.out.println("[4]service : member -> " + member);

		mav.addObject("page", page);
		mav.addObject("view", member);
		mav.setViewName("M_View");
		return mav;
	}

	public ModelAndView mModiForm(int page, String MId) {
		// System.out.println("[2]service : page -> " + page);
		// System.out.println("[2]service : MId -> " + MId);
		Member member = dao.mView(MId);
		// System.out.println("[4]service : member -> " + member);
		mav.addObject("page", page);
		mav.addObject("modify", member);
		mav.setViewName("M_Modify");

		return mav;
	}

	public ModelAndView mModify(int page, Member member) throws IllegalStateException, IOException {
		// System.out.println("[2]service : page -> " + page);
		// System.out.println("[2]service : member -> " + member);
		// 입력받은 패스워드 -> 암호화 -> db로 전달
		member.setMPw(pwEnc.encode(member.getMPw()));
		MultipartFile MProfile = member.getMProfile();
		String MProfileName = MProfile.getOriginalFilename();

		String savePath = "C:/Users/82106/Desktop/승재/공부/오픈소스 강의/스프링/Project Files/MEMBOARD(boot)/src/main/webapp/resources/profile/"+ MProfileName;

		if (!MProfile.isEmpty()) {
			MProfile.transferTo(new File(savePath));
		}

		member.setMProfileName(MProfileName);

		int result = dao.mModify(member);
		// System.out.println("[4]service : result -> " + result);
		
		if (result > 0) {
			mav.setViewName("redirect:M_view?MId="+member.getMId()+"&page="+page);
		} else {
			mav.setViewName("redirect:M_list?page="+page);
		}
		return mav;
	}

	public ModelAndView mDelete(int page, String MId) {
		// System.out.println("[2]service : page -> " + page);
		// System.out.println("[2]service : MId -> " + MId);
		int result = dao.mDelete(MId);
		// System.out.println("[4]service : result -> " + result);
		
		if (result > 0) {
			mav.setViewName("redirect:M_list?page="+page);
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

	public String idOverlap(String MId) {
		String idCheck = dao.idOverlap(MId);
		String result = null;
		
		if(idCheck==null) {
			result="OK";
		} else {
			result = "NO";
		}
		return result;
	}
}
