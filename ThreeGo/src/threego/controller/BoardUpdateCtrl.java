package threego.controller;

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
	
		private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService sv = new BoardService();
		Board vo = new Board();
		
		
	
		int bd_content_no = Integer.parseInt(request.getParameter("bd_content_no"));
		vo.setBd_content_no(bd_content_no);
		
		vo = sv.getBoardRead(vo);
		
		PrintWriter out = response.getWriter();
	
			request.setAttribute("vo",vo);
			request.getRequestDispatcher("/board/boardupdate.jsp").forward(request, response);
		}
	}


