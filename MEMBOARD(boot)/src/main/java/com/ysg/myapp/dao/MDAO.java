package com.ysg.myapp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.ysg.myapp.dto.Member;
import com.ysg.myapp.dto.Page;

@Repository
public class MDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int mJoin(Member member) {
		// System.out.println("[3]dao : member -> " + member);
		return sql.insert("Member.mJoin", member);
	}

	public Member mLogin(Member member) {
		// System.out.println("[3]dao : member -> " + member);
		return sql.selectOne("Member.mLogin", member);
	}

	public int mListCount() {
		// System.out.println("[2-2]dao");
		return sql.selectOne("Member.mListCount");
	}

	public List<Member> mList(Page paging) {
		// System.out.println("[3]dao : paging -> " + paging);
		return sql.selectList("Member.mList", paging);
	}

	public Member mView(String MId) {
		// System.out.println("[3]dao : MId -> " + MId);
		return sql.selectOne("Member.mView", MId);
	}

	public int mModify(Member member) {
		// System.out.println("[3]dao : member -> " + member);
		return sql.update("Member.mModify", member);
	}

	public int mDelete(String MId) {
		// System.out.println("[3]dao : MId -> " + MId);
		return sql.delete("Member.mDelete", MId);
	}

	public String idOverlap(String MId) {
		return sql.selectOne("Member.idOverlap", MId);
	}

}
