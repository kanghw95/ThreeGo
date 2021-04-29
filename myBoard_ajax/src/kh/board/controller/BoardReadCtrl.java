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
 * Servlet implementation class BoardReadCtrl
 */
@WebServlet("/boardRead.do")
public class BoardReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReadCtrl() {
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
		BoardService sv =new BoardService();
		
		Board vo = new Board();
		String str = request.getParameter("bno");
		if(str!=null) {
			vo.setBno(Integer.parseInt(str));
			vo = sv.getBoardRead(vo);
			if(vo != null) {
				request.setAttribute("boardcontent", vo);
				request.getRequestDispatcher("/board/boardcontent.jsp").forward(request, response);
			} else {
				System.out.println("vo가 널이네");
			}
		}
		
	}

}
