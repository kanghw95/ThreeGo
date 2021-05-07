package threego.model.controller;
//package threego.model.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import java.util.Enumeration;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.jsp.PageContext;
//
//import org.apache.commons.io.FilenameUtils;
//
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//
//import threego.model.service.BoardService;
//import threego.model.vo.Board_Attach;
//import threego.model.vo.Board;
//
///**
// * Servlet implementation class BoardWriteCtrl
// */
//@WebServlet("/boardWrite.do")
//public class BoardWriteCtrl extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#HttpServlet()
//	 */
//	public BoardWriteCtrl() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		execute(request, response);
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		execute(request, response);
//	}
//
//	private void execute(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
////		String saveDirectory = "d:\\abc";   // 서버 PC 상의 절대 경로
//		String saveDirectory = "/files"; // 웹 서버 상의 절대 경로
//		String encType = "utf-8"; // 인코딩 타입
//		int maxSize = 5 * 1024 * 1024; // 업로드 파일의 최대크기 5Mb
//		
//		
//		
//		
//		try {
//			BoardService sv = new BoardService();
//
////			 saveDirectory 폴더가 없다면 생성
//			String root = getServletContext().getRealPath("/");
//			File path = new File(root + saveDirectory);
//			System.out.println("root: " + root);
//			System.out.println("path: " + path);
//			if (!path.exists()) {
//				path.mkdirs();
//			}
//			// saveDirectory에 file 저장됨.
//			saveDirectory = getServletContext().getRealPath("/files");
//
//			MultipartRequest mReq = new MultipartRequest(request, saveDirectory, maxSize, encType,
//					new DefaultFileRenamePolicy());
//
//// 저장된 file 의 정보(file 경로 + file name) 를 읽어오기 --> DB에 저장할 내용임
//			String fileName = "";
//			Enumeration<?> files = mReq.getFileNames();
//
//			Board vo = new Board();
//
//			vo.setBd_writer(mReq.getParameter("bd_writer"));
//			vo.setBd_subject(mReq.getParameter("bd_subject"));
//			vo.setBd_content(mReq.getParameter("bd_content"));
//
//			// hidden 으로 들어온 데이터 적용
//			if (mReq.getParameter("bd_content_no") != null && !mReq.getParameter("bd_content_no").equals("")) { // 답글인
//																												// 경우
//				vo.setBd_content_no(Integer.parseInt(mReq.getParameter("bd_content_no")));
//			} else {
//				vo.setBd_content_no(0); // 새글임을 표시함
//			}
//			int bno= sv.getNext();  //게시물 번호
//			vo.setBd_content_no(bno);
//			int result = sv.boardWrite(vo);
//
//			PrintWriter out = response.getWriter();
//			if (result > 0) { // 정상 입력 
//
//					while (files.hasMoreElements()) {
//						List<Board_Attach> fileNames = new ArrayList<Board_Attach>(); 
//						BoardService svF = new BoardService();
//						String name = (String) files.nextElement(); // input type="file" name="xxxxxxx", 즉 bfilepath 와
//											
//						// bfilepaths
//						fileName = mReq.getFilesystemName(name); // 서버에 저장된 파일이름
//						File f1 = mReq.getFile(name); // 서버에 file이 정상적으로 저장되어있는지 다시 읽어와서 확인함.
//						fileNames.add();
//						mReq.getContentType(fileName);
//						System.out.println("파일테스트"+fileName);
//		 확장자 구히기
//						String extension = FilenameUtils.getExtension(uploadfile.getOriginalFilename());
//
//		파일 명 구하기
//						String fullName = FilenameUtils.getBaseName(uploadfile.getOriginalFilename());
//						Board_Attach ao = new Board_Attach();
//						ao.setContents_type(extension);
//						ao.setFile_size();
//						ao.setFullname(fileName);
//						ao.setFilepath(saveDirectory);
//
//
//
//						if (f1 == null) {
//							System.out.println("파일 업로드 실패");
//						} else {
//							System.out.println("파일 업로드 성공 : " + f1.length()); // 파일 크기 확인
//						}
//					}
//
//					
//					
//				int resultF = sv.boardWriteF( inputF);
//				}
//				
//				System.out.println("정상 입력");
//				String msg = "글 등록 완료";
//			request.setAttribute("msg", "글 등록 완료");
//			request.getRequestDispatcher("/board/boardwrite.jsp").forward(request, response);
//			response.sendRedirect("boardlist.do");
//
//				out.println("<script>alert('" + msg + "')</script>");
//				out.println("<script>location.href='./boardlist.do';</script>");
//			response.sendRedirect("boardlist.do");
//			} else { // 입력 실패
//				System.out.println("입력 실패!!");
//			request.setAttribute("msg", "글 등록 실패");
//			request.getRequestDispatcher("/board/boardwrite.jsp").forward(request, response);
//				out.println("<script>alert('입력 실패!')</script>");
//				out.println("<script>history.back();</script>");
//				
//				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
//
//}
