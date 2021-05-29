<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style type="text/css">
#userdraw{
  clear: both;
   width: 420;
   padding-top: 20;
}

#userdraw input[type=text]{
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
#userdraw input[type=password]{
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

#userdraw input[type=submit],input[type=button]{
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
</style>
</head>
<%User user = (User) session.getAttribute("user"); %>
<body style="font-family:'서울남산 장체 L', sans-serif;">
	<div id="userdraw" style="margin: 0 auto;">
	<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold;">회원 탈퇴 </h3><br>
	<form action="<%=request.getContextPath()%>/userdrawl" method="post" name="userdrawl">
		<h4 style="text-align : center; color: gray; font-weight: bold">회원 탈퇴시 2주간 재가입이 불가능합니다!</h3><br>
			<input type="hidden" id="id" name="id" value="<%=user.getUser_id()%>">
			<input type="hidden" id="email" name="email" value="<%=user.getEmail()%>">
			<label>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="paswwd" name="paswwd" onblur="passcheck();"></label><br><br>
			<label>비밀번호 확인&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="paswwdcheck" name="paswwdcheck" onblur="passcheck();"></label><br><br>
			<input type="text" style="border-width: 0px; font-weight: bold;  background: white" id="chk" name="chk" value="비밀번호를 입력하세요" readonly="readonly"><br><br>
		<div id="email">
		<input type="button" id="btnemail" name="btnemail" value="이메일 코드 발송"><br><br>
		</div>
		<label>인증번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="emailnum" name="emailnum"></label>
		<input type="button" id="btnemailcheck"name="btnemailcheck" value="인증번호 확인"><br><br>
		<div id="ok">
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
   outline: none;" type="button" id="btndrawl" name="btndrawl" value="회원탈퇴" onclick="inputCheck();">
		</div>
	</form>
	</div>
<script>

var right = 0; // inputcheck 비밀번호 입력체크를 위한 변수
var emailCheck = 0; // 이메일 인증 확인 체크용

//이메일 인증번호 발송하기
$(function() {
	$("#btnemail").click(function() {
		var email = $("#email").val();
		var pass = $("#paswwd").val();
		var pass2 = $("#paswwdcheck").val();
		var id = $("#id").val();
		
		var idfind = 0;
		var pwfind = 0;
		
		var url = "<%=request.getContextPath()%>/emailctrl";
		
		if (pass.length == 0 || pass2.length == 0) {
			alert("비밀번호를 입력해주세요")
			return;
		}
		console.log(right);
		if(right == 0 ){
			alert("비밀번호가 틀립니다.")
			return;
		}
		
		$.ajax({
			type : "post",
			url : url,
			data :  { email : email, pwfind : pwfind, idfind : idfind, id : id, pass : pass},
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

	//비번,비번확인
	function passcheck() {
		var pass = document.getElementById("paswwd").value;
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

	function inputCheck() {

		//이메일 체크 확인
		if (emailCheck == 0) {
			alert("이메일 인증을 완료해주세요!");
			return false;
		}
		
		var userInput = prompt("탈퇴를 원하시면 '탈퇴합니다' 를 적어주세요 ");
		if(userInput == "탈퇴합니다"){
			userdrawl.submit();
		}else{
			alert("잘못입력하셨습니다.");
		}

	}
</script>
</body>
</html>