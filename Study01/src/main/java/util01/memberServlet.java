package util01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class memberServlet
 */
@WebServlet("/memberServlet")
public class memberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name=req.getParameter("name");
		String id=req.getParameter("id");
		String gender=req.getParameter("gender");
		String password=req.getParameter("password");
		String pw_check=req.getParameter("pw_check");
		String mobile=req.getParameter("mobile");
	    
		String outstr="<html><head><title>member</title></head><body>";
		outstr+="실명: "+name+"<br>"+"성별: "+gender+"<br>"+"아이디: "+id+"<br>";
		outstr+="비밀번호: "+password+"<br>"+"비밀번호확인: "+pw_check+"<br>";
		outstr+="모바일번호: "+mobile+"<br>"+"관심분야: ";
		
		String[] arItem = req.getParameterValues("interest");
		if(arItem==null) {
			outstr+="선택된게 없습니다.";
		} else {
			for(int i=0; i<arItem.length; i++) {
				outstr+=arItem[i]+",";
			}
		}
		
		outstr+="</body></html>";
		
		PrintWriter out=response.getWriter();
		out.println(outstr);
	}

}
