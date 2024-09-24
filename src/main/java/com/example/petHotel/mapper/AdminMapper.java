package com.example.petHotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.petHotel.dto.AdminDto;
import com.example.petHotel.dto.ReserveDto;
import com.example.petHotel.dto.RoomDto;

@Mapper
public interface AdminMapper {
	
	AdminDto adminLogin(String username);
    void updateAdmin(AdminDto adminDto);
    void deleteAdmin(int id);
    public ArrayList<RoomDto> getRoom();
    public ArrayList<ReserveDto> getReserve();
    
    public ReserveDto getContent(String reserveNum);
    
    public  void reserveAdelete(String reserveNum);
    
    public RoomDto roomContent(int roomid);
    
    public void roomDelete(int roomid);
    
    public void roomCreate(RoomDto rdto);
    
    public void roomUpdateOk(RoomDto rdto);
}
