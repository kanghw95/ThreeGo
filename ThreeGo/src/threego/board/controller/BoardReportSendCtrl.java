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
@WebServlet("/boardreportsend")
public class BoardReportSendCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardReportSendCtrl() {
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
		System.out.println("들어왔음");
		  	int result =0;
		  	BoardService sv = new BoardService();
		  	Board vo = new Board();
		  	String user_no = request.getParameter("user_no");
		  	String user_no2 = request.getParameter("user_no2");
		  	String report_content = request.getParameter("report_content");
		  	String bd_content_no = request.getParameter("bd_content_no");
		  	
		  	result = sv.ReportSend(user_no, user_no2, report_content,bd_content_no);
		      
		            if (result >0 ) {
		               System.out.println("신고완료");
		            	request.getRequestDispatcher("/WEB-INF/main/main.jsp").forward(request, response);

		               } else {
		                  System.out.println("에러 확인요망");
		               }
		               
		            
		            }

}
