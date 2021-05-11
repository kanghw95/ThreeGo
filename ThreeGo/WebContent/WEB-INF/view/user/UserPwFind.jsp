<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<h2>비밀번호 찾기 페이지입니다.</h2>
	<form action="<%=request.getContextPath()%>/userpwfind" method="post" name="pwfind">
		이메일 : <input type="text" size="15" id="email1" name="email1">&nbsp;@&nbsp;<input type="text" size="15" id="email2" name="email2">
		&nbsp;<input type="text" size="30" style="border-width: 0px; font-weight: bold" id="chk" name="chk" value="회원가입시 입력한  정보를 입력하세요" readonly="readonly"><br><br>
		이름 : <input type="text" id="name" name="name"> <br><br>
		아이디 : <input type="text" id="id" name="id"> <br><br>
		<input type="button" id="btnemail" name="btnemail" value="이메일 코드 발송"><br><br>
		<label>인증번호 : <input type="text" id="emailnum" name="emailnum"></label>
		<input type="button" id="btnemailcheck"name="btnemailcheck" value="인증번호 확인"><br><br>
		<input type="button" id="btnpwfind" name="btnpwfind" value="비밀번호 찾기" onclick="inputCheck();">
		<input type="button" value="메인페이지"  onclick="location.href ='<%=request.getContextPath() %>/main'"><br><br>
	
	</form>
	<script>
	var emailCheck = 0; // 이메일 인증 확인 체크용
	//이메일 인증번호 발송하기
	$(function() {
		$("#btnemail").click(function() {
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();	
			var name = $("#name").val();	
			var id = $("#id").val();	
			var pwfind = 1;
			var idfind = 0;
			var url = "<%=request.getContextPath()%>/emailctrl";
			
			if ($("#name").val().length == 0) {
				alert("이름을 입력해주세요")
				return;
			}
			
			if ($("#id").val().length == 0) {
				alert("아이디를 입력해주세요")
				return;
			}
			//이메일 정규표현식 검사
			var regx = /^[a-zA-Z0-9]*$/;
			var regx2 = /^[a-zA-Z0-9.]*$/;
			if (email1.length == 0 || email1 == null) {
				alert("이메일을 입력해주세요");
				return;
			}
			if (!regx.test(email1)) {
				alert("이메일앞자리는 영어, 숫자만 입력가능합니다.");
				document.getElementById("email1").focus();
				return;
			}
			if (email2.length == 0 || email2 == null) {
				alert("이메일 뒷자리를 입력해주세요");
				return;
			}
			if (!regx2.test(email2)) {
				alert("이메일 뒷자리는 영어, 숫자만 입력가능합니다.");
				document.getElementById("email2").focus();
				return;
			}
			$.ajax({
				type : "post",
				url : url,
				data :  { email1 : email1, email2 : email2, name : name, id : id ,pwfind : pwfind, idfind : idfind},
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
			var url = "<%=request.getContextPath()%>/emailcheckctrl";
			$.ajax({
				type : "post",
				url : url,
				data :  { AuthenticationUser : emailnum},
				success : function(check) {
						alert(check);
						var str1 = check;
						if(str1 == "인증번호 확인되었습니다."){
							emailCheck = 1;
						}else{
							emailCheck = 0;
						}
					
					}
				});
			});
		});
	
	
	function inputCheck() {

		//이메일 체크 확인
		if(emailCheck == 0){
			alert("이메일 인증을 완료해주세요!");
			return false;
		}
		
		pwfind.submit();
	}
	</script>
</body>
</html>