package threego.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.service.ParkingService;
import threego.vo.User;

/**
 * Servlet implementation class UserIdCheck
 */
@WebServlet("/idcheck")
public class UserIdCheckCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIdCheckCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
	
		
		if(id != null && !id.equals("")) {
		ArrayList<User> searchid = new ParkingService().id_nickCheck("user_id", id);
		
		if(searchid.isEmpty() != true) {
			out.println("중복입니다. 다른아이디를 입력해주세요!");
		}else {
			String str = "사용가능한 아이디입니다.";
			out.print(str);
		}

		}else {
			out.println("아이디를 입력해주세요!");
		}

		out.flush();
		out.close();
	}


}
