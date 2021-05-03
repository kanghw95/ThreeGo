package threego.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.ParkingService;
import threego.model.vo.User;

/**
 * Servlet implementation class UserNickCheckCtrl
 */
@WebServlet("/nickcheck")
public class UserNickCheckCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserNickCheckCtrl() {
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
		String nickname  = request.getParameter("nickname");
		ArrayList<User> searchnickname = new ParkingService().id_nickCheck("nickname", nickname);
		System.out.println(nickname);
		System.out.println(searchnickname);
		
		PrintWriter out = response.getWriter();
		
		if(searchnickname.isEmpty() != true) {
			out.println("(중복입니다. 다른닉네임를 입력해주세요!)");
		}else {
			out.println("(사용가능한 닉네임입니다.)");
		}
		out.flush();
		out.close();
	}

}
