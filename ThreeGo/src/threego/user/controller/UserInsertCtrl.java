package threego.user.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.UserService;
import threego.model.vo.User;

/**
 * Servlet implementation class InsertUserCtrl
 */
@WebServlet("/userinsert")
public class UserInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInsertCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User vo = new User();
		String birth = request.getParameter("birth1")+"0"+request.getParameter("birth2")+"0"+request.getParameter("birth3");
		String phone = request.getParameter("ph1")+request.getParameter("ph2")+request.getParameter("ph3");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		
		
		vo.setUser_id(request.getParameter("id"));
		vo.setUser_pwd(request.getParameter("paswwd"));
		vo.setUser_name(request.getParameter("name"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setAddress(request.getParameter("address"));
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setGender(request.getParameter("gender").charAt(0));
		vo.setBirth(birth);
		
		int insertResult = new UserService().userinsert(vo);
		
		if(insertResult>0) {  // 정상적으로 insert 성공
			request.getRequestDispatcher("WEB-INF/main/main.jsp").forward(request, response);
		} else {  // insert 실패
			
		}
	}


}
