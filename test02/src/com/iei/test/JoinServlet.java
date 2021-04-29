package com.iei.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.iei.dao.MemberDao;

import com.iei.vo.Member;

/**
 * 
 * Servlet implementation class JoinServlet
 * 
 */

@WebServlet(name = "Join", urlPatterns = { "/join" })

public class JoinServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;



	public JoinServlet() {

		super();


	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String memberId = request.getParameter("memberId");

		String memberPw = request.getParameter("memberPw");

		String memberName = request.getParameter("memberName");

		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setMemberName(memberName);

		int result = new MemberDao().insertMember(member);

		String msg = "";

		if (result == 0) {

			msg = "회원가입 실패입니다.";

		} else {

			msg = "회원가입 성공입니다.";

		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/joinResult.jsp");

		request.setAttribute("msg", msg);

		dispatcher.forward(request, response);

	}

	/**
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

// TODO Auto-generated method stub

		doGet(request, response);

	}

}
