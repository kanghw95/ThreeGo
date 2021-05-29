<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="threego.model.vo.User"%>
<%
	User user = (User) session.getAttribute("user");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#read_frm{

   padding-top: 100;
}
#table1{
   margin-top : 20px;
   
   width: 400px;
   margin-left: auto;
   margin-right: auto;
   border-collapse: collapse;
   border-radius: 12px;
}

#table3{
   margin-left: 265px;
   margin-right: 10px;
}

#table2 {
   width: 400px;
   margin-left: auto;
   margin-right: auto;
   border-collapse: collapse;
}

.tr {
   border-bottom: 1px solid #66612D;
   height: 25px;
   
}

#submitbtn, #canclebtn {
   width: 90px;
   position: relative;
   height: 25px;
   font-size: 13px;
   cursor: pointer;
   margin-top: 3px;
   padding: 1 4 1 4;
   border: none;
   border-radius: 12px;
   background: #E0DEC3;
   color: black;
   cursor: pointer;
   outline: none;
}

.button {
   margin: 0;
   padding: 1 4 1 4;
   border: none;
   border-radius: 12px;
   background: #E0DEC3;
   color: black;
   position: relative;
   height: 30px;
   font-size: 13px;
   cursor: pointer;
   outline: none;
}

#btnlike {
   background: none;
   color: none;
   margin-right: 50px;
}

#likelike {
   text-aglin: right;
   font-size: 12px;
   height: 30px;
    clear: both;
   width: 420;
   padding-top: 20;
}

#boardname {
   font-size: 13px;
}

#textform {
   maxlength: 2048;
   border: none;
   width: 400px;
   height: 250px;
   resize: none;
   text-aglin: left;
}
#textform1 {
   maxlength: 2048;
   border: none;
   width: 400px;
   height: 250px;
   resize: none;
   text-aglin: left;
   border-radius: 5px;
   color :  #66612D;
   background : #efefef;
}

#inputA {
   maxlength: 2048;
   width: 400px;
   height: 100px;
   overflow-y: scroll;
   resize: none;
   border-radius: 5px;
    border: none;
   background : #efefef;
}

#comtable {
   border-radius: 10px;
   
}

#updateupdate {
   display: none;
}

#subject {
   font-size: 26px;
   text-align: left;
   
}

#writer {
   font-size: 13px
}

#bthchat {
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

#date {
   font-size: 12px
}

#like {
   height: 10px;
   text-align: right;
}

.nounderline {
   border: 0px;
}

#updateupdate {
   font-size: 12px;
   height: 100px;
   padding: 0px 0px;
   width: 70px;
   color: #black;
   text-align: center;
}

#insertinsert {
   font-size: 12px;
   height: 100px;
   padding: 0px 0px;
   width: 70px;
   color: #black;
   text-align: center;
}

.comud {
   border : none;
   color: #66612D;
   text-align: center;
   background: none;
   padding : 3px;
}

#back {
   text-align: center;
}
#buttontolist{
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
.likep {
   background: none;
   margin-right: 50px;
}

#udbtn {
   text-align: right;
}

#tablemargin {
   margin: auto;
   width: 400px;
   box-sizing: border-box;
}

#tablemargin td {
   padding: 0;
}
#report{
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
#p {
margin-top: 10;
margin-left: 50px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
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
#writebtn {
	border:none;
	float: right;
	/* 	padding-left: 10px;
	padding-right: 10px; */
	background-color: white;
	background: #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
	padding: 5 10 5 10;
}
</style>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- FAQ 답 -->
<c:if test="${empty qna_kind }">

<p id="p">자주묻는질문</p>

	<table id="table1">

		<tr class="tr">
			<td id="subject">${qna_subject }</td>
		</tr>

		<tr class="tr">
			<td>
				<textarea name="con" id="textform" >${qna_content }
				</textarea>
			</td>
		</tr>
		<tr class="nounderline">
			<td id="udbtn">
				<input type="submit" id="writebtn" value="확인" onclick="history.back();">
			</td>
		</tr>
	</table>
	<br>
	<div id="back">
		<input type="button" value="메인페이지" class="button" id="backtolist"
			onclick="window.location='<%=request.getContextPath()%>/main';">
	</div>
