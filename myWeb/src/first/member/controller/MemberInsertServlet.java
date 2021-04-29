package first.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import first.member.model.service.MemberService;
import first.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsert
 */
@WebServlet("/minsert")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 방식으로 들어오면 안되는 경우 다시 insert.jsp 화면으로 이동시켜서 입력을 받고 post 방식으로 들어올 수 있도록 유도함.
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("view/member/memberInsert.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("minsert :doPost");
		Member vo = new Member();
		// 이전 화면 jsp에서 submit시 실려들어온 데이터 request.getParamete
		vo.setId(request.getParameter("id")); 
		vo.setPasswd(request.getParameter("passwd"));
		vo.setName(request.getParameter("name"));  //""
		vo.setEmail(request.getParameter("email"));
		vo.setGrade(request.getParameter("grade"));
		if(request.getParameter("gender") != null) {
			if(request.getParameter("gender").equals("")) {	
				vo.setGender(request.getParameter("gender").charAt(0));
			}
		}
		int result = new MemberService().insert(vo);
		if(result>0) {  // 정상적으로 insert 성공
//			RequestDispatcher view = null;
//			view = request.getRequestDispatcher("index.jsp");
//			request.getRequestDispatcher("index.jsp").forward(request, response);
			response.sendRedirect("index.jsp");
		} else {  // insert 실패
			
		}
		System.out.println(result);
	}

}

















