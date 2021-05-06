package threego.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.ParkingService;
import threego.model.vo.User;

/**
 * Servlet implementation class UserLoginCtrl
 */
@WebServlet("/userlogin")
public class UserLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		User vo = new User();
		vo.setUser_id(id);
		vo.setUser_pwd(passwd);
		
		User resultVo = new User();
		resultVo = new ParkingService().login(vo);
		System.out.println(resultVo);
		if (resultVo == null) {
			System.out.println("아이디 없음");
			request.getRequestDispatcher("/main/insert").forward(request, response); //없으면 바로 회원가입으로
		} else if (passwd.equals(resultVo.getUser_pwd())) {
			System.out.println("로그인 성공");
			request.getSession().setAttribute("msg", id+"님 접속을 환영합니다.");
			System.out.println( id+"님 접속을 환영합니다.");
			request.getSession().setAttribute("user", resultVo);
			request.getSession().setAttribute("username", resultVo.getUser_name());
			response.sendRedirect(request.getContextPath() + "/main");
		} else {
			System.out.println("비번틀림");
			request.getSession().setAttribute("msg", id+"님 비밀번호가 맞지 않습니다.");
			response.sendRedirect(request.getContextPath() + "/main");
		}
		
	}

}
