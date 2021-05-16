package threego.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.AdminService;
import threego.model.service.BoardService;
import threego.model.vo.BoardLike;

/**
 * Servlet implementation class BoardLikeCtrl
 */
@WebServlet("/boardlike")
public class BoardLikeCtrl extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeCtrl() {
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
      int user_no = Integer.parseInt(request.getParameter("user_no"));
      int bd_no = Integer.parseInt(request.getParameter("bd_no"));
      String str = request.getParameter("likech");
      String bd_category_1=request.getParameter("bd_category_1");
      int likech = 0;
      int result=0;
      if(str.equals("")) {
         likech = 1;
      }else {
         likech = 0;
      }
      BoardService sv = new BoardService();
      result= sv.giveLike(bd_no, user_no, likech);
      
      BoardLike blvo = new BoardLike();
      blvo =sv.getLike(Integer.toString(likech),Integer.toString(user_no)); 
      request.setAttribute("like", blvo);
      
      if(result != 0) {
    	  PrintWriter out = response.getWriter();
      if(blvo != null) {
    	  out.println("<script>alert('추천이 되었습니다.');</script>");
      }else {
    	  out.println("<script>alert('추천이 취소 되었습니다.');</script>");
      }
      out.println("<script>location.href='"+ request.getContextPath()+"/board/boardlist"+"';</script>");
      out.close();
      }
   
      
   }

}