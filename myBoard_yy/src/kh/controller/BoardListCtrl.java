package kh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.model.Board;
import kh.model.BoardService;

/**
 * Servlet implementation class BoardListCtrl
 */
@WebServlet("/boardlist.do")
public class BoardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardListCtrl() {
		super();
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

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//한 페이지에 10개씩, 3묶음까지 보임.
		final int pageSize = 10; 
		final int pageBlock = 3; 
		
		BoardService sv= new BoardService();

		//총 글의 갯수,검색
		int cnt = 0;
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
		cnt= sv.getBoardCount(search);
		//총 페이지 갯수
		int pageCnt = (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1);
		
		// 초기값 1 , 그 밑은 페이지를 눌렀을 때.
		int currentPage = 1;
		String pageNum = request.getParameter("pageNum");
		if (pageNum != null) {
			try {
				currentPage = Integer.parseInt(pageNum);
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		
		//보여지는 시작,끝 페이지
		int startPage = 1;
		int endPage = 1;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		// 총 페이지 개수보다 endPage가 더 클 수 없음.
		if(endPage > pageCnt)
			endPage = pageCnt;
		
		
		int startRnum = (currentPage-1)*pageSize +1;
		int endRnum = startRnum + pageSize - 1;
		if(endRnum > cnt) 
			endRnum = cnt;
		List<Board> list = null;
		/********** 검색 *************/
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
		list = sv.getBoardByPage(startRnum,endRnum, search);
		
		
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("boardList", list);
		request.setAttribute("search", search);
		request.getRequestDispatcher("/board/boardlist.jsp").forward(request, response);
	}

}
