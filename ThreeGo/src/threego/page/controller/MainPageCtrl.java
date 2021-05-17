package threego.page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PageController
 */
@WebServlet("/main/*") // 무조건 여기로 오게 되어있음.
public class MainPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageCtrl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	

		if(com.equals("/main/insert")) {
			viewPage = "/WEB-INF/main/user_main/insert.jsp";
		}else if(com.equals("/main/modify")){
			 viewPage = "/WEB-INF/main/user_main/modify.jsp";
		}else if(com.equals("/main/user/usermypage")){
			 viewPage = "/WEB-INF/main/user_main/mypage.jsp";
		}else if(com.equals("/main/idfind")){
			viewPage = "/WEB-INF/main/user_main/idfind.jsp";
		}else if(com.equals("/main/pwfind")){
			viewPage = "/WEB-INF/main/user_main/pwfind.jsp";
		}else if(com.equals("/main/drawal")){
			 viewPage = "/WEB-INF/main/user_main/drawal.jsp";
		}else if(com.equals("/main/user/chat")){
			viewPage = "/WEB-INF/main/user_main/chat.jsp";
		}else if(com.equals("/main/mycomment")){
			viewPage = "/WEB-INF/main/user_main/mycomment.jsp";
		}else if(com.equals("/main/reviewWrite")){
			viewPage = "/WEB-INF/main/review_main/write.jsp";
		}
		
		else{
			viewPage = "/WEB-INF/main/main.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
