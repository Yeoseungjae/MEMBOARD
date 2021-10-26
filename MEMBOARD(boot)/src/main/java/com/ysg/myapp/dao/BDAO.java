package com.ysg.myapp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ysg.myapp.dto.Board;
import com.ysg.myapp.dto.Comment;
import com.ysg.myapp.dto.Page;

@Repository
public class BDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int bWrite(Board board) {
		// System.out.println("[3]dao : board ->" + board);
		return sql.insert("Board.bWrite", board);
	}

	public int bListCount() {
		return sql.selectOne("Board.bListCount");
	}

	public List<Board> bList(Page paging) {
		return sql.selectList("Board.bList", paging);
	}

	public Board bView(int BNo) {
		sql.update("Board.bHit", BNo);
		return sql.selectOne("Board.bView", BNo);
	}

	public Board bModiForm(int BNo) {
		return sql.selectOne("Board.bView", BNo);
	}

	public int bModify(Board board) {
		return sql.update("Board.bModify", board);
	}

	public int bDelete(int BNo) {
		return sql.delete("Board.bDelete", BNo);
	}

	public List<Board> bSearch(String selectVal, String keyword) {
		
		if(selectVal.equals("BWriter")) {
			return sql.selectList("Board.bsWriter",keyword);
		} else if(selectVal.equals("BTitle")) {
			return sql.selectList("Board.bsTitle",keyword);
		} else {
			return sql.selectList("Board.bsContent",keyword);
		}
	}

	public List<Comment> cList(int CBNo) {
		return sql.selectList("Board.cList", CBNo);
	}

	public int cWrite(Comment comment) {
		return sql.insert("Board.cWrite", comment);
	}

	public int cDelete(Comment comment) {
		return sql.delete("Board.cDelete", comment);
	}
}
