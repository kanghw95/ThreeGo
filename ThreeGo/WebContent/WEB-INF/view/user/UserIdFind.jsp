<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
#useridfind{
  clear: both;
   width: 420;
   padding-top: 20;
}

#useridfind input[type=text]{
  margin: 0;
  padding: 1 4 1 4;
  border: none;
  border-radius: 12px;
  background :#EFEFEF;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}
#useridfind input[type=password]{
  margin: 0;
  padding: 1 4 1 4;
  border: none;
  border-radius: 12px;
  background :#EFEFEF;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}

#useridfind select{
  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
  background :white;
  color: black;
  position:relative;
  height:30px;
  font-size:13px;
  outline:none;
}
#useridfind input[type=submit],input[type=button]{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}
#chk{
width: 150;
}
#ok{
text-align: center;
}
#email{
text-align: center;
}
#nickok{
text-align: center;
}
</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<div id="useridfind" style="margin: 0 auto;">

	<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold;">아이디 찾기</h3><br>
	<form action="<%=request.getContextPath()%>/useridfind" method="post" name="idfind">
		이메일&nbsp;&nbsp;&nbsp; <input type="text" size="15" id="email1" name="email1">&nbsp;@&nbsp;<input type="text" size="15" id="email2" name="email2"><br><br>
		이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="name" name="name"> <br><br>
			<input type="text"  style="width: 240px; border-width: 0px; font-weight: bold;  background: white" id="chk" name="chk" value="회원가입시 입력한  정보를 입력하세요" readonly="readonly"><br><br>
		<input style="margin: 0; padding: 0;" type="button" id="btnemail" name="btnemail" value="인증코드 발송" ><br><br>
		<label>인증번호&nbsp;  <input type="text" id="emailnum" name="emailnum"></label>
		<input type="button" id="btnemailcheck"name="btnemailcheck" value="인증번호 확인"><br><br>
	
		<div style="text-align: center;">
			<input style="  margin: 0;
   padding: 1 4 1 4;
   border: none;
   border-radius: 12px;
   background: #E0DEC3;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;" type="button" id="btnidfind" name="btnidfind" value="아이디 찾기" onclick="inputCheck();">
			<input style="margin: 0;
   padding: 1 4 1 4;
   border: 3px solid #E0DEC3;
   border-radius: 12px;
   background: white;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;"  type="button" value="메인페이지"  onclick="location.href ='<%=request.getContextPath() %>/main'"><br><br>
		</div>
	</form>
	</div>
<script>
	var emailCheck = 0; // 이메일 인증 확인 체크용
	//이메일 인증번호 발송하기
	$(function() {
		$("#btnemail").click(function() {
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();	
			var name = $("#name").val();	
			var idfind = 1;
			var pwfind = 0;
			var url = "<%=request.getContextPath()%>/emailctrl";
			

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
			
			if ($("#name").val().length == 0) {
				alert("이름을 입력해주세요")
				return;
			}
			$.ajax({
				type : "post",
				url : url,
				data :  { email1 : email1, email2 : email2, name : name, pwfind : pwfind, idfind : idfind},
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
			
			idfind.submit();
		}
	</script>
</body>
</html>