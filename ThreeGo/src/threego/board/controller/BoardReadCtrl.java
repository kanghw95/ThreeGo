package threego.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threego.admin.Admin;
import threego.model.service.BoardService;
import threego.model.vo.Board;
import threego.model.vo.BoardLike;
import threego.model.vo.Board_Attach;

/**
 * Servlet implementation class BoardReadCtrl
 */
@WebServlet("/boardRead")
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
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("정상작동합니다.");
      execute(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("정상작동합니다1.");
      execute(request, response);
   }

   private void execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("정상작동합니다2.");
      BoardService sv = new BoardService();
      Admin admin = (Admin) request.getSession().getAttribute("admin");
      Board vo = new Board();
//      Board_Attach inputF = new Board_Attach();
      List<Board_Attach> inputF = null;
      String str = request.getParameter("bd_content_no");
      String bd_category_1 = request.getParameter("bd_category_1");
      String user_no = request.getParameter("user_no");
      BoardLike blvo = new BoardLike();     
   

            if (str != null ) {
               vo.setBd_content_no(Integer.parseInt(str));
               vo = sv.getBoardRead(vo, bd_category_1);
               inputF = sv.boardReadF(inputF, vo);
               blvo =sv.getLike(str,user_no);
               request.setAttribute("like", blvo);
               System.out.println(blvo);
               System.out.println("첨부파일 정보:" + inputF);

               if (vo != null) {
            	  request.setAttribute("str", Integer.parseInt(str));
                  request.setAttribute("boardread", vo);
                  request.setAttribute("files", inputF);
                  request.setAttribute("bd_category", bd_category_1);
                  if(admin !=null) {
                	  request.getRequestDispatcher("/WEB-INF/view/admin/admin_boardread.jsp").forward(request, response);
                  }else {
                  request.getRequestDispatcher("/WEB-INF/main/board_main/read.jsp").forward(request, response);
                  }
                  
               
                }
               } else {
                  System.out.println("존재하지 않는 게시물입니다.");
               }
               
            
            }

         }

      
