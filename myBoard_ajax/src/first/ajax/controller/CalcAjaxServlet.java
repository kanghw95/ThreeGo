package first.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcAjaxServlet
 */
@WebServlet("/cal.do")
public class CalcAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalcAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		System.out.println(request.getParameter("n1"));
		System.out.println(request.getParameter("n2"));
		System.out.println(request.getParameter("oper"));
		
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		String oper = request.getParameter("oper");
		String operSymbol = "";
		int result = 0;
		if(oper.equals("add")) {
			operSymbol = " + ";
			result = n1+n2;
		}else if (oper.equals("sub")) {
			operSymbol = " - ";
			result = n1-n2;
		}else if (oper.equals("mul")) {
			operSymbol = " * ";
			result = n1*n2;
		}else if (oper.equals("div")) {
			operSymbol = " / ";
			result = n1/n2;
		}
		response.getWriter().println(n1 + operSymbol + n2 + " = " + result);
	}

}














