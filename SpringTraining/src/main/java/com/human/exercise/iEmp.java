package com.human.exercise;

import java.util.ArrayList;

public interface iEmp {
	ArrayList<Employee> getEmpList();
	ArrayList<join> getJoin();
	ArrayList<emp> getEmp();
	ArrayList<emp> getEmpShow(int keyword);
	
	ArrayList<Menu> getMenu();
	void addMenu(String menu_name, int price);
	void deleteMenu(int code);
	void updateMenu(int code,String name, int price);
	
	ArrayList<Room> getRoomList();
	ArrayList<RoomType> getTypeList();
	void addRoom(String name,String type,int howmany,int howmuch);
	void addType(int typecode, String typename);
	void deleteRoom(int roomcode);
	void updateRoom(int code,String name,String type,int howmany, int howmuch);
}
