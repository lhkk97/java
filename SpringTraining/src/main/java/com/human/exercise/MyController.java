package com.human.exercise;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MyController {
	@Autowired
	private SqlSession sqlSession;
	
	// 객실 관리 리스트
	@RequestMapping("/roomadd")
	public String addRoom(Model m) {
		iEmp room=sqlSession.getMapper(iEmp.class);
		ArrayList<Room> alRoom=room.getRoomList();
		m.addAttribute("alRoom",alRoom);
		
		ArrayList<RoomType> alType=room.getTypeList();
		m.addAttribute("alType",alType);
		return "addRoom";
	}
	// 객실 관리 추가
	@RequestMapping(value="/addRoom")
	public String addRoom(HttpServletRequest hsr,Model m) {
		String roomname=hsr.getParameter("roomname");
		String roomtype=hsr.getParameter("roomtype");
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		
		System.out.println("roomname = ["+roomname+"]");
		System.out.println("roomtype = ["+roomtype+"]");
		System.out.println("howmany = ["+howmany+"]");
		System.out.println("howmuch = ["+howmuch+"]");
		
		iEmp room=sqlSession.getMapper(iEmp.class);
		room.addRoom(roomname, roomtype, howmany, howmuch);
		
		return "redirect:/roomadd";
	}
	// 객실 관리 삭제
	@RequestMapping("/deleteRoom")
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		iEmp room=sqlSession.getMapper(iEmp.class);
		room.deleteRoom(roomcode);
		return "redirect:/roomadd";
	}
	//객실 타입 리스트
	@RequestMapping("/typeadd")
	public String addType(Model m) {
		iEmp type=sqlSession.getMapper(iEmp.class);
		ArrayList<RoomType> alType=type.getTypeList();
		m.addAttribute("alType",alType);
		return "addRoomType";
	}
	//객실 타입 추가
	@RequestMapping("/addType")
	public String addType(HttpServletRequest hsr) {
		int typecode=Integer.parseInt(hsr.getParameter("typecode"));
		String typename=hsr.getParameter("typename");
		
		iEmp type=sqlSession.getMapper(iEmp.class);
		type.addType(typecode,typename);
		
		return "redirect:/typeadd";
	}
	
	// 메뉴 리스트
	@RequestMapping("/menuadd")
	public String doMenuAdd(Model m) {
		iEmp menu=sqlSession.getMapper(iEmp.class);
		ArrayList<Menu> alMenu=menu.getMenu();
		m.addAttribute("alMenu",alMenu);
		return "addMenu";
	}
	// 메뉴 추가
	@RequestMapping("/addMenu")
	public String doAddMenu(HttpServletRequest hsr) {
		String strCode=hsr.getParameter("code");
		String menu_name=hsr.getParameter("menu_name");
		int price=Integer.parseInt(hsr.getParameter("price"));
		
		iEmp menu=sqlSession.getMapper(iEmp.class);
		if(strCode.equals("")) {
			menu.addMenu(menu_name,price);
		} else {
			int code=Integer.parseInt(strCode);
			menu.updateMenu(code,menu_name,price);
		}
		return "redirect:/menuadd";
	}
	// 메뉴 삭제
	@RequestMapping("/deleteMenu")
	public String deleteMenu(HttpServletRequest hsr) {
		int code=Integer.parseInt(hsr.getParameter("code"));
		iEmp menu=sqlSession.getMapper(iEmp.class);
		menu.deleteMenu(code);
		
		return "redirect:/menuadd";
	}
	// employees, departments join DB
	@RequestMapping("/join")
	public String join(Model m) {
		iEmp join=sqlSession.getMapper(iEmp.class);
		m.addAttribute("join",join.getJoin());
		return "emp";
	}
	// countries DB
	@RequestMapping("/cty")
	public String ctyList(Model m) {
		iCountry cty=sqlSession.getMapper(iCountry.class);
		m.addAttribute("cty",cty.getCTY());
		return "country";
	}
	
	// employee DB
	@RequestMapping(value="/emp")
	public String empList(Model m) {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Employee> alEmp=emp.getEmpList();
		m.addAttribute("alEmp",alEmp);
		return "emp";
	}
	
	// 사칙연산 및 오류
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input() {
		
		return "input";
	}
	
	@RequestMapping(value = "/calc", method = RequestMethod.POST)
	public String home(HttpServletRequest hsr, Model model) {
		try {
			int x1=Integer.parseInt(hsr.getParameter("x1"));
			int x2=Integer.parseInt(hsr.getParameter("x2"));
			String op=hsr.getParameter("op");
			int num;
			
			if(op.equals("+")) {
				num=x1+x2;
				model.addAttribute("num",num);
				return "plus";
			} else if(op.equals("-")) {
				num=x1-x2;
				model.addAttribute("num",num);
				return "minus";
			} else if(op.equals("*")) {
				num=x1*x2;
				model.addAttribute("num",num);
				return "multi";
			} else if(op.equals("/")) {
				num=x1/x2;
				model.addAttribute("num",num);
				return "divide";
			} else {
				model.addAttribute("num","연산자 불명");
				return "error";
			}
		} catch(Exception e) {
			model.addAttribute("num","error");
			return "error";
		}
	}
}
