<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="first.member.model.vo.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member" />
<jsp:setProperty property="id" name="member" />
<jsp:setProperty property="passwd" name="member" />


<%
	first.member.model.vo.Member vo = new first.member.model.vo.Member();
vo.setId(request.getParameter("id"));
vo.setPasswd(request.getParameter("passwd"));
vo.setName(request.getParameter("name"));
vo.setEmail(request.getParameter("email"));
vo.setGrade(request.getParameter("grade"));
if (request.getParameter("gender") != null) {
	if (request.getParameter("gender").equals("")) {
		vo.setGender(request.getParameter("gender").charAt(0));
	}
}
%>

