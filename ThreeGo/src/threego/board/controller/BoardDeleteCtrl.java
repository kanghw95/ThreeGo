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
import threego.model.vo.Board_Attach;
import threego.model.vo.User;

/**
 * Servlet implementation class BoardDeleteCtrl
 */
@WebServlet("/boarddelete")
public class BoardDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteCtrl() {
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
	
	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int result = 0;
		Board vo = new Board();

		BoardService sv = new BoardService();
		String bd_content_no = (String) request.getParameter("bd_content_no");
		vo.setBd_content_no(Integer.parseInt(bd_content_no));
		
		result = sv.getBoardDelete(vo);
		
		PrintWriter out = response.getWriter();
		if (result == 1) {
			String msg = "글 삭제 완료";
			out.println("<script>alert('" +msg+"')</script>");
			out.println("<script>location.href='./boardlist1';</script>");
		}
	}
}