</c:if>


<!-- QNA -->
<c:if test="${not empty qna_kind }">
<!-- 내가 등록한 QNA -->
<p id="p">이용자문의사항</p>
<c:if test="${nickname == user.getNickname() }">
<form action="<%=request.getContextPath()%>/userqnaupdate" method="POST">
<input type="hidden" value="${qna_no }" name="no">
		<table id="table1">
		
			<c:if test="${empty a_content }">
			<tr class="tr">
				<td><input type="text" name="sub" id="subject" style="border : none;" value="${qna_subject }"></td>
			</tr>
			</c:if>
			<c:if test="${not empty a_content }">
			<tr class="tr">
				<td id="subject" >${qna_subject}</td>
			</tr>
			</c:if>
			<tr class="nounderline">
				<td id="writer">${nickname }</td>
			</tr>
			<c:if test="${empty a_content }">
			<tr class="nounderline">
				<td  id="writer">문의항목</td>
			</tr>
			<tr class="tr">
				<td  id="writer">
				<select id="select" name="select">
					<option value="${qna_kind }">${qna_kind }</option>
					<option value="계정">계정</option>
					<option value="채팅">채팅</option>
					<option value="게시판">게시판</option>
					<option value="쉐어링">쉐어링</option>
					<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			</c:if>
			<c:if test="${not empty a_content }">
			<tr class="tr">
				<td id="writer">문의항목 :${qna_kind }</td>
			</tr>
			</c:if>	
			<c:if test="${empty a_content }">
			<tr class="tr">
				<td>
					<textarea name="con" maxlength="2048" id="textform"
					>${qna_content }
					</textarea>
				</td>
			</tr>
			</c:if>
			<c:if test="${not empty a_content }">
			<tr class="tr">
				<td>
				<textarea name="con" id="textform" readonly>${qna_content }
					</textarea>
				</td>
			</tr>
			</c:if>
			<tr class="nounderline">
				<td id="udbtn">
				<c:if test="${empty a_content }">
					<input type="submit" class="button" value="질문 수정">
				</c:if>
				<c:if test="${not empty a_content }">
					<input type="button" value="확인" id="writebtn" 
						onclick="history.back();">
				</c:if>
				</td>
			</tr>
		</table>
</form>
</c:if>
<c:if test="${nickname != user.getNickname() }">
		<table id="table1">
		

			<tr class="tr">
				<td id="subject" >${qna_subject}</td>
			</tr>
			<tr class="nounderline">
				<td id="writer">${nickname }</td>
			</tr>
			<tr class="tr">
				<td id="writer">문의항목: ${qna_kind }</td>
			</tr>

			<tr class="tr">
				<td>
					<textarea name="con" id="textform" readonly>${qna_content }
					</textarea>
				</td>
			</tr>
			<tr class="nounderline">
				<td id="udbtn">
					<input type="button" value="확인" id="writebtn" 
						onclick="history.back();">
				</td>
			</tr>
		</table>
		<br>
</c:if>
	<p id="p">답변내용</p>

		
		<input type="hidden" name="qnano" value="${qna_no }">
		<table id="table1">
			<tr >
				<c:if test="${empty a_content }">
					<td><textarea name="answer" placeholder="아직답변이 없습니다." id="inputA"></textarea>
					</td>
				</c:if>
				<c:if test="${not empty a_content }">
					<td><textarea name="answer" id="inputA">${a_content }</textarea>
					</td>
				</c:if>
			</tr>
		</table>
		<br>
		<div id="back">
		<input type="button" value="메인페이지" class="button" id="backtolist"
			onclick="window.location='<%=request.getContextPath()%>/main';">
		</div>
		

</c:if>
</body>
</html>