package util01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class opServlet
 */
@WebServlet("/opServlet")
public class opServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public opServlet() {
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
		response.setContentType("text/html; charset=utf-8");
		
		int value1=Integer.parseInt(req.getParameter("value1"));
		int value2=Integer.parseInt(req.getParameter("value2"));
	    String operator=req.getParameter("operator");
		
	    int n;
		if(operator.equals("+")) {
	    	n=value1+value2;
	    } else if(operator.equals("-") ) {
	    	n=value1-value2;
	    } else if(operator.equals("*")) {
	    	n=value1*value2;
	    } else {
	    	n=value1/value2;
	    }
		
		String outstr="<html><head><title>operator</title></head></body>";
		outstr+="value1 : "+value1+"<br>"+"value2 : "+value2+"<br>";
		outstr+="operator : "+value1+operator+value2+"<br>"+"result : "+n;
		outstr+="</body></html>";
		
		PrintWriter out=response.getWriter();
		out.println(outstr);
	}

}
