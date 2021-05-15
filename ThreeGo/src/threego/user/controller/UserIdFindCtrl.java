package threego.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import threego.model.service.UserService;
import threego.model.vo.User;

/**
 * Servlet implementation class UserIdFindCtrl
 */
@WebServlet("/useridfind")
public class UserIdFindCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserIdFindCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		
		User vo = new User();
		vo.setEmail(email);
		vo.setUser_name(name);

		User resultVo = new User();
		resultVo = new UserService().idFind(email, name);
		String id =  resultVo.getUser_id();
		if (id != null) {
		

			String host = "smtp.naver.com";
			String user = "kanghw95@naver.com";
			String password = "V8YY9KXUZU79";
//				String host = "smtp.gmail.com"; // 지메일용
//				String user = "kanghw95@gmail.com"; // 지메일용
//				String password = "aldcmuqazcdnembk"; // 지메일용

			String to_email = email;

			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			System.setProperty("jsse.enableSNIExtension", "false");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "KH ThreeGO"));
				msg.addRecipients(javax.mail.Message.RecipientType.TO, to_email);

				msg.setSubject("안녕하세요 얻다대Go 입니다.");

				msg.setText("아이디는 " + id + "입니다. 노출되지 않도록 주의하세요");

				Transport.send(msg);
				System.out.println("이메일 전송 성공");

			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(id);
			out.println("<script>alert('입력하신 이메일로 아이디가 발송되었습니다.'); location.href='"+ request.getContextPath()+"/main"+"';</script>");
			out.flush();
			out.close();

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
