package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import threego.model.dao.CommentDAO;
import threego.model.service.CommentService;
import threego.model.vo.Comment_tb;

/**
 * Servlet implementation class CommentListCtrl
 */




@WebServlet("/commentlist")
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("/commentlist진입");
		
		
		
		final int pageSize = 100; // 한페이지당 글 수
		final int pageBlock = 5; // 화면에 나타날 페이지 링크 수 dP) 화면 하단에 1 2 3

		CommentService cs = new CommentService();

		int cnt = 0; 
		int bd_content_no = (Integer.parseInt(request.getParameter("bd_content_no")));
	
		cnt = cs.getCommentCount(bd_content_no);
	
	
		/*페이지 조회*/
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
		
		List<Comment_tb> list = null;

		list = cs.getCommentByPage(startRnum, endRnum, bd_content_no);
/////	
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("pageCnt", pageCnt);
		jsonObject.addProperty("startPage", startPage);
		jsonObject.addProperty("endPage", endPage);
		jsonObject.addProperty("currentPage", currentPage);
		try {
			JsonArray jArray = new JsonArray();
			for(int i=0; i<list.size(); i++) {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("com_writer", list.get(i).getCom_writer());
				jobj.addProperty("com_contents", list.get(i).getCom_contents());
				String nowDate = list.get(i).getRv_date();
				jobj.addProperty("rv_date", nowDate);	
				jobj.addProperty("com_no", list.get(i).getCom_no());
				jArray.add(jobj);
			}
			jsonObject.add("List", jArray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		                
		        
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(jsonObject);		
		response.getWriter().write(jsonOutput.toString());
		//request.getRequestDispatcher("/WEB-INF/board/boardreaed.jsp").forward(request, response);
	}
}
		