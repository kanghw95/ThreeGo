<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="threego.model.vo.User"%>
<%
	User user = (User) session.getAttribute("user");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>문의사항</h2>
   <form action="<%=request.getContextPath()%>/userqnainsert"
      method="post" >

		<input type="hidden" value="<%=user.getUser_no() %>" name="user_no">
      <table border="1">
         <tr>
            <td>문의항목</td>
            <td>
				<select id="select" name="select">
					<option value="계정">계정</option>
					<option value="채팅">채팅</option>
					<option value="게시판">게시판</option>
					<option value="쉐어링">쉐어링</option>
					<option value="기타">기타</option>
				</select>
			</td>
         </tr>
         <tr>
            <td>제목</td>
            <td><input type="text" name="qna_subject"></td>
         </tr>
         <tr>
            <td>닉네임</td>
            <td><input type="text" name="niakname" value="<%=user.getNickname() %> " readonly ></td>
         </tr>
         <tr>
            <td>내용</td>
            <td><textarea class="form-control" placeholder="글 내용"
                  name="qna_content" maxlength="2048" style="height: 350px;"></textarea></td>
         </tr>
		 <tr>
            <td>비밀번호</td>
            <td><input type="text" name="pwd"  placeholder="답변확인시 비밀번호" ></td>
         </tr>
         
         <tr>
            <td colspan="2"><input type="submit" value="문의하기"></td>
         </tr>
      </table>
            <input type="button" value="메인페이지"
               onclick="window.location='<%=request.getContextPath()%>/main';">

   </form>
</body>
</html>