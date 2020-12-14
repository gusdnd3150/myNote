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
	
	public List<Map<String,Object>> test(){
		List<Map<String,Object>> test =sqlSession.selectList("myNoteTest.test");
		return test;
	}
	
	// 로그인 아이디/비밀번호 체크
	public Integer checkLogin(Map<String,Object> info) {
		Integer result =sqlSession.selectOne("myNoteTest.checkLogin",info);
		return result;
	}
	
	
	public int total() {
		return sqlSession.selectOne("myNoteTest.total");
	}
	
	public List<Map<String,Object>> list(Map<String,Object> map) {
		return sqlSession.selectList("myNoteTest.boardList",map);
	}
	
	public void createBoard(Map<String,Object> map) {
		 sqlSession.insert("myNoteTest.createBoard",map);
	}
	
	public int userNum(String info) {
		 return sqlSession.selectOne("myNoteTest.userNum",info);
	}

}
