<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 돋보기 같은 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script>
   function qnacheck(no,sub,con,answer){
      console.log(no,sub,con,answer);
      var sql = "no="+no+"&sub="+sub+"&con="+con+"&answer="+answer;
      $.ajax({
         type : "post"
         ,url : "<%=request.getContextPath() %>"
         ,data : sql
         
      });
   };
/*   
   $(function(){ 
      <c:forEach items="${list }" var="i" >
        $(".btnc${i.qna_no }").hover(function(e1){
          $(".sub").css("display","none");
             $(".sub${i.qna_no }").css("display","block");

             console.log(e1.clientX);
             console.log(e1.clientY);
           })
        </c:forEach>
        $(!".btnc").hover(function(){
           $(".sub").css("display","none");
        })
    });
*/   
   
</script>
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
color: black;
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
width: 225px;
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
width: 75px;
}

.like {
width: 30px;
}


</style>
<body>

<div style="position: relative;">
<input type="hidden" name ="list" value="${list }">
<p id="p">문의사항</p>
<hr>
<br>
<p id="p2">자주묻는질문</p>
   <c:if test="${ empty list }">
      <p>게시글이 없습니다.</p>
   </c:if>
   <c:if test="${not empty list }">
   
       <table class="table">
         <tr class="tr" id="hide">
            <th class="no">No</th>
            <th class="subj2">제목</th>
         </tr>
         
          <c:forEach items="${list3 }" var="i" >
            <tr class="tr">
               <td class="td">${i.faq_no }</td>
               <form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
               <td class="td">
                  <input type="submit" style="width: 350px;" class="btnc" value="${i.faq_subject }">
                  <input type="hidden" value="${i.faq_no }" name="no">
                  <input type="hidden" value="${i.faq_subject }" name="sub">
                  <input type="hidden" value="${i.faq_content }" name="con">
                  <input type="hidden" value="${i.admin_number }" name="a_num">
               </td>
               </form>
            </tr>
         </c:forEach>
      </table>
      <form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
         <input type="submit" id="write" value="글쓰기" class="button">
         <input type="hidden" value="5" name="a_num">         
      </form>
      <br><br>
</c:if>

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
            <th class="date">답변하기</th>

         </tr>
          <c:forEach items="${list }" var="i" >
         <tr class="tr">
            <td class="td">${i.qna_no }</td>

            <form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
               <td class="td">
                  <input type="submit" class="btnc" style="width: 205px;" value="${i.qna_subject }">
                  <input type="hidden" value="${i.qna_no }" name="no">
                  <input type="hidden" value="${i.qna_subject }" name="sub" class="sub sub${i.qna_no }">
                  <input type="hidden" value="${i.qna_content }" name="con">
                  <input type="hidden" value="${i.a_content }" name="a_con">
                  <input type="hidden" value="${i.qna_kind }" name="kind">
                  <c:forEach items="${list2 }" var="j">
                     <c:if test="${i.qna_no == j.qna_no }">
                        <input type="hidden" value="${j.nickname }" name="nickname">
                     </c:if>
                  </c:forEach>
               </td>
            </form>
            <c:forEach items="${list2 }" var="j">
            <c:if test="${i.qna_no == j.qna_no }">
               <td class="td">${j.nickname }</td>
            </c:if>
            </c:forEach>
            <c:forEach items="${list2 }" var="j">
               <c:if test="${i.qna_no == j.qna_no && j.a_content !=null}">
                  <td class="td">완료</td>
               </c:if>
               
               <c:if test="${i.qna_no == j.qna_no && j.a_content ==null}">
                  <td class="td">
                     <form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
                        <input class="button" type="submit"id="write" value="답변하기" >
                        <input type="hidden" value="${i.qna_no }" name="no">
                        <input type="hidden" value="${i.qna_subject }" name="sub">
                        <input type="hidden" value="${i.qna_content }" name="con">
                        <c:forEach items="${list2 }" var="j">
                           <c:if test="${i.qna_no == j.qna_no }">
                              <input type="hidden" value="${j.nickname }" name="nickname">
                           </c:if>
                        </c:forEach>                        
                     </form>
                  </td>
               </c:if>
            </c:forEach>
         </tr>
         </c:forEach>
      </table>
   </c:if>
   <br>
      <form action="<%=request.getContextPath() %>/userqna" method="get">
      <input type="search" id="textinput" name="search" value="${search}">
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
   <input type="button" class="button" value="메인화면" id="backtolist" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
   <c:if test="${not empty search}">
      <input type="button" class="button" value="전체글목록" id="backtolist" onclick="window.location='<%=request.getContextPath()%>/userqna';">
   </c:if>
   </div>
</body>
</html>