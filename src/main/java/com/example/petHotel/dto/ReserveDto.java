package com.example.petHotel.dto;

import java.time.LocalDate;

public class ReserveDto {

	
	
	
	
	public LocalDate startDate,endDate,reserveday;
	public String chongprice,username,phone,content;
	public String roomid,reserveNum,title;
	
	public int petsu;

	
	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public LocalDate getReserveday() {
		return reserveday;
	}

	public void setReserveday(LocalDate reserveday) {
		this.reserveday = reserveday;
	}

	public String getChongprice() {
		return chongprice;
	}

	public void setChongprice(String chongprice) {
		this.chongprice = chongprice;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRoomid() {
		return roomid;
	}

	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}

	public String getReserveNum() {
		return reserveNum;
	}

	public void setReserveNum(String reserveNum) {
		this.reserveNum = reserveNum;
	}

	public int getPetsu() {
		return petsu;
	}

	public void setPetsu(int petsu) {
		this.petsu = petsu;
	}

		
	
	
	
	
}
