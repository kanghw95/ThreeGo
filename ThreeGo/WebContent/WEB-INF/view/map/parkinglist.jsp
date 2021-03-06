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
<style type="text/css">
.button{
  margin: 0;
  padding: 1 4 1 4;
  background : white;
  color: #66612D;
  position:relative;
  height:30px;
  font-size:13px;
  border: none;
}

#mainmove hr{
  color: #66612D;
}
</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
   <div class="mainstop">
   <h1 class="title"><a href = "<%=request.getContextPath() %>/main"> 얻다대GO</a></h1>
      <div class="searchbox">
         <form action = "<%=request.getContextPath() %>/ParkingSelectedRead" method = "get" >
         <input type = "search" class="search" name = "searchpark" placeholder="주차장을 검색하세요">
         <button type = "submit" class="searchbtn"><i class="fas fa-search fa-lg"></i></button>
         </form>
      </div>
   </div>
    <div id="page" style="padding-top: 20">
   <div class="mainmove">
   <c:if test="${empty listpark}">
   주차장을 검색해주세요!
   <style>
#page{
display: none;
}

</style>
   </c:if>   
 <c:if test = "${ not empty listpark }">
      <c:forEach items="${listpark }" var="v">
         <div class="park park${v.parking_code }" onclick = "panTo('${v.parking_name}','${v.parking_code }')">
         <h3>${v.parking_name }</button></h3>
         <h5>${v.addr }</h5>

                   <h5> 평점  : ${v.grade}점</h5>
         <form action = "<%=request.getContextPath() %>/reviewlist" method = "post">
         <input type="hidden" name="parking_code" value="${v.parking_code }">
         <button type = "submit" class="button">리뷰확인</button>

          <input type="button" class="button" value="리뷰 쓰기" onclick="location.href ='<%=request.getContextPath() %>/main/reviewWrite?parking_code=${v.parking_code }&parking_name=${v.parking_name }'">
        
         </form>
        </div>
         <hr>
      </c:forEach>
   </c:if>
   </div>
   </div>
</body>
</html>