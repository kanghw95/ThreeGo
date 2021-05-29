<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>'
<style type="text/css">
#usermod{
  clear: both;
   width: 420;
   padding-top: 20;
}

#usermod input[type=text]{
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
#usermod input[type=password]{
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

#usermod select{
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

#usermod input[type=submit],input[type=button]{
   padding: 1 4 1 4;
   margin : 0 5 0 5;
   background-color: white;
   border :  none;
   height: 30;
}

#ok input[type=submit],input[type=button]{

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
<%User user = (User) session.getAttribute("user"); %>
	<div id="usermod" style="margin: 0 auto;">
		<h3 style="text-align: left; color: #66612D; font-size: 20px; font-weight: bold;">회원정보 수정</h3><br>

		<form action="<%=request.getContextPath()%>/usermodify" method="post" name="modform">
			<input type="hidden" id=id name="id" value="<%=user.getUser_id()%>">
			<input type="hidden" id="pw" name="pw" value="<%=user.getUser_pwd()%>">
			<input type="hidden" id="useremail" name="useremail" value="<%=user.getEmail()%>">
			
			<label>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="paswwd" name="paswwd" onblur="passcheck();"></label><br><br>
			<label>비밀번호 확인&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="paswwdcheck" name="paswwdcheck" onblur="passcheck();"></label><br><br>
			<input type="text" style="border-width: 0px; font-weight: bold;  background: white" id="chk" name="chk" value="비밀번호를 입력하세요" readonly="readonly"><br><br>
			
			<label>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="name" name="name" value="<%=user.getUser_name()%>" readonly="readonly"></label><br><br>
			
			<label>닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="nickname" name="nickname" value="<%=user.getNickname()%>"></label><br><br>
			<div id="nickok">
			<input type="button" id="btnnick" name="btnnick" value="닉네임 중복확인"><br><br>
			</div>
			<label>주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="address" name="address" value="<%=user.getAddress()%>"></label><br><br>
			 휴대폰 <select name="ph1">
			       <option value="010">010</option>
			       <option value="011">011</option>
			       <option value="016">016</option>
			       <option value="017">017</option>
			       <option value="019">019</option>
	    		 </select>
     	- <input type="text" id="ph2" name="ph2" size="5" maxlength="4"> - <input type="text"  id="ph3" name="ph3" size="5" maxlength="4"><br><br>
			이메일 <input type="text" size="15" id="email1" name="email1">&nbsp;@&nbsp;<input type="text" size="15" id="email2" name="email2"><br><br>
			<div id="email">
			<input type="button" id="btnemail" name="btnemail" value="이메일 인증하기">
			</div>
			<br>
			<label>인증번호  <input type="text" id="emailnum" name="emailnum"></label>
			<input type="button" id="btnemailcheck" name="btnemailcheck" value="인증번호 확인"><br><br>
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
   outline: none;" type="button" value="수정완료" onclick="inputCheck();">
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
   outline: none;" type="button" value="취소" onclick="history.back()">
			</div>
		</form>

	</div>
<script>
var right = 0; // inputcheck 비밀번호 입력체크를 위한 변수
var nickCheck = 1; // 닉네임 중복확인 체크용 수정페이지에서는 기존 닉네임이기에... 1로 설정
var emailCheck = 0; // 이메일 인증 확인 체크용

//닉네임 중복 체크
$(function() {
	$("#btnnick").click(function() {
		var nickname = $("#nickname").val();
		var id = $("#id").val();
		var url = "<%=request.getContextPath()%>/nickcheck";
				$.ajax({
					type : "post",
					url : url,
					data : {
						nickname : nickname, id : id
					},
					success : function(check) {
						alert(check);
					
						var str1 = check;
						if(str1 == "사용가능한 닉네임입니다."){
							nickCheck = 1;
						}else{
							nickCheck = 0;
						}
					}
				});
			});
		});
//이메일 인증번호 발송하기
$(function() {
	$("#btnemail").click(function() {
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		var idfind = 0;
		var pwfind = 0;
		var modcheck = "1";
		var useremail = $("#useremail").val();
		
		var url = "<%=request.getContextPath()%>/emailctrl";
		var regx = /^[a-zA-Z0-9.]*$/;
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
			data :  { email1 : email1, email2 : email2, idfind : idfind, pwfind : pwfind, modcheck : modcheck, useremail : useremail },
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
		
		//input 태그들 제약조건
		function inputCheck() {
			var id = document.getElementById("id").value;
			var regx = /^[a-zA-Z0-9]*$/;
			var chk1 = /\d/;
			var chk2 = /[a-z]/i;
			//비밀번호
			var pass = document.getElementById("paswwd").value;
			var pw = document.getElementById("pw").value;
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
			
			if(pass == pw){
				alert("기존과 동일한 비밀번호는 사용하실 수 없습니다.");
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
			
			//아이디,닉네임,이메일 체크 확인
			 if (nickCheck == 0) {
				alert("닉네임 중복체크를 해주세요");
				return false;
			} else if(emailCheck == 0){
				alert("이메일 인증을 완료해주세요!");
				return false;
			}
			
			modform.submit();
		}
	</script>
</body>
</html>