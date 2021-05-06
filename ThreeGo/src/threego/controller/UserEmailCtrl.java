package threego.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import threego.service.ParkingService;
import threego.vo.User;

/**
 * Servlet implementation class EmailCtrl
 */
@WebServlet("/emailctrl")
public class UserEmailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserEmailCtrl() {
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
		String email = email1 +"@"+ email2;
		System.out.println(email);
		
		PrintWriter out = response.getWriter();

		ArrayList<User> searchemail = new ParkingService().selectSearch("email", email);

		if (searchemail.isEmpty() == true) {
			if (email.isEmpty() == true) {
				out.println("(이메일을 입력해주세요!)");
			} else {

				String host = "smtp.naver.com";
				String user = "kanghw95@naver.com";
				String password = "FHCG9LTS9FDY";
				
				String to_email = email;

				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");

				
				StringBuffer temp = new StringBuffer();
				Random rnd = new Random();
				for (int i = 0; i < 10; i++) {

					int rIdx = rnd.nextInt(3);
					switch (rIdx) {
					case 0:
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;

					case 1:
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;

					case 2:
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				String AuthenticationKey = temp.toString();
				System.out.println(AuthenticationKey);

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, password);
					}
				});

				try {
					MimeMessage msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress(user, "KH ThreeGO"));
					msg.addRecipients(javax.mail.Message.RecipientType.TO, to_email);

					msg.setSubject("안녕하세요 얻다대Go 인증 메일입니다");

					msg.setText("인증번호는 " + temp + "입니다.");

					Transport.send(msg);
					System.out.println("이메일 전송 성공");

				} catch (Exception e) {
					e.printStackTrace();
				}

				HttpSession saveKey = request.getSession();
				saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
				out.println("입력하신 이메일로 인증번호가 발송되었습니다.");
			}
		} else {
			out.println("이메일이 중복입니다.");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}