package com.human.cafe;

import java.util.ArrayList;

public interface iCafe {
	ArrayList<Menu> getMenuList();
	void insertMenu(String name,int price);
	void updateMenu(int code,String name,int price);
	void deleteMenu(int code);
	
	ArrayList<Cafe_sales> getSales();
	void insertSales(String mobile,int menu_code,int qty,int total);
	
	ArrayList<Sales> salesMenu();
	ArrayList<Sales> salesMobile();
}
