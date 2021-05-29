<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search_park.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="threego.model.vo.User"%>
<%String adminch2 =  (String) session.getAttribute("adminch"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
   <div class="mainstop">
<%
   if(adminch2 !=null){
%>
   <h1 class="title"><a href = "<%=request.getContextPath() %>/admin/adminmain"> 얻다대GO</a></h1>
<%
   }else{
%>
   <h1 class="title"><a href = "<%=request.getContextPath() %>/main"> 얻다대GO</a></h1>
<%
   }
%>
      <div class="searchbox">
         <form action = "<%=request.getContextPath() %>/ParkingSelectedRead" method = "get" >
         <input type = "search" class="search" name = "searchpark" placeholder="주차장을 검색하세요">
         <button type = "submit" class="searchbtn"><i class="fas fa-search fa-lg"></i></button>
         </form>
      </div>
   </div>
</body>
</html>