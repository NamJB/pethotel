package com.example.petHotel.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.petHotel.dto.AdminDto;
import com.example.petHotel.dto.ReserveDto;
import com.example.petHotel.dto.RoomDto;
import com.example.petHotel.mapper.AdminMapper;
import com.example.petHotel.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public String adminLogin(AdminDto adminDto , HttpSession session , Model model)
	{
		String username=adminDto.getUsername();
		AdminDto dbDto=adminMapper.adminLogin(username);
		
		if( dbDto != null && dbDto.getPwd().equals( adminDto.getPwd() ) )
		{
			session.setAttribute("username", dbDto.getUsername());
			session.setAttribute("id", dbDto.getId());
			session.setAttribute("role", dbDto.getRole());
			return "/main/index";
		}
		else
		{
			model.addAttribute("error", "Invalid username or password.");
			model.addAttribute("admindto", adminDto);
			return "/admin/login";
		}
		
	}
	
	@Override
	public String updateAdmin(AdminDto adminDto , HttpSession session)
	{
		int id = (int) session.getAttribute("id");
		adminDto.setId(id);
		adminMapper.updateAdmin(adminDto);
		
		session.setAttribute("username", adminDto.getUsername());
		return "/admin/mypage";
	}
	
	@Override
	public void deleteAdmin(int id)
	{
		adminMapper.deleteAdmin(id);
	}
	
	
	@Override
	public String reserve(HttpServletRequest request, Model model) {
		
		
		
		int year,month;
		if(request.getParameter("year")==null)
		{
			LocalDate today=LocalDate.now();
			year=today.getYear();
			month=today.getMonthValue();
		}
		else 
		{			
			year=Integer.parseInt(request.getParameter("year"));
			month=Integer.parseInt(request.getParameter("month"));
			
			if(month==0) 
			{
			    year=year-1;
			    month=12;
			}
			
			if(month==13)
			{
				year=year+1;
				month=1;
			}
		}
		
		LocalDate xday = LocalDate.of(year, month, 1);
		
		int yoil =xday.getDayOfWeek().getValue();
		
		if(yoil ==7) {
			
			yoil = 0;
		}
		
		int lastday = xday.lengthOfMonth();
		
		int ju = (int)Math.ceil((yoil+lastday)/7.0);
		int day= 1;
		
		 int nextYear = (month == 12) ? year + 1 : year;
		  int nextMonth = (month == 12) ? 1 : month + 1;
		 LocalDate nextMonthDate = LocalDate.of(nextYear, nextMonth, 1);
		 int nextYoil = nextMonthDate.getDayOfWeek().getValue();
		    if (nextYoil == 7) {
		        nextYoil = 0; // 일요일을 0으로 설정
		    }
		 int nextLastDay = nextMonthDate.lengthOfMonth();
		 int juNext = (int) Math.ceil((nextYoil + nextLastDay) / 7.0);
		
		ArrayList<RoomDto> roomList =adminMapper.getRoom();
		model.addAttribute("yoil",yoil);
		model.addAttribute("lastday",lastday);
		model.addAttribute("ju",ju);
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);

		model.addAttribute("roomList",roomList);
		
		model.addAttribute("nextYear",nextYear);
		model.addAttribute("nextMonth",nextMonth);
		model.addAttribute("nextYoil",nextYoil);
		model.addAttribute("nextLastDay",nextLastDay);
		model.addAttribute("juNext",juNext);
		
		ArrayList<ReserveDto> reserveList = adminMapper.getReserve();
		
		
		
		model.addAttribute("reserveList",reserveList);
		
		
		
		
		
		
		return "/admin/mypage";
	}
	
	@Override
	public String reserveContent(HttpServletRequest request,Model model) {
		
		String reserveNum =request.getParameter("reserveNum");
		
		ReserveDto reserveList = adminMapper.getContent(reserveNum);
		
		model.addAttribute("rList",reserveList);
		
		
		
		return "/admin/reserveContent";
	}
	
	@Override
	public String reserveAdelete(HttpServletRequest request) {
		
		String reserveNum =request.getParameter("reserveNum");
		
		adminMapper.reserveAdelete(reserveNum);
		
		
		return "redirect:/admin/mypage";
	}
	
	@Override
	public String roomList(Model model) {
		
		 ArrayList<RoomDto> roomList= adminMapper.getRoom();
		
		 model.addAttribute("roomList",roomList);
		
		return "/admin/roomList";
	}
	
	@Override
	public String roomContent(HttpServletRequest request,Model model) {
		
		
		int roomid = Integer.parseInt(request.getParameter("roomid"));
		
	    RoomDto rlist = adminMapper.roomContent(roomid);
	    
	    model.addAttribute("rlist",rlist);
		
		
		return "/admin/roomContent";
	}
	
	@Override
	public String roomDelete(HttpServletRequest request) {
		
		int roomid = Integer.parseInt(request.getParameter("roomid"));
		
		adminMapper.roomDelete(roomid);
		
		return "redirect:/admin/roomList";
	}
	
	@Override
	public String roomCreate() {
		
		
		
		return "/admin/roomCreate";
	}
	
	@Override
	public String roomCreateOk( RoomDto rdto) {
		
		
		
		MultipartFile[] images = rdto.getRimg();  // 파일 배열을 받음

		if (images != null && images.length > 0) {
		    // 파일 경로를 저장할 StringBuilder
		    StringBuilder imagePaths = new StringBuilder();
		    
		    for (MultipartFile image : images) {
		        if (!image.isEmpty()) {
		            try {
		                // 파일 저장 경로 지정 (src/main/resources/static/rooms)
		                String uploadDir = new File("src/main/resources/static/rooms/").getAbsolutePath();
		                File uploadDirectory = new File(uploadDir);

		                // 디렉토리가 없으면 생성
		                if (!uploadDirectory.exists()) {
		                    uploadDirectory.mkdirs();  // 경로가 없으면 생성
		                }

		                // 고유 파일명 생성
		                String uniqueFileName = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();
		                File file = new File(uploadDirectory, uniqueFileName);

		                // 파일 저장
		                image.transferTo(file);

		                // 파일 경로를 저장 (여러 파일일 경우 쉼표로 구분)
		                if (imagePaths.length() > 0) {
		                    imagePaths.append(",");
		                }
		                imagePaths.append(uniqueFileName);  // 경로 추가

		            } catch (IOException e) {
		                e.printStackTrace();  // 파일 저장 중 예외 처리
		            }
		        }
		    }
		    
		    // 파일 경로를 RoomDto에 설정
		    rdto.setRimgPaths(imagePaths.toString());
		}
	 
	    adminMapper.roomCreate(rdto);

		
		
		return "redirect:/admin/roomList";
	}
	
	@Override
	public String roomUpdate(HttpServletRequest request,Model model) {
		
		int roomid = Integer.parseInt(request.getParameter("roomid"));
		
		RoomDto rlist = adminMapper.roomContent(roomid);
		
		model.addAttribute("rlist",rlist);
		
		return "/admin/roomUpdate";
	}
	
	@Override
	public String roomUpdateOk(RoomDto rdto,HttpServletRequest request) {
	
	     
	    adminMapper.roomUpdateOk(rdto);
		
	    return "redirect:/admin/roomList";
	}
	
	
	
	
	

}











