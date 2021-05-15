package threego.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.Admin;
import threego.admin.AdminService;
import threego.admin.FAQ;
import threego.admin.QNA;
import threego.admin.QNA_USER;
import threego.model.vo.User;

/**
 * Servlet implementation class AdminNotifyCtrl
 */
@WebServlet("/adminnotify")
public class AdminNotifyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNotifyCtrl() {
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
		int cnt = 0;
		String search = request.getParameter("search");
		
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
//		//회원의수
		cnt= sv.getNotifyCount(search);
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
		
		/**여기부터**/
		/**여기부터**/
		/**여기부터**/
		/**여기부터**/
		/**여기부터**/
		/**여기부터**/
		List<FAQ> list = null;
		/********** 검색 *************/
		if(search != null && !search.equals("")) {
		} else {
			search = null;
		}
//		if(search ==null) {
//			list = new AdminService().list();
//		}else {
		list = new AdminService().getNotifyByPage(startRnum,endRnum ,search);
//		}
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("search", search);
		User user = (User) request.getSession().getAttribute("user");
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		System.out.println("user:"+user);
//		List<User> list = new AdminService().list();
		request.setAttribute("list", list);
		if(user!=null) {
			request.getRequestDispatcher("WEB-INF/main/user_main/usernotify.jsp").forward(request, response);
		}
		else if(user==null && admin==null) {
			request.getRequestDispatcher("WEB-INF/main/user_main/usernotify.jsp").forward(request, response);
		}
		else{
//			request.getRequestDispatcher("/WEB-INF/view/admin/admin_notify.jsp").forward(request, response);
			request.getRequestDispatcher("WEB-INF/main/admin_main/adminnotify.jsp").forward(request, response);
		}
	}


}
