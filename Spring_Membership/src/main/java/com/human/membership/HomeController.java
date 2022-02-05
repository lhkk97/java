package com.human.membership;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	//로그아웃
	@RequestMapping(value = "/logout",method=RequestMethod.POST)
	public String logout(HttpServletRequest hsr) {
		String userid=hsr.getParameter("userid");
		iMember member=sqlSession.getMapper(iMember.class);	
		member.logout(userid);
		return "redirect:/";
	}
	//로그인
	@RequestMapping(value="/login")
	public String login() {
		return "login";
	}

	@RequestMapping(value="/login_check",method=RequestMethod.POST)
	public String login(HttpServletRequest hsr, Model model) {
		String str="";
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		
		iMember member=sqlSession.getMapper(iMember.class);	
		ArrayList<Member> m=member.getMember();
		for(int i=0; i<m.size(); i++) {
			System.out.println("등록된 아이디:"+m.get(i).getUserid());
			System.out.println("login ID: "+userid);
			System.out.println("등록된 비밀번호:"+m.get(i).getPasscode());
			System.out.println("login Passcode: "+passcode);
			
			if(m.get(i).getPasscode().equals(passcode)&&m.get(i).getUserid().equals(userid)) {
				str="ok";
				break;
			} else {
				str="fail";
			}
		}
		System.out.println("!!!!!!str:"+str);
		if(str.equals("ok")) {
			member.login(userid);
			model.addAttribute("userid",userid);
			return "home";
		} else {
			model.addAttribute("user",str);
			return "login";
		}
	}
	// 회원가입
	@RequestMapping(value="/signon")
	public String signon() {
		return "signon";
	}
	
	@ResponseBody
	@RequestMapping(value="/signon_check",method=RequestMethod.POST)
	public String signon(HttpServletRequest hsr,Model model) {
		String retval="";

		String name=hsr.getParameter("name");
		String gender=hsr.getParameter("gender");
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		String[] a_interest=hsr.getParameterValues("interest");
		String interest=String.join(",", a_interest);
			
		iMember member=sqlSession.getMapper(iMember.class);
		ArrayList<Member> m=member.getMember();
		for(int i=0; i<m.size(); i++) {
			System.out.println("등록된 ID:"+m.get(i).getUserid());
			System.out.println("signon ID:"+userid);
			if(m.get(i).getUserid().equals(userid)) {
				retval="overlap";
			} 
		}

		if(!retval.equals("overlap")) {
			member.insertMember(name,gender,userid,passcode,interest);
			retval="ok";
		}
		return retval;
	}
	
}
