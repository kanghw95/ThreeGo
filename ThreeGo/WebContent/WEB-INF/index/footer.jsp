<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.footer{
text-align : center;
}
#btnNotify, #btnQna{
 height: 50px;
 bottom:0;
    margin-top: auto;
background :white;
   color: black;
  position:relative;
border : none;
  font-size:13px;
  cursor:pointer;
  outline:none;
}

</style>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
<div class="footer">
<br>
<input type="button" id="btnNotify" value="공지사항" style="color: #66612D" onclick="location.href='<%=request.getContextPath()%>/adminnotify'">
|
<input type="button" id="btnQna" value="문의사항" style="color: #66612D"  onclick="location.href='<%=request.getContextPath()%>/userqna'">
<br>
</div>
</body>
</html>