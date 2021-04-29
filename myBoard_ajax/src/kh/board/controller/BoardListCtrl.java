package kh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.Board;
import kh.board.model.BoardService;

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
		final int pageSize = 10;  // 한페이지당 글 수
		final int pageBlock = 3;  // 화면에 나타날 페이지 링크 수   dP) 화면 하단에 1 2 3 

		BoardService sv = new BoardService();
		
		int cnt = 0;   // 총 글 개수
		/********** 검색 *************/
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
		cnt= sv.getBoardCount(search);
		
		int pageCnt = (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1); // 총 페이지 개수
		
		int currentPage = 1;  // 현재 페이지. 기본 세팅 1. 클릭되면 바뀌게 됨.
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null) {  // 클린 된 숫자를 가지고 온다면
			try {
				currentPage = Integer.parseInt(pageNum);
			}catch (Exception e){
				e.printStackTrace();
			}
		}
			
		int startPage = 1; // 화면에 나타날 시작 페이지
		int endPage = 1; // 화면에 나타날 마지막 페이지
		
		// 문제 구간 생김. currentPage가 pageBlock 배수인 경우 오류 발생 즉, 3,6,9..
		if(currentPage % pageBlock == 0)   { //  currentPage가 pageBlock 배수인 경우 
			startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;	
		}else {
			startPage = (currentPage/pageBlock) * pageBlock + 1;  
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
