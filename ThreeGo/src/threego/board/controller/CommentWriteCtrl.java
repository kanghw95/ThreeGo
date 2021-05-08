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
		
		co.setCom_writer("이경은");
		co.setUser_no(4);
		co.setCom_contents(request.getParameter("com_contents"));
		String no = request.getParameter("bd_content_no");
		co.setBd_content_no(Integer.parseInt(no));

			if (request.getParameter("com_no") != null && ! request.getParameter("com_no").equals("")) { // 답글인 경우
				co.setCom_no(Integer.parseInt(request.getParameter("com_no")));
				co.setCom_ref(Integer.parseInt(request.getParameter("com_ref")));
				co.setCom_re_step(Integer.parseInt(request.getParameter("com_re_step")));
				co.setCom_re_level(Integer.parseInt(request.getParameter("com_re_level")));
				
				
				
			} else {
				co.setCom_no(0); // 새글인 경우+
			}
			System.out.println(co.toString());
			int result = cs.CommentWrite(co);
			PrintWriter out = response.getWriter();
			if (result > 0) { // 정상입력
				System.out.println("정상입력");
				String msg = "글 등록 완료";

				out.println("<script>alert('" + msg + "')</script>");
				out.println("<script>location.href='./boardRead?bd_content_no="+no+"';</script>");


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