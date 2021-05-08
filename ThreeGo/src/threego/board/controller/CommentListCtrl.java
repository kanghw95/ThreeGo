package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import threego.model.dao.CommentDAO;
import threego.model.service.CommentService;
import threego.model.vo.Comment_tb;

/**
 * Servlet implementation class CommentListCtrl
 */
@WebServlet("/commentlist.do")
public class CommentListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentListCtrl() {
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
// doGe을 없앴네요.
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("/commentlist.do진입");
		
		final int pageSize = 5; // 한페이지당 글 수
		final int pageBlock = 3; // 화면에 나타날 페이지 링크 수 dP) 화면 하단에 1 2 3

		CommentService sv = new CommentService();

		int cnt = 0; // 총 글 개수
		/********** 검색 *************/
		String search = request.getParameter("search");
		String bd_content_no_str = request.getParameter("bd_content_no");
		System.out.println("bd_content_no_str:"+ bd_content_no_str);
		int bd_content_no = 0;
		if (bd_content_no_str != null && !bd_content_no_str.equals("")) {
			bd_content_no = Integer.parseInt(bd_content_no_str);
		}

		if (search != null && !search.equals("")) {
		} else {
			search = null;
		}
		cnt = sv.getCommentCount(search, bd_content_no);

		int pageCnt = (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1); // 총 페이지 개수

		int currentPage = 1; // 현재 페이지. 기본 세팅 1. 클릭되면 바뀌게 됨.
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum:" + pageNum);
		if (pageNum != null && !pageNum.equals("")) { // 클린 된 숫자를 가지고 온다면
			try {
				currentPage = Integer.parseInt(pageNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int startPage = 1; // 화면에 나타날 시작 페이지
		int endPage = 1; // 화면에 나타날 마지막 페이지

		// 문제 구간 생김. currentPage가 pageBlock 배수인 경우 오류 발생 즉, 3,6,9..
		if (currentPage % pageBlock == 0) { // currentPage가 pageBlock 배수인 경우
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		// 총 페이지 개수보다 endPage가 더 클 수 없음.
		if (endPage > pageCnt)
			endPage = pageCnt;

		int startRnum = (currentPage - 1) * pageSize + 1;
		int endRnum = startRnum + pageSize - 1;
		if (endRnum > cnt)
			endRnum = cnt;

		List<Comment_tb> list = null;
		/********** 검색 *************/
		if (search != null && !search.equals("")) {
		} else {
			search = null;
		}
		list = sv.getCommentByPage(startRnum, endRnum, search, bd_content_no);

		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("commentList", list);
		request.setAttribute("search", search);
		// request.getRequestDispatcher("/board/boardreaed.jsp").forward(request,
		// response);

		CommentService cs = new CommentService();

		PrintWriter out = response.getWriter();
		CommentDAO dao = new CommentDAO();

		String jsonlist = "";
//		List<Comment_tb> clist = new CommentService().getCommentAll(bd_content_no);  // page 처리 안할거면.. 이거 사용
//		System.out.println(clist);
//		Gson jobj = new GsonBuilder().create();
//		jsonlist = jobj.toJson(clist);

		System.out.println(list);
		Gson jobj = new GsonBuilder().create();
		jsonlist = jobj.toJson(list);// page 처리 할거면.. 이거 사용
		
		System.out.println(jsonlist);
		out.println(jsonlist);
		out.flush();
		out.close();
	}

}
