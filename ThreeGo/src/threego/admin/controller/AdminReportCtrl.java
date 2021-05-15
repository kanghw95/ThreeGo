package threego.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.admin.Report;
import threego.model.vo.User;

/**
 * Servlet implementation class AdminReportCtrl
 */
@WebServlet("/adminreportctrl")
public class AdminReportCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//한 페이지에 10개씩, 5묶음까지 보임.
		final int pageSize = 10; 
		final int pageBlock = 5; 
		
		AdminService sv= new AdminService();

//		//총 회원의 갯수,검색
		String type = request.getParameter("type");
		System.out.println(type);
		int cnt = 0;
		
//		//회원의수
		cnt= sv.getReportCount(type);
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
		
//		//보여지는 시작,끝 페이지
		int startPage = 1;
		int endPage = 5;
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
		
		List<Report> list = null;
		/********** 검색 *************/
		list = new AdminService().getPeportByPage(startRnum,endRnum ,type);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("type", type);
//		List<User> list = new AdminService().list();
		if (list != null) {
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/main/admin_main/adminreport.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("WEB-INF/main/admin_main/adminreport.jsp").forward(request, response);
		}
	
	
	
	}

}
