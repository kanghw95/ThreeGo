package threego.board.controller;

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
 * Servlet implementation class BoardWriteCtrl
 */
@WebServlet("/boardWrite")
public class BoardWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardWriteCtrl() {
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

		String imgfolder = "/images";

		MultiPart mReq = null;
		try {

			mReq = new MultiPart(request);
			System.out.println("mreq:" + mReq);

		} catch (Exception e1) {

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
		System.out.println("????????? ???????????? ");
		String bd_category_1 = mReq.getParameter("bd_category_1");
		
		Board vo = new Board();

		// ????????? ??? ??????
		try {

			BoardService sv = new BoardService();
			int bno = sv.getNext(bd_category_1); // ????????? ??????
			System.out.println("bno ???" + bno);
			vo.setBd_content_no(bno);

			vo.setBd_writer(mReq.getParameter("bd_writer"));
			System.out.println(mReq.getParameter("bd_writer"));
			vo.setBd_subject(mReq.getParameter("bd_subject"));
			vo.setBd_content(mReq.getParameter("bd_content"));
			vo.setUser_no(Integer.parseInt(mReq.getParameter("userno")));
			System.out.println("userno?????????:" + mReq.getParameter("userno"));

			int result = sv.boardWrite(vo, bd_category_1);

			// ????????????
			try {
				images = mReq.saveFiles("uploads", uploadPath);
				
				if (images != null) {

					Board_Attach ao = new Board_Attach();



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
						int inputF = svF.boardWriteF(ao,bd_category_1); // content no ???????????? ??????

					}

				}
				request.setAttribute("images", images); // ?????? ?????????
				request.setAttribute("bd_category", bd_category_1);
				System.out.println("?????? ???????????? ?????????" + images);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ??? ??????
			PrintWriter out = response.getWriter();

			if (result > 0) { // ?????? ??????
				System.out.println("result: " + result);

				if (images == null) {
					System.out.println("?????? ????????? ??????");
				} else {
					System.out.println("?????? ????????? ?????? : "); // ?????? ?????? ??????
				}

				System.out.println("?????? ??????");
				String msg = "??? ?????? ??????";

				out.println("<script>alert('" + msg + "')</script>");
				out.println("<script>location.href='"+ request.getContextPath()+"/boardlist"+"?"+"bd_category_1"+"="+bd_category_1+"';</script>");
			} else { // ?????? ??????
				System.out.println("?????? ??????!!");

				out.println("<script>alert('?????? ??????!')</script>");
				out.println("<script>history.back();</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}