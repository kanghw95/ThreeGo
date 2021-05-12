package threego.page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminPageCtrl
 */
@WebServlet("/admin/*")
public class AdminPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPageCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		Command cmd = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		
		// 어떤식으로 나오는지 로그로 확인
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);
		
		if(com.equals("/admin/adminmain")) {
			viewPage = "/WEB-INF/main/admin_main/adminmain.jsp";
		}else if(com.equals("/admin/adminboard")) {
			viewPage = "/WEB-INF/main/admin_main/adminboard.jsp";
		}else if(com.equals("/admin/adminqna")) {
			viewPage = "/WEB-INF/view/admin/user_qna.jsp";
		}else if(com.equals("/admin/adminqnaanswer")) {
			viewPage = "/WEB-INF/view/admin/admin_qna_answer.jsp";
		}else if(com.equals("/admin/start")) {
			viewPage = "/WEB-INF/start.jsp";
		}else if(com.equals("/admin/park")) {
			viewPage = "/WEB-INF/test01.jsp";
		}else if(com.equals("/admin/adminuser")) {
			viewPage = "/WEB-INF/main/admin_main/adminuser.jsp";
		}
		
		else{
			viewPage = "/WEB-INF/index.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}
