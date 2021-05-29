<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 글 조회</title>
<style>

#myboard{
  clear: both;
   width: 420;
   padding-top: 20;
   margin: 0 auto;
}
#textinput{
border-top: 1px solid #66612D;
height : 25px;
border-radius: 12px;
}
#myboard td {
   white-space: nowrap;
   text-overflow: ellipsis;
   overflow: hidden;
   border : none;
   height: 50px;
   border-top : 2px solid #66612D;

}
#myboard tr{
   border : none;
   height: 50px;
   
}
#myboard th{

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
#myboard table {
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
   style="font-family:'서울남산 장체 L', sans-serif;"
}

#myboard a {
   text-decoration: none;
   color: black;
}

#myboard a:visited {
   text-decoration: none;
}

#myboard a:hover {
   text-decoration: none;
}

#myboard a:focus {
   text-decoration: none;
}

#myboard a:hover, a:active {
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

.no {
   width: 30px;
}

.subj {
   width: 200px;
   white-space: nowrap;
   text-overflow: ellipsis;
   overflow: hidden;
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

#myboard h3 {
margin-top: 10;
margin-left: 10px;
clear : both;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}
</style>
</head>
<body>
<div id="myboard">
<p>
<c:if test="${bd_category eq 'bd_category_1'}">
<h3>주차장 평가게시판</h3>
</c:if>
<c:if test="${bd_category eq 'bd_category_2'}">
<h3>주차장 쉐어링게시판</h3>
</c:if>
<c:if test="${bd_category eq 'bd_category_3'}">
<h3>드라이브코스 추천게시판</h3>
</c:if>
<c:if test="${bd_category eq 'bd_category_4'}">
<h3>자유게시판</h3>
</c:if>
<c:if test="${bd_category eq 'bd_category_5'}">
<h3>자랑게시판</h3>
</c:if>
</p>
<%User user = (User) session.getAttribute("user"); %>
<p id="searchresult">
   <c:if test="${empty boardList}">
      게시글이 없습니다.
   </c:if>
    <c:if test="${not empty search}">
     <strong>${search}</strong>에 대한 검색 결과입니다.
   </c:if>
   <c:if test="${not empty boardList}">
      <table >
         <tr id="hide">
              <th class="no">No</th>
            <th class="subject">제목</th>
            <th class="writer">작성자</th>
              <th class="date">작성일</th>
            <th class="like" >공감</th>
         </tr>
      <c:forEach items="${boardList }" var="v">
         <tr>
            <c:if test="${bd_category eq 'bd_category_1'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }&user_no=<%=user.getUser_no()%>">${v.bd_content_no}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_2'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }&user_no=<%=user.getUser_no()%>">${v.bd_content_no-1000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_3'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }&user_no=<%=user.getUser_no()%>">${v.bd_content_no-2000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_4'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }&user_no=<%=user.getUser_no()%>">${v.bd_content_no-3000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_5'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }&user_no=<%=user.getUser_no()%>">${v.bd_content_no-4000}</a></td>
            </c:if>
            <td><a
              href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_subject }</a></td>
            <td>${v.bd_writer }</td>
            <td>${v.bd_date }</td>
            <td>${v.bd_likecnt}</td>
         </tr>      
      </c:forEach>
      </table>
   </c:if>
   </p>
    <br>
     <form action="<%=request.getContextPath() %>/usermyboard" method="get">
      <input type="search" name="search" value="${search}">
      <input type="hidden" name="bd_category_1" value="${bd_category}">
      <button class="button" type="submit">검색</button>
   </form>
  
   <br>
   <c:if test="${startPage != 1 }">
      <a href="<%=request.getContextPath() %>/usermyboard?pageNum=${startPage-1}&search=${search}&bd_category_1=${bd_category}">이전</a> 
   </c:if>
   <c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
      <a href="<%=request.getContextPath() %>/usermyboard?pageNum=${s }&search=${search}&bd_category_1=${bd_category}">${s }</a> 
   </c:forEach>
   <c:if test="${endPage < pageCnt }">
      <a href="<%=request.getContextPath() %>/usermyboard?pageNum=${endPage+1}&search=${search}&bd_category_1=${bd_category}">다음</a>
   </c:if>
   </div>
</body>
</html>