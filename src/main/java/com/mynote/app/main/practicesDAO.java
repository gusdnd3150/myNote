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
	
	public Integer checkLogin(Map<String,Object> info) {
		Integer result =sqlSession.selectOne("myNoteTest.checkLogin",info);
		return result;
	}
	

}
