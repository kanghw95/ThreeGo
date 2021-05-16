package threego.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Param;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import common.fileupload.MultiPart;
import threego.model.service.BoardService;
import threego.model.vo.Board;
import threego.model.vo.Board_Attach;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.fileupload.MultiPart;
import threego.model.service.BoardService;
import threego.model.vo.Board_Attach;
import threego.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateCtrl2
 */
@WebServlet("/boardupdate2")
public class BoardUpdateCtrl2 extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public BoardUpdateCtrl2() {
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
      Board vo = new Board();
      BoardService sv = new BoardService();
      Board_Attach ao = new Board_Attach();

      String imgfolder = "/images";

      MultiPart mReq = null;
      try {

         mReq = new MultiPart(request);
         System.out.println("mreq:" + mReq);

      } catch (Exception e1) {
         e1.printStackTrace();
      }

      ServletContext context = request.getServletContext();
      String uploadPath = context.getRealPath("/"); // 경로

      System.out.println("현재 경로는 :" + uploadPath);
      File path = new File(uploadPath + "/images");
      if (!path.exists()) {
         path.mkdirs();
      }

      uploadPath = path.toString() + "/";

      System.out.println("uploadPath: " + uploadPath);

      ArrayList<String> images = null;
      String imageNames = null;
      String bd_content_no = mReq.getParameter("bd_content_no");
      String bd_category_1 = request.getParameter("bd_category_1");
      String uploads = mReq.getParameter("uploads");
      System.out.println("무시하지 말라고 "+uploads);
      
      vo.setBd_content_no(Integer.parseInt(bd_content_no));

//기존 첨부파일 삭제
      try {
         if (bd_content_no != null && uploads != null && !uploads.equals("")) {

            int deleteR = 0;
            deleteR = sv.getFileDelete(vo); // 파일 delete 제거
             System.out.println("첨부파일 삭제가 됨!!!!!");

         }
         else { 
         }
         

         // 게시판 글 수정

         // cotentNo 위에서 set
         vo.setBd_subject(mReq.getParameter("bd_subject"));
         vo.setBd_content(mReq.getParameter("bd_content"));
         int resultU = sv.getBoardUpdate(vo);
         System.out.println("게시글 수정2");

//변경된 첨부파일 insert 
         try {
            images = mReq.saveFiles("uploads", uploadPath);
            if (images != null) {

               for (int cnt = 0; cnt < images.size(); cnt++) {
                  System.out.println("cnt" + cnt);
                  System.out.println("image path: " + images.get(cnt));
                  String imageName = images.get(cnt);
                  String extension = imageName.substring(imageName.indexOf('.') + 1);
                  System.out.println("extension:" + extension); // 확장자 확인

                  ao.setContents_type(extension); // 확장자
                  ao.setFullname(imageName); // 이름
                  ao.setFilepath(imgfolder); // 경로
                  BoardService svF = new BoardService(); // 첨부파일 세팅할때 필요
                  int inputF = svF.fileinsert(ao, vo , bd_category_1); // content no 가져와야 해서

               }

            }
            request.setAttribute("images", images); // 담긴 이미지
            System.out.println("수정할 이미지들 입니다" + images);
         } catch (Exception e) {
            System.out.println("첨부파일 유지1");
            e.printStackTrace();
         }

         PrintWriter out = response.getWriter();

         if (resultU > 0) { // 정상 입력
            System.out.println("inputF: " + resultU);

            if (images == null) {
               System.out.println("파일 수정 실패");
            } else {
               System.out.println("파일 수정 성공 : "); // 파일 크기 확인
            }

            System.out.println("게시물 수정완료");
            String msg = "글 수정 완료";
            out.println("<script>alert('글 수정 완료')</script>");
			out.println("<script>location.href='"+ request.getContextPath()+"/board/boardlist"+"';</script>");


         } else { // 입력 실패
            System.out.println("게시물 수정 실패!!");
            out.println("<script>alert('수정 실패!')</script>");
            out.println("<script>history.back();</script>");
         }

      } catch (Exception e) {
         System.out.println("첨부파일 유지2");
         e.printStackTrace();
      }
   }
}
