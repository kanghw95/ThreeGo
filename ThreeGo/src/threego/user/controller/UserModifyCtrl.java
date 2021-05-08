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
 * Servlet implementation class UserModifyCtrl
 */
@WebServlet("/usermodify")
public class UserModifyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyCtrl() {
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
		PrintWriter out = response.getWriter();

		User vo = new User();
		String phone = request.getParameter("ph1")+request.getParameter("ph2")+request.getParameter("ph3");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		
		vo.setUser_id(request.getParameter("id"));
		vo.setUser_pwd(request.getParameter("paswwd"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setAddress(request.getParameter("address"));
		vo.setPhone(phone);
		vo.setEmail(email);
		
		int insertResult = new UserService().userModify(vo);
		
		if(insertResult>0) {  
			out.println("<script>alert('회원정보 수정 완료!');</script>");
			request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
			out.close();
		} else {  
			
	}
	}

}
