package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
@WebServlet("/boardreport")
public class BoardReportCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReportCtrl() {
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
		      BoardService sv = new BoardService();
		      Board vo = new Board();
		      String str = request.getParameter("bd_content_no");

		   
		   

		            if (str != null ) {
		               vo.setBd_content_no(Integer.parseInt(str));
		               vo = sv.getBoardRead(vo);
		               

		               if (vo != null) {
		                  request.setAttribute("boardread", vo);
		                  
		                  request.getRequestDispatcher("/WEB-INF/main/board_main/report.jsp").forward(request, response);
		                  
		                  
		               
		                }
		               } else {
		                  System.out.println("존재하지 않는 게시물입니다.");
		               }
		               
		            
		            }

		         }

		      
