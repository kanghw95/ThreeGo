<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
   text-decoration: none;
   color: black;
}

.button1 {
   margin-top: 0;
   margin-left: 50px;
   font-weight: bold;
   height: 40px;
   font-size: 20px;
   padding: 2em 2em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
   color: #black;
   background: none;
   border: none;
}

#report {
  margin-left: 105px;
   padding: 20 20 0 0;
   font-size: 20px;
   float : left;
   font-weight: bold;
   color: #66612D;
    text-align: center; 
}

.button1 {
   /* margin : 0 auto; */
   margin-left: 65;
   margin-bottom: 20;
   display: block; text-align;
   font-weight: bold;
   height: 40px;
   font-size: 20px;
   padding: 2em 2em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
   color: #black;
   background: none;
   border: none;
}

.button1 {
   letter-spacing: 0;
   -webkit-transition: all .28s ease-in-out;
   transition: all .28s ease-in-out;
}

.button1:hover, .button1:focus, .button1:active {
   letter-spacing: 6px;
}

.button1:after, .button1:before {
   border: 1px solid rgba(255, 255, 255, 0);
   bottom: 0;
   content: " ";
   display: block;
   margin: 0 auto;
   position: relative;
   -webkit-transition: all .28s ease-in-out;
   transition: all .28s ease-in-out;
   width: 0;
}

.button1:hover:after, .button1:hover:before {
   border-color: #fff;
   -webkit-transition: width 350ms ease-in-out;
   transition: width 350ms ease-in-out;
   width: 70%;
}

.button1:hover:before {
   bottom: auto;
   top: 0;
}

#box{
clear: both;}
</style>
</head>
<body>
      <p id="report">신고하기</p>
   <div id="box">

      <form action="<%=request.getContextPath()%>/adminreportctrl"
         method="get">
         <input type="hidden" id="bd_category_1" name="type" value="grade">
         <h1>
            <button type="submit" class="button1">주차장 평가게시판</button>
         </h1>
      </form>
      <form action="<%=request.getContextPath()%>/adminreportctrl"
         method="get">
         <input type="hidden" id="bd_category_1" name="type" value="share">
         <h1>
            <button type="submit" class="button1">주차장 쉐어링게시판</button>
         </h1>
      </form>
      <form action="<%=request.getContextPath()%>/adminreportctrl"
         method="get">
         <input type="hidden" id="bd_category_1" name="type" value="drive">
         <h1>
            <button type="submit" class="button1">드라이브코스 추천게시판</button>
         </h1>
      </form>
      <form action="<%=request.getContextPath()%>/adminreportctrl"
         method="get">
         <input type="hidden" id="bd_category_1" name="type" value="free">
         <h1>
            <button type="submit" class="button1">자유게시판</button>
         </h1>
      </form>
      <form action="<%=request.getContextPath()%>/adminreportctrl"
         method="get">
         <input type="hidden" id="bd_category_1" name="type" value="pride">
         <h1>
            <button type="submit" class="button1">자랑 게시판</button>
         </h1>
      </form>

   </div>
</body>
</html>