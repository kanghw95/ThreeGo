<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>

.stopmodal{
	text-align : center;
	 display: none;
	 width: 100%;
	 height: 100%;
	 z-index: 1;
	 position: fixed;
	 left: 0;
	 top: 0;
	 background: rgba(0, 0, 0, 0.3);
}

 .modalcontent{
 width: 300px;
 height: 500px;
 margin: auto;
 background: gray;
 position: relative;
 top: 30px;
 animation-name: modaltop1;
 animation-duration: 0.7s;
 }
        /* animation */
 @keyframes modaltop1{
	 from{
	 top:-500px;
	 }
	 to{
	 top:30px;
	 }
 }
 #close{
     cursor: pointer;
 }

</style>
<script > 
		
	//정지시키기
	function stopmodal(nickname,no){
		var no=no;
		var nickname=nickname;
		 $("#who").html(nickname+" 님을 정지 시키겠습니까?");
		
        var stopmodal = document.getElementById("stopmodal");
        var close = document.getElementById("close");
		
		if(stopmodal.style.display ="none"){
			stopmodal.style.display ="block"
		}

        close.onclick = function(){
        	stopmodal.style.display = "none";
        }

        $("#realstop").click(function(){
    		var frm = document.getElementById("frm");
    		frm.action="<%=request.getContextPath()%>/adminstop?no1="+no+"&nickname="+nickname;
    		frm.method="post";
    		frm.submit();
        })
        
	}
		
	
</script>
</head>
<body>
<input type="hidden" name ="list" value="${list }">
		
	<div id="stopmodal" class="stopmodal">
		<div id="madalcontent" class="madalcontent">
			<p id="close">&#10006;</p>
			<h3 id="who"></h3>
			<h3>몇 개월 정지 시킬지 선택</h3>
			<input type="hidden" name="list" value="${list }">
			<form id="frm">
			<select id="select" name="select">
				<option value="week">1주일</option>
				<option value="weeks">2주일</option>
				<option value="month">1달</option>
				<option value="year">1년</option>
			</select>
			<input type="button" id="realstop" value="정지시키기">
			</form>
		</div>
	</div>
		
	<h1>회원관리</h1>
		<c:if test="${ empty list }">
		<p>조회된 회원이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	<form action="<%=request.getContextPath() %>/adminctrl" method="get">
	
		<input type="search" name="search" value="${search}">
		<button type="submit">검색</button>
	</form>
		<table border ="1">
			<tr>
			<td>no</td>
			<td>닉네임</td>
			<td>일시정지</td>
			</tr>
		 	<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.user_no }</td>
				<td><a href="#">${i.nickname }</a></td>
				<td><input type="button" name="${i.user_no }" value="일시정지" id="${i.user_no }" onclick="stopmodal('${i.nickname }',${i.user_no });"></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${s }&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	
	<br>
	
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/main/adminmain';">
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="location.href='<%=request.getContextPath()%>/adminctrl';">
	</c:if>
	

</body>
</html>
