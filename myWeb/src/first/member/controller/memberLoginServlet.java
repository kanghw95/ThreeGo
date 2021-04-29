package first.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import first.member.model.service.MemberService;
import first.member.model.vo.Member;

/**
 * Servlet implementation class memberLoginServlet
 */
@WebServlet("/login")
public class memberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 페이지는 get 방식 허용하지 않음.");
		
		// url 부분에   
		// http://localhost:8090/myWeb/login?id=123&wd=456
//		System.out.println(request.getParameter("id"));   // 123
//		System.out.println(request.getParameter("wd"));   // 456
		
		// 페이지 이동 방법 1
		// response 객체 사용,  sendRedirect, url 변화 ( index.jsp 으로 바뀜 )
//		response.sendRedirect("index.jsp");
		
		// 페이지 이동 방법 2 
		// request 객체 사용, forward, url 변화 없음 ( /login 유지)
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		Member vo = new Member();
		vo.setId(id);
		vo.setPasswd(passwd);
		Member resultVO = new Member();
		resultVO = new MemberService().login(vo);
		System.out.println(resultVO);
		//ajax 경우 forward / sendredirect / href 등.. 페이지 이동 관련된 구현 x
		//들어갈 곳이 정해져 있음. callback함수로
		//갈때 들고 갈 데이터를 만들어주려면 화면에 display 하면 그 값이 전달 됨.
		JSONObject jobj = new JSONObject(); 
		if(resultVO == null) {
			jobj.put("result", "fail");
		}else {
			jobj.put("result", "ok");
			jobj.put("name", resultVO.getName());
			request.getSession().setAttribute("member", resultVO);
		}
		response.getWriter().println(jobj);
		response.getWriter().flush();
		response.getWriter().close();
		
		//ajax 사용 x
//		if(resultVO == null) {
//			System.out.println("id없음");
//			response.getWriter().println("<script>alert('존재하지 않는 아이디입니다.');</script>");
//			response.getWriter().println("<script>history.back();</script>");
//			// 해당 id가 없음
//		} else if(passwd.equals(resultVO.getPasswd())) {
//			System.out.println("로그인성공");
//			// id와 passwd 가 일치함.
//			
//			// id님~ 반갑습니다.
//			request.setAttribute("msg", id+"님~ 반갑습니다");
//			
//			// 로그인 성공하면 session에 로그인된 member의 정보를 실어둠.
//			// 추후 로그아웃 되면 session "member"을 remove 함
//			request.getSession().setAttribute("member", resultVO);  
//			// index.jsp 이동
//			response.sendRedirect("index.jsp");
//		} else {
//			System.out.println("비번틀림");
//			// passwd 틀림
//			
//			// id님~ 비밀번호가 맞지 않습니다. 다시 로그인해주세요.
////			request.setAttribute("aaa", "aaaaaaaa");
////			request.getSession().setAttribute("a1", "a1a11");
//			request.setAttribute("msg", id+"님~ 비밀번호가 맞지 않습니다");
//			// index.jsp 이동
//			response.sendRedirect("index.jsp");
//		}
//		
//		
//		
//		// jsp 내장객체  
//		// request, response, out, session
//		
//		// request, response
//		// servlet에서는 request, response 이 jsp 의 모든 내장객체를 포함하고 있음
//		
////		PrintWriter out = response.getWriter();
//		request.getSession();
	}

}













