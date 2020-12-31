package com.mynote.app.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mynote.app.main.vos.BoardVO;

@Service
public class practiceService {

	@Autowired
	practicesDAO dao;

	public List<Map<String, Object>> test() {
		List<Map<String, Object>> test = dao.test();
		return test;
	}

	public Integer checkLogin(Map<String, Object> info) {
		Integer result = dao.checkLogin(info);
		return result;
	}

	public int total() {
		return dao.total();
	}

	public List<Map<String, Object>> list(Map<String, Object> map) {
		return dao.list(map);
	}

	public void createBoard(Map<String, Object> map) {
		dao.createBoard(map);
	}

	public int userNum(String info) {
		return dao.userNum(info);
	}

	public List<Map<String, Object>> boardDetail(String info) {
		return dao.boardDetail(info);
	}

	public void updateCNT(String info) {
		dao.updateCNT(info);
	}

	public List<Map<String, Object>> afterList(String info) {
		return dao.afterList(info);
	}

	public void addComment(Map<String, Object> info) {
		dao.addComment(info);
	}
	
	public List<BoardVO> testJoin() {
		return dao.testJoin();
	}
}
