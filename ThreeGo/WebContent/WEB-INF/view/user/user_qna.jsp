
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="threego.model.vo.User"%>
<%User user = (User) session.getAttribute("user");%>
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
color: black;
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
margin-left: 51px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}
#p2 {
clear:both;
margin-top: 10;
margin-left: 51px;
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
<script>
   function passch(pwd,open){
      if(open==0){
         return true;
      }else{   
         var a =prompt("qna를 등록 했을시 설정한 비밀번호를 입력하세요")
         if(pwd==a){
            return true;
            
         }else{
            alert('비밀번호가 일치하지 않습니다.');
            return false;
         }
      }
   }
   function bback(){
      history.back();
   }
</script>
</head>
<body>
<input type="hidden" name ="list" value="${list }">
<p id="p2">자주묻는질문</p>
   
      <table class="table">
         <tr class="tr" id="hide">
            <th class="no">No</th>
            <th class="subj2">제목</th>
         </tr>
         
          <c:forEach items="${list3 }" var="i" >
            <tr class="tr">
               <td class="td">${i.faq_no }</td>
               <td class="td">
               <form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
                  <input type="submit" style="width: 350px;" class="btnc" value="${i.faq_subject }">
                  <input type="hidden" value="${i.faq_no }" name="no">
                  <input type="hidden" value="${i.faq_subject }" name="sub">
                  <input type="hidden" value="${i.faq_content }" name="con">
                  <input type="hidden" value="user" name="user">
               </form>
               </td>
            </tr>
         </c:forEach>
      </table>
<br><br>
<p id="p">QNA</p>
<br><br><br>
   <c:if test="${ empty list }">
      <p>게시글이 없습니다.</p>
   </c:if>
   <c:if test="${not empty list }">
      <table class="table" >
         <tr class="tr" id="hide">
            <th class="no">No</th>
            <th class="subj">제목</th>
            <th class="writer">작성자</th>
            
         </tr>
          <c:forEach items="${list }" var="i" >
         <tr class="tr">
            <td class="td">${i.qna_no }</td>
            
               <td class="td">
            <form id="frm"  method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
                  <input type="submit" class="btnc" style="width: 280px;" value="${i.qna_subject }" name="test" onclick="return passch('${i.qna_pwd}','${i.qna_open }')">
                  <input type="hidden" value="${i.qna_no }" name="no">
                  <input type="hidden" value="${i.qna_subject }" name="sub">
                  <input type="hidden" value="${i.qna_content }" name="con">
                  <input type="hidden" value="${i.a_content }" name="a_con">
                  <input type="hidden" value="${i.qna_kind }" name="kind">
                  <input type="hidden" value="user" name="user">
                  <c:forEach items="${list2 }" var="j">
                     <c:if test="${i.qna_no == j.qna_no }">
                        <input type="hidden" value="${j.nickname }" name="nickname">
                     </c:if>
                  </c:forEach>
            </form>
               </td>
            
            <c:forEach items="${list2 }" var="j">
            <c:if test="${i.qna_no == j.qna_no }">
               <td class="td">${j.nickname }</td>
            </c:if>
            </c:forEach>
         </tr>
         </c:forEach>
      </table>
   </c:if>
   <br>
      <form action="<%=request.getContextPath() %>/userqna" method="get">
      <input type="search" name="search" id="textinput" value="${search}">
      <button type="submit" id="searchbutton">검색</button>
   </form>
   <br>
   <c:if test="${startPage != 1 }">
      <a href="<%=request.getContextPath() %>/userqna?pageNum=${startPage-1}&search=${search}">이전</a> 
   </c:if>
   <c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
      <a href="<%=request.getContextPath() %>/userqna?pageNum=${s }&search=${search}">${s }</a> 
   </c:forEach>
   <c:if test="${endPage < pageCnt }">
      <a href="<%=request.getContextPath() %>/userqna?pageNum=${endPage+1}&search=${search}">다음</a>
   </c:if>
   
   <br>
	<br>
	<br>
      <%if(user!=null){ %>
   <input type="button" id="write" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/user/userqnainsert';">
   <input type="hidden" name="no" value="<%=user.getUser_no()%>">
   <%} %>
   <input type="button" class="button" id="backtolist" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/main';">
   <c:if test="${not empty search}">
      <input type="button" class="button" id="backtolist" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/userqna';">
   </c:if>
   
</body>
</html>