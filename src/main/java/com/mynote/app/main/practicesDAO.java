package com.mynote.app.main;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class practicesDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, Object>> test() {
		List<Map<String, Object>> test = sqlSession.selectList("myNoteTest.test");
		return test;
	}

	// 로그인 아이디/비밀번호 체크
	public Integer checkLogin(Map<String, Object> info) {
		Integer result = sqlSession.selectOne("myNoteTest.checkLogin", info);
		return result;
	}

	// 게시글 페이징 토탈
	public int total() {
		return sqlSession.selectOne("myNoteTest.total");
	}

	// 게시글 리스트
	public List<Map<String, Object>> list(Map<String, Object> map) {
		return sqlSession.selectList("myNoteTest.boardList", map);
	}

	// 게시글작성
	public void createBoard(Map<String, Object> map) {
		sqlSession.insert("myNoteTest.createBoard", map);
	}

	// 유저번호
	public int userNum(String info) {
		return sqlSession.selectOne("myNoteTest.userNum", info);
	}

	// 게시판 디테일
	public List<Map<String, Object>> boardDetail(String info) {
		return sqlSession.selectList("myNoteTest.boardDetail", info);
	}

	// 조회수 증가
	public void updateCNT(String info) {
			 sqlSession.update("myNoteTest.updateCNT",info);
		}

	// 댓글 리스트
	public List<Map<String,Object>> afterList(String info) {
		return sqlSession.selectList("myNoteTest.afterList",info);
	}
	
	// 댓글 등록
		public void addComment(Map<String,Object> info) {
			 sqlSession.insert("myNoteTest.addComment",info);
		}
}
