package com.mynote.app.main.vos;

import org.springframework.stereotype.Component;

@Component
public class BoardVO {

	 private int boardNum;
	 private int userNum;
	 private int boardType;
	 private String content;
	 private String title;
	 private int  cnt;
	 private String updateD;
	 
	 private commentVO comment; 
	 
	 
	 
	public commentVO getComment() {
		return comment;
	}
	public void setComment(commentVO comment) {
		this.comment = comment;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getUpdateD() {
		return updateD;
	}
	public void setUpdateD(String updateD) {
		this.updateD = updateD;
	}
	 
}
