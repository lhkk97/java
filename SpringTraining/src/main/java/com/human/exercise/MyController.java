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
	
	@RequestMapping("/st")
	public String st() {
		return "student";
	}
	@RequestMapping("/sc")
	public String sc() {
		return "score";
	}
	// 객실 관리 리스트
	@RequestMapping("/roomadd")
	public String addRoom(Model m) {
		return "addRoom";
	}
	@ResponseBody
	@RequestMapping(value="/roomlist",produces="application/json;charset=utf-8")
	public String roomList() {
		iEmp room=sqlSession.getMapper(iEmp.class);
		ArrayList<Room> alRoom=room.getRoomList();
		JSONArray ja=new JSONArray();
		for(int i=0;i<alRoom.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("roomcode", alRoom.get(i).getRoomcode());
			jo.put("name",alRoom.get(i).getName());
			jo.put("type",alRoom.get(i).getType());
			jo.put("howmany",alRoom.get(i).getHowmany());
			jo.put("howmuch",alRoom.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/typelist",produces="application/json;charset=utf-8")
	public String typeList() {
		iEmp room=sqlSession.getMapper(iEmp.class);
		ArrayList<RoomType> alType=room.getTypeList();
		JSONArray ja=new JSONArray();
		for(int i=0;i<alType.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("typecode",alType.get(i).getTypecode());
			jo.put("typename",alType.get(i).getTypename());
			ja.add(jo);
		}
		return ja.toString();
	}
	// 객실 관리 추가
	@RequestMapping(value="/addRoom")
	public String addRoom(HttpServletRequest hsr,Model m) {
		String roomcode=hsr.getParameter("roomcode");
		String roomname=hsr.getParameter("roomname");
		String roomtype=hsr.getParameter("roomtype");
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		
		System.out.println("roomcode = ["+roomcode+"]");
		System.out.println("roomname = ["+roomname+"]");
		System.out.println("roomtype = ["+roomtype+"]");
		System.out.println("howmany = ["+howmany+"]");
		System.out.println("howmuch = ["+howmuch+"]");
		
		iEmp room=sqlSession.getMapper(iEmp.class);
		if(roomcode.equals("")) {
			room.addRoom(roomname, roomtype, howmany, howmuch);
		} else {
			int code=Integer.parseInt(roomcode);
			room.updateRoom(code,roomname, roomtype, howmany, howmuch);
		}
		
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
	public String Menu() {
		return "addMenu";
	}
	@ResponseBody
	@RequestMapping(value="/menuList",produces="application/json;charset=utf-8")
	public String getMenuList() {
		iEmp menu=sqlSession.getMapper(iEmp.class);
		ArrayList<Menu> alMenu=menu.getMenu();  // 코드, 메뉴명, 가격이 들어있다.
		
		JSONArray ja=new JSONArray();
		for(int i=0; i<alMenu.size(); i++) {  // ArrayList -> JSON
			JSONObject jo=new JSONObject();
			jo.put("code",alMenu.get(i).getCode());
			jo.put("name",alMenu.get(i).getName());
			jo.put("price",alMenu.get(i).getPrice());
			ja.add(jo);
		}
		return ja.toString();
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
	@RequestMapping(value="/emplist")
	public String emp(Model m) {
		return "emplist";
	}
	
	@ResponseBody
	@RequestMapping(value="/empview",produces="application/json;charset=utf-8")
	public String empList() {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<emp> alEmp=emp.getEmp();
		JSONArray ja=new JSONArray();
		for(int i=0;i<alEmp.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("emp_id",alEmp.get(i).getEmployee_id());
			jo.put("emp_name",alEmp.get(i).getEmp_name());
			jo.put("mobile",alEmp.get(i).getPhone_number());
			jo.put("manager_id",alEmp.get(i).getManager_id());
			jo.put("hire_date",alEmp.get(i).getHire_date());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/empshow",produces="application/json;charset=utf-8")
	public String empList(HttpServletRequest hsr) {
		String keyword=hsr.getParameter("kw");
		if(keyword.equals("")) return "";
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<emp> alEmp=emp.getEmpShow(Integer.parseInt(keyword));
		JSONArray ja=new JSONArray();
		for(int i=0;i<alEmp.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("emp_id",alEmp.get(i).getEmployee_id());
			jo.put("emp_name",alEmp.get(i).getEmp_name());
			jo.put("mobile",alEmp.get(i).getPhone_number());
			jo.put("manager_id",alEmp.get(i).getManager_id());
			jo.put("hire_date",alEmp.get(i).getHire_date());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping("/job")
	public String doJob(Model model) {
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<Job> jl=job.jobList();
		model.addAttribute("jobs",jl);
		
		ArrayList<emp> el=job.getMList();
		model.addAttribute("manager",el);
		return "job";
	}
	
	@ResponseBody
	@RequestMapping(value="/position",produces="application/json;charset=utf-8")
	public String doPosition(HttpServletRequest hsr) {
		String jobid=hsr.getParameter("jobcode");
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<EmpInfo> ml=job.getList(jobid);
		JSONArray ja=new JSONArray();
		for(int i=0;i<ml.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("eid",ml.get(i).getEid());
			jo.put("ename",ml.get(i).getEname());
			jo.put("mobile",ml.get(i).getMobile());
			jo.put("dname",ml.get(i).getDname());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping("/dept")
	public String doDept(Model model) {
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<Dept> dl=job.deptList();
		model.addAttribute("dept",dl);
		return "dept";
	}

	@ResponseBody
	@RequestMapping(value="/deptlist",produces="application/json;charset=utf-8")
	public String deptList(HttpServletRequest hsr) {
		int did=Integer.parseInt(hsr.getParameter("did"));
		iJob dept=sqlSession.getMapper(iJob.class);
		ArrayList<Employee> dl=dept.getDept(did);
		System.out.println("size : "+dl.size());
		
		JSONArray ja=new JSONArray();
		for(int i=0;i<dl.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("eid",dl.get(i).getEmployee_id());
			jo.put("ename",dl.get(i).getEmp_name());
			jo.put("mobile",dl.get(i).getPhone_number());
			jo.put("salary",dl.get(i).getSalary());
			ja.add(jo);
		}
		
		return ja.toString();
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
