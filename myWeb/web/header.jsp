<%@page import="first.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr>
<%=request.getAttribute("msg") %>
<nav>
	<ul>
		<li><a href="ajax/ajaxTest01.jsp">메뉴1</a></li>
		<li><a href="#">메뉴2</a></li>
		<li><a href="#">메뉴3</a></li>
		<li><a href="#">메뉴4</a></li>
	</ul>
</nav>

<%
Member member = (Member)session.getAttribute("member");
if (member == null){ 
%>
<div class="box">
	<form id="frm">
		<p>아이디: <input type="text" name="id" id="id"></p>
		<p>비밀번호: <input type="password" name="passwd" id="passwd"></p>
		<button type="button" id="btnLogin">로그인하기</button>
		<button type="button" id="btnEnroll" onclick="location.href='view/member/memberInsert.jsp';">회원가입</button>
	</form>
</div>
<%
}  else {
%>
<div class="box">
	<script type="text/javascript">console.log(member);</script>
	<p> <%= member.getId() %>님! <span>등급 : <%= member.getGrade() %></span> </p>
	<button type="button" onclick="#">회원정보보기</button>
	<button type="button" id="btnLogout" onclick="location.href='<%=request.getContextPath()%>/logout';">로그아웃</button>
</div>	
<%	
}
%>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btnLogin").click(function() {
		var frm = document.getElementById("frm");
		if($("#id").val().length==0){
			alert("입력된 아이디가 없습니다.")
			return;
		}
		// 유효성 체크 이후 submit
	$.ajax({
		url :"login"
		,type : "post"
		,data :{
			id : $("#id").val()
			,passwd : $("#passwd").val()
		}
		,dataType : "json"
		,success : function (d1){
			console.log(d1);
			console.log(d1.name);
			console.log(d1.result);
			if(d1.result =="ok"){
				var v1= "'<%=request.getContextPath()%>/logout'";
				var text = '<h3>환영합니다,'+d1.name+'님!</h3>'
				+ '<p>${member.id} 님! <span>등급 : ${member.grade} </span> </p>'
				+ '<button type="button" onclick="#">회원정보보기</button>'
		
				+ '<button type="button" id="btnLogout" onclick="location.href='+v1+';">로그아웃</button>';
				$(".box").html(text);
			}
		}
		,error : function (error){
			alert(error);
		}
		
	});
		
		
		//frm.action = "login";
		// frm.method = "post";
		// frm.submit(); 
	});

	
</script>











