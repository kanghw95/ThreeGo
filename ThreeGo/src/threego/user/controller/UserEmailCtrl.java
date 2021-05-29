package threego.user.controller;

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

import threego.model.service.UserService;
import threego.model.vo.User;

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
		
		int idcheck = 0;
		int pwcheck = 0;
		
		String email = null;
		String id = null;
		String pw = null;
		String name = request.getParameter("name");
		String idfind = request.getParameter("idfind");
		String pwfind = request.getParameter("pwfind");
		String drawemail = request.getParameter("email"); 
		String modemil = request.getParameter("modcheck"); 
		String useremail = request.getParameter("useremail"); 
		
		PrintWriter out = response.getWriter();
		
		if (drawemail == null) {
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			email = email1 + "@" + email2;
		} else {
			email = drawemail;
			id = request.getParameter("id");
			pw = request.getParameter("pass");
		}
		
		   
		   int drawlemailcheck = new UserService().drawlSearch(email);
		      if(drawlemailcheck == 1) {
		         out.println("탈퇴한 회원입니다.");
		         out.flush();
		         out.close();
		         return;
		      } 
		
		ArrayList<User> searchemail = new UserService().selectSearch("email", email);
		System.out.println(searchemail);
		System.out.println(email);

		if (!idfind.equals("0") || !pwfind.equals("0")) {
			idcheck = Integer.parseInt(idfind);
			pwcheck = Integer.parseInt(pwfind);
			
			id = request.getParameter("id");

			ArrayList<User> searchname = new UserService().selectSearch("user_name", name);
			ArrayList<User> searchid = new UserService().selectSearch("user_id", id);

			if (searchemail.isEmpty() == true) {
				out.println("이메일이 정확하지 않습니다.");
				out.flush();
				out.close();
				return;
			} else if (searchname.isEmpty() == true) {
				out.println("이름이 정확하지 않습니다.");
				out.flush();
				out.close();
				return;
			}
			if (idcheck == 1) {
				ArrayList<User> searchid_check = new UserService().selectUser("user_name", "email", name, email);

				if (searchid_check.isEmpty() == true) {
					out.println("이름,이메일이 맞는지 확인해주세요");
					out.flush();
					out.close();
					return;
				}
			}
			

			if (pwcheck == 1) {
				if (searchid.isEmpty() == true) {
					out.println("아이디가 정확하지 않습니다.");
					out.flush();
					out.close();
					return;
				}
				ArrayList<User> searchpw_check = new UserService().selectUser("user_id", "email","user_name", id, email, name);

				if (searchpw_check.isEmpty() == true) {
					out.println("아이디,이메일,이름이 맞는지 확인해주세요");
					out.flush();
					out.close();
					return;
				}
			}

			if (idcheck == 1 || pwcheck == 1) {
				searchemail.clear();
			}

		}
		
		if(drawemail != null) {

			
			ArrayList<User> userdrawl = new UserService().selectUser("user_id", "user_pwd","email", id, pw, email);
			
			if (userdrawl.isEmpty() == true) {
				out.println("비밀번호가 맞지 않습니다.");
				out.flush();
				out.close();
				return;
			}
			searchemail.clear();
		}
		
		if(modemil != null) {
	         if(!useremail.equals(email) ) {
	             out.println("회원가입시 입력한 이메일을 입력해주세요");
	             out.flush();
	             out.close();
	             return;
	          }
			
			searchemail.clear();
		}

		if (searchemail.isEmpty() == true) {

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