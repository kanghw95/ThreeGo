<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="threego.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="threego.admin.Admin"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
tr {
	border-bottom: 1px solid #EFEFEF;
	border-top: 0px;
	height: 50px;
}

#backtolist {

  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
	background : white;
	color: black;
  position:relative;
  height:30px;
  font-size:13px;
  cursor:pointer;
  outline:none;
}

.button {

  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
	background : white;
	color: black;
  position:relative;
  height:30px;
  font-size:13px;
  cursor:pointer;
  outline:none;
}
	
}

table {
	font-size: 13px;
	text-align: center;
	width: 400px;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	border: 0px;
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

#th {
	color: 00376b;
}

#hide {
	border-bottom: 0px;
}

p {
	margin-top: 10;
	margin-left: 50px;
	float: left;
	font-size: 20px;
	font-weight: bold;
}

.no {
	width: 30px;
}

.subj {
	width: 200px;
	white-space:nowrap;  
	text-overflow:ellipsis; 
	overflow:hidden;
}

.writer {
	width: 70px;
}
.date{
width: 70px;
}
.like{
width: 30px;
}
td{
			white-space:nowrap;  
			text-overflow:ellipsis; 
			overflow:hidden;
		}
</style>

<title>평가 게시판</title>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<p>
<c:if test="${bd_category eq 'bd_category_1'}">
주차장 평가게시판
</c:if>
<c:if test="${bd_category eq 'bd_category_2'}">
주차장 쉐어링게시판
</c:if>
<c:if test="${bd_category eq 'bd_category_3'}">
드라이브코스 추천게시판
</c:if>
<c:if test="${bd_category eq 'bd_category_4'}">
자유게시판
</c:if>
<c:if test="${bd_category eq 'bd_category_5'}">
자랑게시판
</c:if>
</p>
<%
	Admin admin = (Admin) session.getAttribute("admin");
%>
<%
      if (admin == null) {
%>


 
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
            <th class="like">공감</th>
         </tr>
      <c:forEach items="${boardList }" var="v">
         <tr>
            <c:if test="${bd_category eq 'bd_category_1'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_2'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-1000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_3'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-2000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_4'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-3000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_5'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-4000}</a></td>
            </c:if>
            <td>${v.bd_subject }</td>
            <td>${v.bd_writer }</td>
            <td>${v.bd_date }</td>
            <td>${v.bd_likecnt}</td>
         </tr>      
      </c:forEach>
      </table>
   </c:if>
     <form action="<%=request.getContextPath() %>/boardlist" method="get">
      <input type="search" name="search" value="${search}">
      <input type="hidden" name="bd_category_1" value="${bd_category}">
      <button type="submit">검색</button>
   </form>
   <c:if test="${not empty search}">
     <strong>${search}</strong>에 대한 검색 결과입니다.
   </c:if>
   <br>
   <c:if test="${startPage != 1 }">
      <a href="<%=request.getContextPath() %>/boardlist?pageNum=${startPage-1}&search=${search}&bd_category_1=${bd_category}">이전</a> 
   </c:if>
   <c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
      <a href="<%=request.getContextPath() %>/boardlist?pageNum=${s }&search=${search}&bd_category_1=${bd_category}">${s }</a> 
   </c:forEach>
   <c:if test="${endPage < pageCnt }">
      <a href="<%=request.getContextPath() %>/boardlist?pageNum=${endPage+1}&search=${search}&bd_category_1=${bd_category}">다음</a>
   </c:if>
   
   
   <br>
   <br>
   <c:if test="${not empty search}">
      <input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/boardlist';">
   </c:if>
   <%
      } else {
   %>
   
  
   <c:if test="${empty boardList}">
      게시글이 없습니다.
   </c:if>
    <c:if test="${not empty search}">
     <strong>${search}</strong>에 대한 검색 결과입니다.
   </c:if>
   <c:if test="${not empty boardList}">
      <table>
         <tr id="hide">
            <th class="no">No</th>
            <th class="subject">제목</th>
            <th class="writer">작성자</th>
            <th class="date">작성일</th>
            <th class="like">공감</th>
         </tr>
      <c:forEach items="${boardList }" var="v">
         <tr>
            <c:if test="${bd_category eq 'bd_category_1'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no ">${v.bd_content_no}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_2'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-1000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_3'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-2000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_4'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }">${v.bd_content_no-3000}</a></td>
            </c:if>
            <c:if test="${bd_category eq 'bd_category_5'}">
               <td><a href="<%=request.getContextPath() %>/boardRead?bd_content_no=${v.bd_content_no }>">${v.bd_content_no-4000}</a></td>
            </c:if>
            <td>${v.bd_subject }</td>
            <td>${v.bd_writer }</td>
            <td>${v.bd_date }</td>
            <td>${v.bd_likecnt}</td>
         </tr>      
      </c:forEach>
      </table>
   </c:if>
     <form action="<%=request.getContextPath() %>/boardlist" method="get">
      <input type="search" name="search" value="${search}">
      <input type="hidden" name="bd_category_1" value="${bd_category}">
      <button class="button" type="submit">검색</button>
   </form>
  
   <br>
   <c:if test="${startPage != 1 }">
      <a href="<%=request.getContextPath() %>/boardlist?pageNum=${startPage-1}&search=${search}&bd_category_1=${bd_category}">이전</a> 
   </c:if>
   <c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
      <a href="<%=request.getContextPath() %>/boardlist?pageNum=${s }&search=${search}&bd_category_1=${bd_category}">${s }</a> 
   </c:forEach>
   <c:if test="${endPage < pageCnt }">
      <a href="<%=request.getContextPath() %>/boardlist?pageNum=${endPage+1}&search=${search}&bd_category_1=${bd_category}">다음</a>
   </c:if>
   
   
   <br>
      
   <input type="button" class="button" value="목록으로" id="backtolist"
		onclick="window.location='<%=request.getContextPath()%>/board/boardlist';">
   <%
      }
   %>
</body>
</html>