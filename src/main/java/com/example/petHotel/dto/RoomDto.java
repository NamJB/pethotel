package com.example.petHotel.dto;

import org.springframework.web.multipart.MultipartFile;

public class RoomDto {

	
	private String title,price,content;
	private int roomid,min,max;
	       
	private MultipartFile[] rimg;
	public MultipartFile[] getRimg() {
		return rimg;
	}

	public void setRimg(MultipartFile[] rimg) {
		this.rimg = rimg;
	}

	private String rimgPaths; 
	
	

	public String getRimgPaths() {
		return rimgPaths;
	}

	public void setRimgPaths(String rimgPaths) {
		this.rimgPaths = rimgPaths;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRoomid() {
		return roomid;
	}

	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	
}
