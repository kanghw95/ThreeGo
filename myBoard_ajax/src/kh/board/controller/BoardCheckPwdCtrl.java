package kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.Board;
import kh.board.model.BoardService;

/**
 * Servlet implementation class BoardCheckPwdCtrl
 */
@WebServlet("/boardckpw.do")
public class BoardCheckPwdCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCheckPwdCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("pwd"));
		
		BoardService sv =new BoardService();

		Board vo = new Board();
		String str = request.getParameter("bno");
		if(str!=null) {
			vo.setBno(Integer.parseInt(str));
			vo.setBpwd(request.getParameter("pwd"));
			vo = sv.getBoardRead(vo);
			if(vo != null) {
				System.out.println("수정가능");
			} else {
				System.out.println("password 잘못입력");
			}
		}
		
		
	}

}
