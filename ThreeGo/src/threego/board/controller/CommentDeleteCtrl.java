package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.BoardService;
import threego.model.service.CommentService;
import threego.model.vo.Board;
import threego.model.vo.Comment_tb;

/**
 * Servlet implementation class CommentDeleteCtrl
 */
@WebServlet("/commentdelete")
public class CommentDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteCtrl() {
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
		Comment_tb co = new Comment_tb();

		CommentService cs = new CommentService();
		String bd_content_no = (String) request.getParameter("bd_content_no");
		co.setBd_content_no(Integer.parseInt(bd_content_no));
		
		result = cs.getCommentDelete(co);
		
		PrintWriter out = response.getWriter();
		if (result == 1) {
			String msg = "글 삭제 완료";
			out.println("<script>alert('" +msg+"')</script>");
			out.println("<script>location.href='./boardlist1';</script>");
		}
	}
}
