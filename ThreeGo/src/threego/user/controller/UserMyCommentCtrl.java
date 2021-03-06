package threego.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import threego.model.service.BoardService;
import threego.model.service.CommentService;
import threego.model.service.UserService;
import threego.model.vo.Board;
import threego.model.vo.Comment_tb;
import threego.model.vo.User;

/**
 * Servlet implementation class UserMyPageCtrl
 */
@WebServlet("/usermycomment")
public class UserMyCommentCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyCommentCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final int pageSize = 5; // 한페이지당 글 수
		final int pageBlock = 5; // 화면에 나타날 페이지 링크 수 dP) 화면 하단에 1 2 3
		String user_no = request.getParameter("user_no");
		CommentService cs = new CommentService();

		int cnt = 0; // 총 글 개수
		/********** 검색 *************/;
//		String bd_content_no_str = request.getParameter("bd_content_no");
//		System.out.println("bd_content_no_str:"+ bd_content_no_str);
//		int bd_content_no = 0;
//		if (bd_content_no_str != null && !bd_content_no_str.equals("")) {
//			bd_content_no = Integer.parseInt(bd_content_no_str);
//		}
//		int bd_content_no = (Integer.parseInt(request.getParameter("bd_content_no")));
//		cnt = cs.getCommentCount(bd_content_no);
	
	
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

		list = cs.getCommentByPage(startRnum, endRnum,user_no);
	//////////////	
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
//				DateFormat Format = new SimpleDateFormat("yyyy-mm-dd hh24:mi:ss");
				String nowDate = list.get(i).getRv_date();
//				String today = Format.format(nowDate);
				jobj.addProperty("rv_date", nowDate);	
				
				jArray.add(jobj);
			}
			jsonObject.add("List", jArray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		        
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(jsonObject);		
		response.getWriter().write(jsonOutput.toString());
//		request.getRequestDispatcher("/WEB-INF/main/user_main/mycomment.jsp").forward(request, response);
	}
}
		