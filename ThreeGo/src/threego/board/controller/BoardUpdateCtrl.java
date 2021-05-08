package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.BoardService;
import threego.model.vo.Board;
import threego.model.vo.User;

/**
 * Servlet implementation class BoardUpdateCtrl
 */
@WebServlet("/boardupdate")
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

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		Board vo = new Board();
		BoardService sv = new BoardService();

		String bd_content_no = (String) request.getParameter("bd_content_no");
		String bd_subject= request.getParameter("bd_subject");
		String bd_content = request.getParameter("bd_content");
		System.out.println(bd_content_no);
		if (bd_content_no != null) {

			vo.setBd_content_no(Integer.parseInt(bd_content_no));
			vo.setBd_subject(bd_subject);
			vo.setBd_content(bd_content);
			//vo.setBd_likecnt(Integer.parseInt(request.getParameter("bd_likecnt")));

			result = sv.getBoardUpdate(vo);
		}

			request.setAttribute("bd_content_no", bd_content_no);
			request.setAttribute("bd_subject", bd_subject);
			request.setAttribute("bd_content", bd_content);
			request.getRequestDispatcher("/WEB-INF/board/boardupdate.jsp").forward(request, response);


		PrintWriter out = response.getWriter();
		if (result != 0) {
			String msg = "글 수정 완료";
			out.println("<script>alert('" + msg + "')</script>");
			out.println("<script>location.href='./boardlist';</script>");
		} else {
			String msg = "글 수정에 실패하였습니다!";
			out.println("<script>alert('" + msg + "')</script>");
			out.println("<script>location.href='./boardlist';</script>");
		}

	}

}
