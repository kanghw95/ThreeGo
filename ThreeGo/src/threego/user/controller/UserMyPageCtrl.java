package threego.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.UserService;
import threego.model.vo.User;

/**
 * Servlet implementation class UserMyPageCtrl
 */
@WebServlet("/usermypage")
public class UserMyPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyPageCtrl() {
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		User vo = new User();
		vo.setUser_id(id);
		vo.setUser_pwd(passwd);
		
		User resultVo = new User();
		resultVo = new UserService().login(vo);
		if (passwd.equals(resultVo.getUser_pwd())) {
			System.out.println("비밀번호 확인완료");
			request.setAttribute("result", 1);
			request.getRequestDispatcher("/main/user/usermypage").forward(request, response);
//			response.sendRedirect(request.getContextPath() + "/main/user/usermypage");
		} else {
			System.out.println("비밀번호 확인요청");
			out.println("<script>alert('비밀번호가 맞지 않습니다.');</script>");
			out.println("<script>history.back();</script>");
			out.flush();
			out.close();
//			response.sendRedirect(request.getContextPath() + "/main/user/usermypage");
		}
	}

}
