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

/**
 * Servlet implementation class BoardUpdateCtrl2
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
		int result=0;
		Board vo = new Board();
		BoardService sv = new BoardService();
		Board_Attach ao = new Board_Attach();
		String bd_content_no = (String) request.getParameter("bd_content_no");
		String bd_subject= request.getParameter("bd_subject");
		String bd_content = request.getParameter("bd_content");
		String fullname = request.getParameter("fullname");
		String filepath = request.getParameter("filepath");
		String contents_type = request.getParameter("contents_type");
		
				vo.setBd_content_no(Integer.parseInt(bd_content_no));
				vo.setBd_subject(bd_subject);
				vo.setBd_content(bd_content);
				ao.setFilepath(filepath);
				ao.setFullname(fullname);
				ao.setContents_type(contents_type);
				//vo.setBd_likecnt(Integer.parseInt(request.getParameter("bd_likecnt")));
				
				
			request.setAttribute("bd_content_no", bd_content_no);
			request.setAttribute("bd_subject", bd_subject);
			request.setAttribute("bd_content", bd_content);
			request.setAttribute("fullname", fullname);
			request.setAttribute("filepath", filepath);
			request.setAttribute("contents_type", contents_type);
			request.getRequestDispatcher("/WEB-INF/main/board_main/update.jsp").forward(request, response);
	}
}
			 
	