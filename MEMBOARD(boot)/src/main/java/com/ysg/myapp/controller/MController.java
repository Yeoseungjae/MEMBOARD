package com.ysg.myapp.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ysg.myapp.dto.Member;
import com.ysg.myapp.service.MService;

@Controller
public class MController {

	@Autowired
	private MService msvc;
	
	@Autowired
	private HttpSession session;
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	JavaMailSender mailsender;
	
	// 초기 실행화면 : 프로젝트 실행화면
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	// 초기 실행화면 : 프로젝트 실행화면
		@RequestMapping(value="/start", method = RequestMethod.GET)
		public String index2() {
			return "index";
		}
	
	// M_joinForm : 회원가입 페이지로 이동
	@RequestMapping(value="/M_joinForm", method = RequestMethod.GET)
	public String mJoinForm() {
		return "M_Join";
	}
	
	// M_loginForm : 로그인 페이지로 이동
	@RequestMapping(value="/M_loginForm", method = RequestMethod.GET)
	public String mLoginForm() {
		return "M_Login";
	}
	
	// M_join : 회원가입
	@RequestMapping(value="/M_join", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute Member member) throws IllegalStateException, IOException {
		System.out.println("[1]controller : member -> " + member);
		mav = msvc.mJoin(member);
		System.out.println("[5]controller : mav -> " + mav);
		return mav;
	}
	
	// M_login : 로그인
	@RequestMapping(value="/M_login", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute Member member) {
		// System.out.println("[1]controller : member -> " + member);
		
		mav = msvc.mLogin(member);
		// System.out.println("[5]controller : mav -> " + mav);
		
		return mav;
	}
	
	// M_logout : 로그아웃
	@RequestMapping(value="/M_logout", method = RequestMethod.GET)
	public String mLogout() {
		session.invalidate();
		return "index";
	}
	
	// M_list : 회원목록
	@RequestMapping(value="/M_list", method = RequestMethod.GET)
	public ModelAndView mList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		// 오류방지용
		if(page <= 0) {
			page = 1;
		}
		// System.out.println("[1]controller : page -> " + page);
		mav = msvc.mList(page);
		// System.out.println("[5]controller : mav -> " + mav);
		return mav;
	}
	
	// M_view : 회원 상세보기
	@RequestMapping(value="/M_view", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("MId") String MId) {
		
		// 오류방지용
		if(page <= 0) {
			page = 1;
		}
		
		// System.out.println("[1]controller : page -> " + page);
		// System.out.println("[1]controller : MId -> " + MId);
		mav = msvc.mView(page, MId);
		// System.out.println("[5]controller : mav -> " + mav);
		return mav;
	}
	
	// M_modiForm : 회원 수정 페이지로 이동
	@RequestMapping(value="/M_modiForm", method = RequestMethod.GET)
	public ModelAndView mModiForm(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("MId") String MId) {
		
		// 오류방지용
		if(page <= 0) {
			page = 1;
		}
		
		// System.out.println("[1]controller : page -> " + page);
		// System.out.println("[1]controller : MId -> " + MId);
		mav = msvc.mModiForm(page, MId);
		// System.out.println("[5]controller : mav -> " + mav);
		return mav;
	}
	
	// M_modify : 회원 수정
	@RequestMapping(value = "M_modify", method=RequestMethod.POST)
	public ModelAndView mModify(@RequestParam(value="page", required=false, defaultValue="1") int page, @ModelAttribute Member member) throws IllegalStateException, IOException{
		// System.out.println("[1]controller : page -> " + page);
		// System.out.println("[1]controller : member -> " + member);
		mav = msvc.mModify(page, member);
		// System.out.println("[5]controller : mav -> " + mav);
		return mav;
	}
	// M_delete : 회원 삭제
	@RequestMapping(value = "M_delete", method=RequestMethod.GET)
	public ModelAndView mDelete(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("MId") String MId){
		// System.out.println("[1]controller : page -> " + page);
		// System.out.println("[1]controller : MId -> " + MId);
		mav = msvc.mDelete(page, MId);
		// System.out.println("[5]controller : mav -> " + mav);
		return mav;
	}
	
	// A_idoverlap : 아이디 중복 검사
	@RequestMapping(value = "A_idoverlap", method=RequestMethod.POST)
	public @ResponseBody String idOverlap(@RequestParam("MId") String MId) {
		String result = msvc.idOverlap(MId);
		return result;
	}
	
	// A_emailConfirm : 이메일 인증번호 발송
	@RequestMapping(value = "A_emailConfirm", method=RequestMethod.GET)
	public @ResponseBody String emailConfirm(@RequestParam("MEmail") String MEmail) {
		String emailKey = emailKey(false, 7);
		
		MimeMessage mail = mailsender.createMimeMessage();
		
		String message = "<h2>안녕하세요. 인천일보 아카데미 입니다.</h2>"
						+ "<br/><p>인증번호는 " + emailKey + "입니다.</p>"
						+ "<p>인증번호를 인증번호 입력란에 입력해주세요</p>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";
		
		try {
			mail.setSubject("[본인인증] 인천일보 아카데미 인증메일입니다.", "utf-8");
			mail.setText(message, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(MEmail));
			mailsender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return emailKey;
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String emailKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		
		return init();
	}
	
	// 난수를 만드는 메소드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			
			if((num >=48 && num <= 57) || (num >=65 && num <= 90) || (num >=97 && num <= 122)) {
				sb.append((char)num);
			}
		} while(sb.length() < size);
		
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
}
