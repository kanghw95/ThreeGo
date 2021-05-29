<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#textinput{
border-top: 1px solid #66612D;
height : 25px;
border-radius: 12px;
}
.td {
white-space: nowrap;
text-overflow: ellipsis;
overflow: hidden;
border : none;
height: 50px;
border-top : 2px solid #66612D;

}
.tr{
border : none;
height: 50px;

}


#backtolist {
margin: 0;
padding: 1 4 1 4;
border: 3px solid #E0DEC3;
border-radius: 12px;
background: white;
color: black;
position: relative;
height: 25px;
font-size: 12px;
cursor: pointer;
outline: none;
}
#write{
position: relative;
margin: 0;
padding-left: 10px;
padding-right :  10px;
border: none;
border-radius: 12px;
background: #E0DEC3;
color: white;
position: relative;
height: 25px;
font-size: 13px;
cursor: pointer;
outline: none;
}
.button {
position: relative;
margin: 0;
padding-left: 10px;
padding-right :  10px;
border: 3px solid #E0DEC3;
border-radius: 12px;
background: white;
color: black;
position: relative;
height: 30px;
font-size: 13px;
cursor: pointer;
outline: none;
}
#searchbutton{
border : none;
padding-left: 10px;
padding-right :  10px;
border-radius: 12px;
background:  #E0DEC3;
font-size: 13px;
cursor: pointer;
height: 25px;
}
.table {
border-collapse:collapse;

border: none;
font-size: 13px;
text-align: center;
width: 400px;
margin-left: auto;
margin-right: auto;
white-space: nowrap;
table-layout: fixed;

}

body {
text-align: center;
}

a {
text-decoration: none;
color: black;
}

a:visited {
text-decoration: none;
}

a:hover {
text-decoration: none;
}

a:focus {
text-decoration: none;
}

a:hover, a:active {
text-decoration: none;
}



#hide {
border-bottom: 0px;
}

#p {
margin-top: 10;
margin-left: 50px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}
#p2 {
clear:both;
margin-top: 10;
margin-left: 50px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}

.no {
width: 30px;
}

.subj {
width: 300px;
white-space: nowrap;
text-overflow: ellipsis;
overflow: hidden;
}
.subj2 {
width: 370px;
white-space: nowrap;
text-overflow: ellipsis;
overflow: hidden;
}
.btnc{
            background-color: white;
            border : 0;
            outline: 0;
            cursor: pointer;
            white-space:nowrap;  
         text-overflow:ellipsis; 
         overflow:hidden;
         width: 200px;
         text-align: left;
        }
.writer {
width: 70px;
}

.date {
width: 70px;
}

.like {
width: 30px;
}


</style>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<p id="p">공지사항/이용방법</p>
<p>
	<c:if test="${ empty list }">
		<table style="width: 500px; text-align: center">
			<tr><td>게시글이 없습니다.</td>
			</tr>
			</table>
	</c:if>
	<c:if test="${not empty list }">
		
		<table class="table">
			<tr class="tr" id="hide">
				<th class="no">No</th>
				<th class="subj2">제목</th>

			</tr>
		 	<c:forEach items="${list }" var="i" >
			<tr class="tr">
				<td td class="td">${i.faq_no-1000 }</td>
				<form method="post" action="<%=request.getContextPath()%>/adminnotifyanswer">
					<td td class="td">
						<input type="submit" style="width: 350px;" class="btnc" value="${i.faq_subject }">
						<input type="hidden" value="${i.faq_no }" name="no" >
						<input type="hidden" value="${i.faq_subject }" name="sub">
						<input type="hidden" value="${i.faq_content }" name="con">
						<input type="hidden" value="${i.admin_number }" name="a_num">
					</td>
				</form>
								
			</tr>
			</c:forEach>
		</table>
	</c:if>
	</p>
	<br>
	<form action="<%=request.getContextPath() %>/adminnotify" method="get">
			<input type="search" name="search" id="textinput" value="${search}">
			<button type="submit" class="button" id="searchbutton">검색</button>
		</form>
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
	<br>
	<br>
	<input type="button" class="button" id="backtolist" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/main';">
	<Br>
	<c:if test="${not empty search}">
		<input type="button" class="button"  id="backtolist" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/adminnotify';">
	</c:if>
</body>
</html>