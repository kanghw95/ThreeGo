<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<h2>회원가입 페이지입니다.</h2>
		<form action="<%=request.getContextPath()%>/pinsert" method="post">
			<label>아이디: <input type="text" id="id" name="id"></label>
			<input type="button" id="btnid" name="btnid" value="아이디 중복확인"><br>
			<label>비밀번호<input type="password" id="paswwd" name="paswwd"></label><br>
			<label>이름: <input type="text" id="name" name="name"></label><br>
			<label>닉네임: <input type="text" id="nickname" name="nickname"></label>
			<input type="button" id="btnnick" name="btnnick" value="닉네임 중복확인">
			<br>
			<label>주소: <input type="text" id="address" name="address"></label><br>
			<label>전화번호: <input type="text" id="phone" name="phone"></label><br>
			<label>이메일: <input type="email" id="email" name="email" placeholder="이메일을 인증해주세요!"></label>
			<input type="button" id="btnemail" name="btnemail" value="이메일 인증하기">
			<br>
			<label>인증번호: <input type="text" id="emailnum" name="emailnum"></label>
			<input type="button" id="btnemailcheck" name="btnemailcheck" value="인증번호 확인">
			<br>
			<label>남:<input type="radio" name="gender" value='M'></label>
			<label>여:<input type="radio" name="gender" value='F'></label><br>
			<label>생일: <input type="text" id="birth" name="birth"></label><br>
			<hr>
	
			<input type="submit" value="회원가입">
			<input type="button" value="취소" onclick="history.back()">
		</form>
	<script>
//이메일 인증번호 발송하기
$(function() {
	$("#btnemail").click(function() {
		var email = $("#email").val();
		console.log(email);
		var url = "<%=request.getContextPath()%>/emailctrl";
		$.ajax({
			type : "post",
			url : url,
			data :  { email : email},
			success : function(check) {
					alert(check);
				}
			});
		});
	});

//이메일 인증번호 확인
$(function() {
	$("#btnemailcheck").click(function() {
		var emailnum = $("#emailnum").val();
		console.log(emailnum);
		var url = "<%=request.getContextPath()%>/emailcheckctrl";
		$.ajax({
			type : "post",
			url : url,
			data :  { AuthenticationUser : emailnum},
			success : function(check) {
					alert(check);
				}
			});
		});
	});
//아이디 중복 체크
$(function() {
	$("#btnid").click(function() {
		var id = $("#id").val();
		console.log(id);
		var url = "<%=request.getContextPath()%>/idcheck";
				$.ajax({
					type : "post",
					url : url,
					data : {
						id : id
					},
					success : function(check) {
						alert(check);
					}
				});
			});
		});
		
//아이디 중복 체크
$(function() {
	$("#btnnick").click(function() {
		var nickname = $("#nickname").val();
		console.log(nickname);
		var url = "<%=request.getContextPath()%>/nickcheck";
				$.ajax({
					type : "post",
					url : url,
					data : {
						nickname : nickname
					},
					success : function(check) {
						alert(check);
					}
				});
			});
		});
	</script>
</body>
</html>