package com.example.petHotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.petHotel.dto.AdminDto;
import com.example.petHotel.dto.RoomDto;
import com.example.petHotel.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin/login")
	public String loginForm()
	{
		return "/admin/login";
	}
	@PostMapping("/admin/login")
	public String loginOk(AdminDto adminDto , HttpSession session , Model model )
	{
		return adminService.adminLogin(adminDto , session , model);
	}
	
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/index";
	}
	
	
	
	
	@GetMapping("/admin/update")
	public String updateForm()
	{
		return "/admin/update";
	}
	@PostMapping("/admin/update")
	public String update(AdminDto adminDto , HttpSession session)
	{
		return adminService.updateAdmin(adminDto, session);
	}
	
	@GetMapping("/admin/delete")
	public String deleteAdmin(HttpSession session)
	{
		int id =(int) session.getAttribute("id");
		adminService.deleteAdmin(id);
		session.invalidate();
		
		return "/main/index";
	}
	
	
	@GetMapping("/admin/mypage")
	public String mypageForm(HttpServletRequest request,Model model)
	{
		
		
		return adminService.reserve(request,model);
	}
	
	@RequestMapping("/admin/reserveContent")
	public String reserveContent(HttpServletRequest request,Model model) {
		
		return adminService.reserveContent(request,model);
	}
	
	@RequestMapping("admin/reserveAdelete")
	public String reserveAdelete(HttpServletRequest request) {
		
		return adminService.reserveAdelete(request);
		
	}
	
	@RequestMapping("admin/roomList")
	public String roomList(Model model) {
		
		return adminService.roomList(model);
	}
	
	@RequestMapping("admin/roomContent")
	public String roomContent(HttpServletRequest request,Model model) {
		
		return adminService.roomContent(request,model);
	}
	
	@RequestMapping("admin/roomDelete")
	public String roomDelete(HttpServletRequest request) {
		
		return adminService.roomDelete(request);
	}
	
	@RequestMapping("admin/roomCreate")
	public String roomCreate() {
		
		return adminService.roomCreate();
	}
	
	@RequestMapping("admin/roomCreateOk")
	public String roomCreateOk(RoomDto rdto) {
		
		
		return adminService.roomCreateOk(rdto);
	}
	
	@RequestMapping("admin/roomUpdate")
	public String roomUpdate(HttpServletRequest request,Model model) {
		
		return adminService.roomUpdate(request,model);
	}
	
	@RequestMapping("admin/roomUpdateOk")
	public String roomUpdateOk(RoomDto rdto,HttpServletRequest request) {
		
		return adminService.roomUpdateOk(rdto,request);
	}
	
	

	
	
	
	
	
	
	
	
	

}
