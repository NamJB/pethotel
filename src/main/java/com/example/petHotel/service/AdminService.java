package com.example.petHotel.service;


import org.springframework.ui.Model;

import com.example.petHotel.dto.AdminDto;
import com.example.petHotel.dto.RoomDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


public interface AdminService {
	
	
	public String adminLogin(AdminDto adminDto , HttpSession session , Model model);
	public String updateAdmin(AdminDto adminDto ,HttpSession session);
	public void deleteAdmin(int id);
	
	public String reserve(HttpServletRequest request,Model model);
	
	public String reserveContent(HttpServletRequest request,Model model);
	
	public String reserveAdelete(HttpServletRequest request);
	
	public String roomList(Model model);
	
	public String roomContent(HttpServletRequest request,Model model);
	
	public String roomDelete(HttpServletRequest request);
	
	public String roomCreate();
	
	public String roomCreateOk(RoomDto rdto);
	
	public String roomUpdate(HttpServletRequest request,Model model);
	
	public String roomUpdateOk(RoomDto rdto,HttpServletRequest request);

}
