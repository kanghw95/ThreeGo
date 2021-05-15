<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css" type="text/css">
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
	 top: 200px;
	 width: 300px;
	 height: 300px;
	 z-index: 1;
	 float : left;
	 position: fixed;
	 background: rgba(0.5, 1, 1, 0.5);
	 color: aquamarine;
	 left: 80px;
	 
}

 .modalcontent{
 width: 100%;
 margin: auto;
 background: gray;
 position: relative;
 top: 78.22px;
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
 text-align: center;
     cursor: pointer;
     color: balck;
 }
.inf{
display : none;
border-color : red;
border-collapse : collapse;
}
.userno{
	width: 85px;
	
}
.nik{
width: 140px;
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
    		alert('정지가 되었습니다');
    		frm.action="<%=request.getContextPath()%>/adminstop?no1="+no+"&nickname="+nickname;
    		frm.method="post";
    		frm.submit();
        })

        
	}
	function inf(no){
		var close = document.getElementById("infclose"+no);
		close.style.cursor="pointer";
		var infclass = document.getElementsByClassName("a"+no);
		close.onclick = function(){
		for(var i=0; i<infclass.length; i++){
				infclass[i].style.display = "none";
			}
        }
		for(var i=0; i<infclass.length; i++){
			if(infclass[i].style.display ="none"){
				infclass[i].style.display ="table-row"
			}
		}
	}
		
	
</script>
</head>
<body>
<input type="hidden" name ="list" value="${list }">
		
	<div id="stopmodal" class="stopmodal">
		<div id="modalcontent" class="modalcontent">
			<p id="close">&#10006;</p>
			<br><br>
			<h3 id="who"></h3>
			<h3>몇 개월 정지 시킬지 선택</h3>
			<input type="hidden" name="list" value="${list }">
			<form id="frm" action="<%=request.getContextPath()%>/adminstop" method="get">
			<select id="select" name="select">
				<option value="week">1주일</option>
				<option value="weeks">2주일</option>
				<option value="month">1달</option>
				<option value="year">1년</option>
			</select>
			<input type="submit" id="realstop" value="정지시키기">
			</form>
		</div>
	</div>
		
	<h1>회원관리</h1>
	<input type="button" id="btnlist" value="모든회원정보 " onclick="location.href='<%=request.getContextPath() %>/selectalluser'"> 
	<input type="button" id="reportbtn" value="신고접수 " onclick="location.href='<%=request.getContextPath() %>/admin/reportmenu'"> 
	<c:if test="${ empty list }">
		<p>조회된 회원이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	<form action="<%=request.getContextPath() %>/adminctrl" method="get">
	
		<input type="search" name="searchuser" value="${search}">
		<button type="submit">검색</button>
	</form>
		<table >
			<tr>
				<th class="userno">&nbsp;회원  번호&nbsp;</th>
				<th class="nik">닉네임</th>
				<th class="ansbtn">일시정지</th>
			</tr>
		 	<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.user_no }</td>
				<td><a href="#" onclick="inf('${i.user_no }');">${i.nickname }</a></td>
				<td><input type="button" name="${i.user_no }" value="일시정지" onclick="stopmodal('${i.nickname }',${i.user_no });"></td>
			</tr>
			
			<tr class="inf a${i.user_no }" id="infclose${i.user_no }" >
				<td colspan="3" style="text-align: center;">닫기</td>
			</tr>
			<tr class="inf a${i.user_no }"  >
				<th>id</th>
				<td colspan="2">${i.user_id }</td>
			</tr>
			<tr class="inf a${i.user_no }" >
				<th>pwd</th>
				<td colspan="2">${i.user_pwd }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>이름</th>
				<td colspan="2">${i.user_name }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>주소</th>
				<td colspan="2">${i.address }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>로그인시간</th>
				<td colspan="2">${i.last_login }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>전화번호</th>
				<td colspan="2">${i.phone }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>이메일</th>
				<td colspan="2">${i.email }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>성별</th>
				<td colspan="2">${i.gender }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>생년월일</th>
				<td colspan="2">${i.birth }</td>
			</tr>
			<tr  class="inf a${i.user_no }">
				<th>회원자격</th>
				<td colspan="2">${i.user_authority }</td>
			</tr>
			<tr class="inf a${i.user_no }" id="infchat${i.user_no }" >
				<td colspan="3" style="text-align: center;cursor: pointer;" onclick="location.href ='<%=request.getContextPath() %>/main/user/chat'">${i.nickname }님이랑 채팅하러가기</td>
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
	
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="location.href='<%=request.getContextPath()%>/adminctrl';">
	</c:if>
	

</body>
</html>
