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
 * Servlet implementation class BoardDelete
 */
@WebServlet("/boarddelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDelete() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Board vo = new Board();
		BoardService sv = new BoardService();
		PrintWriter out = response.getWriter();
		
		String str = request.getParameter("bno");
		if (str != null) {
			vo.setBno(Integer.parseInt(str));
			sv.boardDelete(vo);
			out.println("<script>alert('글이 삭제되었습니다.')</script>");
			out.println("<script>location.href='./boardlist.do';</script>");
		}
	}

}
