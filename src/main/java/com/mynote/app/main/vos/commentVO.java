package com.mynote.app.main.vos;

import org.springframework.stereotype.Component;

@Component
public class commentVO {
	
	private int imageNum;
	private int boardNum;
	private String detailImage;
	
	public int getImageNum() {
		return imageNum;
	}
	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getDetailImage() {
		return detailImage;
	}
	public void setDetailImage(String detailImage) {
		this.detailImage = detailImage;
	}
}
