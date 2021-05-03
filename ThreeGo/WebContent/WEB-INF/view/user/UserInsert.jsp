<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	String ctxPathHeader = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입 페이지입니다.</h2>
		<form action="<%=request.getContextPath()%>/userinsert" method="post" name="loginform">
			<label>아이디 : <input type="text" id="id" name="id" ></label>
			<input type="button" id="btnid" name="btnid" value="아이디 중복확인"><br><br>
			<label>비밀번호 : <input type="password" id="paswwd" name="paswwd"></label><br><br>
			<label>비밀번호 확인 : <input type="password" id="paswwdcheck" name="paswwdcheck" onblur="passcheck();"></label>
			&nbsp;<input type="text" style="border-width: 0px; font-weight: bold" id="chk" name="chk" value="비밀번호를 입력하세요" readonly="readonly"><br><br>
			<label>이름 : <input type="text" id="name" name="name"></label><br><br>
			<label>닉네임 : <input type="text" id="nickname" name="nickname"></label>
			<input type="button" id="btnnick" name="btnnick" value="닉네임 중복확인"><br><br>
			<label>주소 : <input type="text" id="address" name="address"></label><br><br>
			 휴대폰 : <select name="ph1">
			       <option value="010">010</option>
			       <option value="011">011</option>
			       <option value="016">016</option>
			       <option value="017">017</option>
			       <option value="019">019</option>
	    		 </select>
     	- <input type="text" id="ph2" name="ph2" size="5" maxlength="4"> - <input type="text"  id="ph3" name="ph3" size="5" maxlength="4"><br><br>
			이메일 : <input type="text" size="15" id="email1" name="email1">@<input type="text" size="15" id="email2" name="email2">
			<input type="button" id="btnemail" name="btnemail" value="이메일 인증하기"><br><br>
			<label>인증번호 : <input type="text" id="emailnum" name="emailnum"></label>
			<input type="button" id="btnemailcheck" name="btnemailcheck" value="인증번호 확인"><br><br>
			<label>남 : <input type="radio" name="gender" value='M'></label>
			<label>여 : <input type="radio" name="gender" value='F'></label><br><br>
			생년월일 : <select name="birth1">
		       <%for(int i=2021; i>=1900; i--){ %>
		       <option value="<%=i %>"><%=i %></option>
		       <%} %>
		     </select>년&nbsp;
		     <select name="birth2">
		       <%for(int i=1; i<=12; i++){ %>
		       <option value="<%=i %>"><%=i %></option>
		       <%} %>
		     </select>월&nbsp;
		     <select name="birth3">
		       <%for(int i=1; i<=31; i++){ %>
		       <option value="<%=i %>"><%=i %></option>
		       <%} %>
		     </select>일<br><br>
			<hr>
	
			<input type="button" value="회원가입" onclick="inputCheck();">
			<input type="button" value="취소" onclick="history.back()">
		</form>
	<script>
	var right = 0; // inputcheck 비밀번호 입력체크를 위한 변수
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
		
//닉네임 중복 체크
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

		//비번,비번확인
		function passcheck() {
			var pass = document.getElementById("paswwd").value;
			console.log(pass);
			var pass2 = document.getElementById("paswwdcheck").value;
			if (pass2.length == 0 || pass2 == null) {
				document.getElementById("chk").value = "비밀번호를 입력하세요";
				document.getElementById("chk").style.color = "black";
				document.getElementById("chk").style.fontWeight = "bold";
				right = 0;
			} else if (pass != pass2) {
				document.getElementById("chk").value = "비밀번호가 다릅니다.";
				document.getElementById("chk").style.color = "red";
				document.getElementById("chk").style.fontWeight = "bold";
				right = 0;
			} else {
				document.getElementById("chk").value = "비밀번호가 동일합니다.";
				document.getElementById("chk").style.color = "blue";
				document.getElementById("chk").style.fontWeight = "bold";
				right = 1;
			}
			return;
		}
		
		//input 태그들 제약조건
		function inputCheck() {
			var id = document.getElementById("id").value;
			var regx = /^[a-zA-Z0-9]*$/;
			var chk1 = /\d/;
			var chk2 = /[a-z]/i;
			//아이디 비밀번호
			if (id.length == 0 || id == null) {
				alert("아이디를 입력하십시오");
				return false;
			}
			if (!regx.test(id)) {
				alert("아이디는 영어, 숫자만 입력가능합니다.");
				document.getElementById("id").focus();
				return false;
			}
			var pass =document.getElementById("paswwd").value;
			if (pass.length < 6 || pass == null) {
				alert("비밀번호를 입력하십시오(6글자이상)");
				return false;
			}
			if (chk1.test(pass) && chk2.test(pass)) {
			} else {
				alert("비밀번호는 영어, 숫자 조합입니다.");
				return false;
			}
			if(right == 0){
				alert("비밀번호가 동일한지 확안하세요");
				return false;
			}
		//이름
		var name = document.getElementById("name").value;
			if (name.length == 0 || name == null) {
				alert("이름을 입력하십시오");
				return false;
			}
			

		//주소
		var address = document.getElementById("address").value;
			if (address.length == 0 || address == null) {
				alert("주소를 입력해주세요!");
				document.getElementById("address").focus();
				return false;
			}
			
		//휴대폰
		var num_regx = /^[0-9]*$/;
			var ph2 = document.getElementById("ph2").value;
			if (ph2.length == 0 || ph2 == null) {
				alert("휴대폰 중간번호를 입력해주세요");
				document.getElementById("ph2").focus();
				return false;
			}
		var ph3 = document.getElementById("ph3").value;
			if (ph3.length == 0 || ph3 == null) {
				alert("휴대폰 뒷자리 번호를 입력해주세요");
				document.getElementById("ph3").focus();
				return false;
			}
			if (!num_regx.test(ph2) || !num_regx.test(ph3)) {
				alert("휴대폰번호는 숫자만 입력가능합니다");
				return false;
			}
			//이메일
			var email1 = document.getElementById("email1").value;
			var email2 = document.getElementById("email2").value;
			var regx2 = /^[a-zA-Z0-9.]*$/;
			if (email1.length == 0 || email1 == null) {
				alert("이메일을 입력하세요");
				return false;
			}
			if (!regx.test(email1)) {
				alert("이메일앞자리는 영어, 숫자만 입력가능합니다.");
				document.getElementById("email1").focus();
				return false;
			}
			if (email2.length == 0 || email2 == null) {
				alert("이메일 뒷자리를 입력하세요");
				return false;
			}
			if (!regx2.test(email2)) {
				alert("이메일 뒷자리는 영어, 숫자만 입력가능합니다.");
				document.getElementById("email2").focus();
				return false;
			}


			loginform.submit();
		}
	</script>
</body>
</html>