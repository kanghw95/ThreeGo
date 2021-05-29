<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#reporttable tr {
   border-bottom: 1px solid #66612d;
   border-top: 0px;
   height: 35px;
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
#reportbutton{
 margin: 0;
  padding: 1 4 1 4;
  border: none;
  border-radius: 12px;
   background : #E0DEC3;
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
  border: 3px solid #E0DEC3;
  border-radius: 12px;
   background : white;
   color: black;
  position:relative;
  height:30px;
  font-size:13px;
  cursor:pointer;
  outline:none;
}
   

#reporttable {
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

#reportboard h2 {
margin-top: 10;
margin-left: 55px;
clear : both;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}

.no {
   width: 40px;
}
.btno{
   width: 50px;
}

.subject {
   width: 105px;
   white-space:nowrap;  
   text-overflow:ellipsis; 
   overflow:hidden;
}

.writer {
   width: 55px;
   white-space:nowrap;  
   text-overflow:ellipsis; 
   overflow:hidden;
}
.date{
width: 80px;
}
.con{
width: 70px;
}
#reporttable td{
         white-space:nowrap;  
         text-overflow:ellipsis; 
         overflow:hidden;
      }
#reporth1{
color : #66612D;
}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<h2 id="reporth1" style="margin-top: 10;
margin-left: 55px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;">신고하기</h2><br>
<div id="reportboard">
  	 
   
      <c:if test="${type=='grade' }">
         <h2>주차장 평가게시판</h2>
      </c:if>
      <c:if test="${type=='share' }">
         <h2>주차장 쉐어링게시판</h2>
      </c:if>
      <c:if test="${type=='drive' }">
         <h2>드라이브코스 추천게시판</h2>
      </c:if>
      <c:if test="${type=='free' }">
         <h2>자유게시판</h2>
      </c:if>
      <c:if test="${type=='free' }">
         <h2>자랑게시판</h2>
      </c:if>
   </div>
   <c:if test="${ empty list }">
      <p>조회된 신고가 없습니다.</p>
   </c:if>
   <c:if test="${not empty list }">

      <table id="reporttable">
         <tr id="hide">
            <th class="no">No</th>
            <th class="writer">신고자</th>
            <th class="bdno">글번호</th>
            <th class="subject">피신고자</th>
            <th class="date">신고날짜</th>
            <th class="con">내용</th>
         </tr>
          <c:forEach items="${list }" var="i">
         
         <tr>
            <td>${i.bd_report_no }</td>
            <td>${i.reporter }</td>
            <td>${i.bd_content_no }</td>
            <td>${i.reported }</td>
            <td>${i.report_date}</td>
         <form  method="post" action="<%=request.getContextPath() %>/adminreport">
            <td>
               <input type="submit" id="reportbutton" value="신고내용">
               <input type="hidden" value="${i.bd_report_no }" name="bd_report_no">
               <input type="hidden" value="${i.bd_content_no }" name="bd_content_no">
               <input type="hidden" value="${i.reported }" name="reported">
               <input type="hidden" value="${i.bd_content }" name="bd_content">
               <input type="hidden" value="${i.reporter }" name="reporter">
               <input type="hidden" value="${i.report_content }" name="report_content">
            </td>
         </form>
         </tr>
      
   
         </c:forEach>
         
   
         
      </table>
      <br>
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
   <br>
   <input type="button" class="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
   <c:if test="${not empty search}">
      <input class="button" type="button" value="전체글목록" onclick="location.href='<%=request.getContextPath()%>/adminctrl';">
   </c:if>
</body>
</html>