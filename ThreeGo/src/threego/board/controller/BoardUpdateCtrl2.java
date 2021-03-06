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
      String uploadPath = context.getRealPath("/"); // ??????

      System.out.println("?????? ????????? :" + uploadPath);
      File path = new File(uploadPath + "/images");
      if (!path.exists()) {
         path.mkdirs();
      }

      uploadPath = path.toString() + "/";

      System.out.println("uploadPath: " + uploadPath);

      ArrayList<String> images = null;
      String imageNames = null;
      String bd_content_no = mReq.getParameter("bd_content_no");
      String bd_category_1 = mReq.getParameter("bd_category_1");
      System.out.println("bdcontentno"+bd_category_1);//here
      String uploads = mReq.getParameter("uploads");
      
      vo.setBd_content_no(Integer.parseInt(bd_content_no));

//?????? ???????????? ??????
      try {
            int deleteR = 0;
            deleteR = sv.getFileDelete(vo); // ?????? delete ??????
             System.out.println("???????????? ??????");

         // ????????? ??? ??????

         // cotentNo ????????? set
         vo.setBd_subject(mReq.getParameter("bd_subject"));
         vo.setBd_content(mReq.getParameter("bd_content"));
         int resultU = sv.getBoardUpdate(vo);

//????????? ???????????? insert 
         try {
            images = mReq.saveFiles("uploads", uploadPath);
            if (images != null) {

               for (int cnt = 0; cnt < images.size(); cnt++) {
                  System.out.println("cnt" + cnt);
                  System.out.println("image path: " + images.get(cnt));
                  String imageName = images.get(cnt);
                  String extension = imageName.substring(imageName.indexOf('.') + 1);
                  System.out.println("extension:" + extension); // ????????? ??????

                  ao.setContents_type(extension); // ?????????
                  ao.setFullname(imageName); // ??????
                  ao.setFilepath(imgfolder); // ??????
                  BoardService svF = new BoardService(); // ???????????? ???????????? ??????
                  int inputF = svF.fileinsert(ao, vo , bd_category_1); // content no ???????????? ??????

               }

            }
            request.setAttribute("images", images); // ?????? ?????????
            System.out.println("????????? ???????????? ?????????" + images);
         } catch (Exception e) {
            e.printStackTrace();
         }

         PrintWriter out = response.getWriter();

         if (resultU > 0) { // ?????? ??????
            System.out.println("inputF: " + resultU);

            if (images == null) {
               System.out.println("?????? ?????? ??????");
            } else {
               System.out.println("?????? ?????? ?????? : "); // ?????? ?????? ??????
            }
            System.out.println();
            System.out.println("????????? ????????????");
            String msg = "??? ?????? ??????";
            out.println("<script>alert('??? ?????? ??????')</script>");
			out.println("<script>location.href='"+ request.getContextPath()+"/boardRead"+"?"+"bd_content_no"+"="+bd_content_no+"';</script>");


         } else { // ?????? ??????
            System.out.println("????????? ?????? ??????!!");
            out.println("<script>alert('?????? ??????!')</script>");
            out.println("<script>history.back();</script>");
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}
