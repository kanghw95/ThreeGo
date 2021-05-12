<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search_park.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainstop">
   <h1 class="title">얻다대GO</h1>
      <div class="searchbox">
         <form action = "<%=request.getContextPath() %>/ParkingSelectedRead" method = "get" >
         <input type = "search" class="search" name = "search" value="${searchpklot}" placeholder="주차장을 검색하세요">
         <button type = "submit" class="searchbtn"><i class="fas fa-search fa-lg"></i></button>
         </form>
      </div>
   </div>
    <div id="page">
   <div class="mainmove">
   <c:if test="${empty list}">
   주차장을 검색해주세요!
   </c:if>   
   <c:if test = "${ not empty list }">
      <c:forEach items="${list }" var="v">
         <h3><a href="<%=request.getContextPath() %>/parkingRead?parking_name=${v.parking_name }">${v.parking_name }</a></h3>
         <h5>${v.addr }</h5>
         <h3>평점란</h3>
         <button type = "submit">리뷰확인</button>
         <hr>
      </c:forEach>
   </c:if>
   </div>   
   </div>
	
</body>
</html>