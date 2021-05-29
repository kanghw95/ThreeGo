package threego.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.model.service.BoardService;
import threego.model.vo.Board;

/**
 * Servlet implementation class BoardListRVCtrl
 */
@WebServlet("/boardlist")
public class BoardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListCtrl() {
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
		String a =request.getParameter("bd_category");
		System.out.println("라이트에서 넘어온 컨테트넘버"+a);
		final int pageSize = 10;  
		final int pageBlock = 5;   
		System.out.println("이동완료");
		BoardService sv = new BoardService();
		
		int cnt = 0;   // 
	
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
		Board vo = new Board();
		

		String bd_category_1 = request.getParameter("bd_category_1");
		cnt= sv.getBoardCount(search,bd_category_1);
		System.out.println(cnt);
		int pageCnt = (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1); 
		
		int currentPage = 1;  
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null) {  
			try {
				currentPage = Integer.parseInt(pageNum);
			}catch (Exception e){
				e.printStackTrace();
			}
		}
			
		int startPage = 1; 
		int endPage = 5;
		
		if(currentPage % pageBlock == 0)   { 
			startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;	
		}else {
			startPage = (currentPage/pageBlock) * pageBlock + 1;  
		}		
		endPage = startPage + pageBlock - 1;
	
		if(endPage > pageCnt)
			endPage = pageCnt;
		
		int startRnum = (currentPage-1)*pageSize +1;
		int endRnum = startRnum + pageSize - 1;
		if(endRnum > cnt) 
			endRnum = cnt;
		
		List<Board> list = null;
		/********** 서치 *************/
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
		list = sv.getBoardByPage(startRnum,endRnum, search,bd_category_1);
		System.out.println(list);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("boardList", list);
		request.setAttribute("search", search);
		request.setAttribute("bd_category", bd_category_1);
		
		   request.getRequestDispatcher("/WEB-INF/main/board_main/list.jsp").forward(request, response);
		
		
	}
	
	
}
