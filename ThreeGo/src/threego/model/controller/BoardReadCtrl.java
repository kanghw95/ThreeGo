package threego.model.controller;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.BoardService;
import threego.model.vo.Board;



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
		System.out.println("정상작동합니다.");
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("정상작동합니다1.");
		execute(request, response);
	}
	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("정상작동합니다2.");
		BoardService sv =new BoardService();
		
		Board vo = new Board();
		String str = request.getParameter("bd_content_no");
		System.out.println(str);
		if(str!=null) {
			vo.setBd_content_no(Integer.parseInt(str));
		
			vo = sv.getBoardRead(vo);
			System.out.println("1"+vo);
			if(vo != null) {
				request.setAttribute("boardcontent", vo);
				request.getRequestDispatcher("/board/boardcontent.jsp").forward(request, response);
			} else {
				System.out.println("존재하지 않는 게시물입니다.");
			}
		}
		
	}

}
