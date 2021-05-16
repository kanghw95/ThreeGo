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
import threego.model.vo.Board_Attach;
import threego.model.vo.Comment_tb;

/**
 * Servlet implementation class CommentUpdateCtrl2
 */
@WebServlet("/commentupdatectrl2")
public class CommentUpdateCtrl2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateCtrl2() {
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
		Comment_tb co = new Comment_tb();
		CommentService cs = new CommentService();
		
		int bd_content_no = (Integer.parseInt(request.getParameter("bd_content_no")));
		String com_contents= request.getParameter("com_contents");
		String com_no = request.getParameter("com_no");
		//String rv_date = request.getParameter("rv_date");
		System.out.println("com_no:"+ com_no);
		co.setBd_content_no(bd_content_no);
		co.setCom_no(Integer.parseInt(com_no));
		co.setCom_contents(com_contents);
		//co.setRv_date(rv_date);

		result = cs.getCommentUpdate(co);
				
			
		 
		PrintWriter out = response.getWriter();
		if (result== 1) {
			out.println("<script>alert('글 수정 완료')</script>");
			out.println("<script>location.href='./boardlist1';</script>");
		} else {
			out.println("<script>alert('글 수정에 실패하였습니다!')</script>");
			out.println("<script>location.href='./boardlist1';</script>");
		}
	
}
	
}
