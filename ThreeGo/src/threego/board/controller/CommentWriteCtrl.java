package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import threego.model.service.BoardService;
import threego.model.service.CommentService;
import threego.model.vo.Comment_tb;

/**
 * Servlet implementation class CommentWriteCtrl
 */
@WebServlet("/commentwrite")
public class CommentWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentWriteCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		try {
		CommentService cs = new CommentService();
		
		Comment_tb co = new Comment_tb();
		String user_name = request.getParameter("user_name");
		int user_no = (Integer.parseInt(request.getParameter("user_no")));
		//int com_no = (Integer.parseInt(request.getParameter("com_no")));
		
		//co.setCom_no(com_no);
		co.setCom_writer(user_name);
		co.setUser_no(user_no);
		co.setCom_contents(request.getParameter("com_contents"));
		int no = Integer.parseInt(request.getParameter("bd_content_no"));
		co.setBd_content_no(no);
			
			System.out.println(co.toString());
			int result = cs.CommentWrite(co);
			PrintWriter out = response.getWriter();
			if (result > 0) { // 정상입력
				System.out.println("정상입력");
				String msg = "글 등록 완료";

				out.println("<script>alert('" + msg + "')</script>");
				out.println("<script>location.href='"+ request.getContextPath()+"/boardRead?bd_content_no="+no+"';</script>");



			} else { // 입력 실패
				System.out.println("입력 실패");

				out.println("<script>alert('입력실패')</script>");
				out.println("<script>history.back();</script>");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}