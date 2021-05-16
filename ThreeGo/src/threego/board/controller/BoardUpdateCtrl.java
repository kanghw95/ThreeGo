package threego.board.controller;

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

import threego.model.service.BoardService;
import threego.model.vo.Board;
import threego.model.vo.Board_Attach;

/**
 * Servlet implementation class BoardUpdateCtrl2
 */
@WebServlet("/boardupdate")
public class BoardUpdateCtrl extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public BoardUpdateCtrl() {
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

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      execute(request, response);
   }

   private void execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      int result = 0;
      List<Board_Attach> inputF = null;
      Board vo = new Board();
      BoardService sv = new BoardService();
      Board_Attach ao = new Board_Attach();
      String bd_content_no = (String) request.getParameter("bd_content_no");
      String bd_subject = request.getParameter("bd_subject");
      String bd_writer = request.getParameter("bd_writer");
      String bd_content = request.getParameter("bd_content");

      vo.setBd_content_no(Integer.parseInt(bd_content_no));


      inputF = sv.boardReadF(inputF, vo); // ctrl 1에서파일 가져오기   파일 정보 가져옴
      System.out.println("파일 정보 담아오기" + inputF);
      vo.setBd_subject(bd_subject);
      vo.setBd_content(bd_content);
   
      
   

      request.setAttribute("bd_content_no", bd_content_no);
      request.setAttribute("bd_subject", bd_subject);
      request.setAttribute("bd_content", bd_content);
      Gson gson= new GsonBuilder().create();
      String files = gson.toJson(inputF);
      System.out.println("여기에는 기존 이미지가 담겨져있습니다"+files);
      
      request.setAttribute("files", files);
      System.out.println("여기는 updatectrl1 마지막 줄 입니다 update.jsp로 이동합니다");
      request.getRequestDispatcher("/WEB-INF/main/board_main/update.jsp").forward(request, response);
   }
}