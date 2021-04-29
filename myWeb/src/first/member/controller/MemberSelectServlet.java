package first.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import first.member.model.service.MemberService;
import first.member.model.vo.Member;

/**
 * Servlet implementation class MemberSelectServlet
 */
@WebServlet("/mselect")
public class MemberSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(request.getParameter("aaa"));
//		System.out.println(request.getParameter("bbb"));
//		response.getWriter().append("Served at GET: ").append(request.getContextPath());
		RequestDispatcher view = null;
		
		ArrayList<Member> list = new MemberService().selectAll();
		if(list != null && list.size() > 0 ) {
			request.setAttribute("mlist", list);
			view = request.getRequestDispatcher("view/member/memberView.jsp");
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "유저 정보 조회 실패");
			view = request.getRequestDispatcher("view/error/errorPage.jsp");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		response.getWriter().append("Served at POST: ").append(request.getContextPath());
		
	}

}
