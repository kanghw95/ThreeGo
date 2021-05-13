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
@WebServlet("/boardupdate2")
public class BoardUpdateCtrl2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateCtrl2() {
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
		int result1=0;
		int result2=0;
		Board vo = new Board();
		BoardService sv = new BoardService();
		Board_Attach ao = new Board_Attach();
		
		String bd_content_no = (String) request.getParameter("bd_content_no");
		String bd_subject= request.getParameter("bd_subject");
		String bd_content = request.getParameter("bd_content");
		String filepath = request.getParameter("filepath");
		String fullname = request.getParameter("fullname");
		String contents_type = request.getParameter("contents_type");
			if (bd_content_no != null) {

				vo.setBd_content_no(Integer.parseInt(bd_content_no));
				vo.setBd_subject(bd_subject);
				vo.setBd_content(bd_content);
				ao.setFilepath(filepath);
				ao.setFullname(fullname);
				ao.setContents_type(contents_type);
				//vo.setBd_likecnt(Integer.parseInt(request.getParameter("bd_likecnt")));

				result1 = sv.getBoardUpdate(vo);
				result2 = sv.getBoardUpdate(ao);
			}
		 
			PrintWriter out = response.getWriter();
			if (result1+result2 == 2) {
				out.println("<script>alert('글 수정 완료')</script>");
				out.println("<script>location.href='./boardlist1';</script>");
			} else {
				out.println("<script>alert('글 수정에 실패하였습니다!')</script>");
				out.println("<script>location.href='./boardlist1';</script>");
			}
			
	}
			
	}
	