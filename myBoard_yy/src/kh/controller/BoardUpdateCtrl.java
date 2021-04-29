package kh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.model.Board;
import kh.model.BoardService;

/**
 * Servlet implementation class BoardUpdateCtrl
 */
@WebServlet("/boardupdate.do")
public class BoardUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board vo = new Board();
		BoardService sv = new BoardService();
		PrintWriter out  = response.getWriter();
		
		String str= request.getParameter("bno");
		if(str!=null) {
			vo.setBno(Integer.parseInt(str));
			vo.setBcontent(request.getParameter("bcontent"));
			sv.boardUpdate(vo);
			out.println("<script>alert('글이 수정되었습니다.')</script>");
			out.println("<script>location.href='./boardlist.do';</script>");
		}else {
			System.out.println("왜 비었을까나,,,");
		}
	}

}
