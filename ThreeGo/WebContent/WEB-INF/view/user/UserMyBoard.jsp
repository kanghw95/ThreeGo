<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 글 조회</title>
</head>
<body>
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
<%User user = (User) session.getAttribute("user"); %>

   <c:if test="${empty boardList}">
      게시글이 없습니다.
   </c:if>
    <c:if test="${not empty search}">
     <strong>${search}</strong>에 대한 검색 결과입니다.
   </c:if>
   <c:if test="${not empty boardList}">
      <table border="1">
         <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>공감</th>
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
            <td>${v.bd_subject }</td>
            <td>${v.bd_writer }</td>
            <td>${v.bd_date }</td>
            <td>${v.bd_likecnt}</td>
         </tr>      
      </c:forEach>
      </table>
   </c:if>
     <form action="<%=request.getContextPath() %>/usermyboard" method="get">
      <input type="search" name="search" value="${search}">
      <input type="hidden" name="bd_category_1" value="${bd_category}">
      <button type="submit">검색</button>
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
</body>
</html>