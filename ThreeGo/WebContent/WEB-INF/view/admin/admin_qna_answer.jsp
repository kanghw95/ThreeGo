<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
margin-top: 10px;
margin-left: 51px;
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
#contentDiv {
	border-bottom: 1px solid #66612D;
	margin-top: 0;
}
#subjectDiv {
	clear: both;
	margin-bottom: 10px;
	width: 400;
	box-sizing: border-box;
	height: 40;
	outline: none;
	border-top: 1px solid #66612D;
	border-bottom: 1px solid #66612D;
}
.textareawrite {
	border-color: white;
	maxlength: "2048";
	resize: none;
	outline: none;
	width: 380px;
	height: 320;
	margin-top: 30;
	margin-left: 15;
	margin-right: 0;
	maxlength: "2048";
	font-size: 17px;
	padding: 0;
}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<script>
function test() {
    if (!confirm("?????? ?????????????????????????")) {//??????
       return false;
       
    } else {//???
		return true;
    }
}
function test1() {
    if (!confirm("?????? ?????????????????????????")) {//??????
       return false;
       
    } else {//???
		return true;
    }
}
function test2() {
    if (!confirm("?????? ?????????????????????????")) {//??????
       return false;
       
    } else {//???
		return true;
    }
}
</script>
<!-- ???????????? ?????? -->
<c:if test="${not empty admin_number }">
	
	<c:if test="${not empty qna_content }">


	<form method="post" action="<%=request.getContextPath()%>/adminfaqupdate">
		<p id="p">??????????????????</p>
	<input type="hidden" value="${qna_no }" name="no">
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
				<input type="submit" class="button" value="?????????" id="submitbtn" onclick="return test1();">
					<form method="post" action="<%=request.getContextPath()%>/adminfaqdelete">
						<input type="submit" class="button" value="?????????" id="canclebtn" onclick="return test();">
						<input type="hidden" name="no" value="${qna_no }">
					</form>
			</td>
		</tr>
	</table>
	</form>
	<div id="back">
		<br>
		<input type="button" id="backtolist" value="???????????????"
			onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
	</div>
	</c:if>
	
<!-- ???????????? ?????? ?????????-->
	<c:if test="${empty qna_content }">
	<c:if test="${empty notify }">
	<p id="p">??????????????????</p>
	<div style="margin: 0 50 0 50">
	
	<form method="post" action="<%=request.getContextPath()%>/adminfaqinsert">
		<input  type="hidden" value="1" name="faq_notify">
				
		<input type="submit" id="writebtn"  value="??????">
			
		<div id="subjectDiv">
            <input type="text" style="border: none; width: 390;padding: 10;outline: none;" placeholder="???????????? ????????? ??????"
               name="faq_subject">
         </div>
			
		<div id="contentDiv" >
            <textarea class="textareawrite" placeholder="????????? ????????? ?????????" name="faq_content"></textarea>
         </div>
		<br>
		<div id="back">
			<input type="button" value="???????????????" class="button" id="backtolist"
				onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
		</div>
	</form>
	</div>
	</c:if>
<!-- ???????????? ?????????-->
	<c:if test="${not empty notify }">
	<p id="p">????????????/????????????</p>
	<div style="margin: 0 50 0 50">
	<form method="post" action="<%=request.getContextPath()%>/adminfaqinsert">
	<input type="hidden" value="1001" name="faq_notify">
			<input type="submit" id="writebtn"  value="??????">
			
			<div id="subjectDiv">
            <input type="text" style="border: none; width: 390;padding: 10;outline: none;" placeholder="???????????? ??????"
               name="faq_subject">
         	</div>
			

			<div id="contentDiv">
            	<textarea class="textareawrite" placeholder="????????? ????????? ?????????" name="faq_content"></textarea>
         	</div>
			<div id="back">
			<input type="button" value="???????????????" class="button" id="backtolist"
				onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
			</div>
	</form>
	</div>
	</c:if>		
	</c:if>

</c:if>


<!-- ????????????????????? -->
<c:if test="${not empty nickname}">
	<p id="p">?????????????????????</p>
		<table id="table1">
			<tr class="tr">
				<td id="date">${nickname }</td>
			</tr>
			<tr class="tr">
				<td id="subject" >${qna_subject}</td>
			</tr>

			<tr class="tr">
				<td>
					<textarea name="con" id="textform" readonly>${qna_content }
					</textarea>
				</td>
			</tr>

		</table>
		
	<br>
	<br>
	<br>
	<p id="p">????????????</p>
		<form action="<%=request.getContextPath()%>/answerupdate" method="POST">

		<input type="hidden" name="qnano" value="${qna_no }">
		<table id="table1">
			<tr >
				<c:if test="${empty a_content }">
					<td><textarea name="answer" placeholder="???????????????"  id="inputA"
						 ></textarea>
					</td>
				</c:if>
				<c:if test="${not empty a_content }">
					<td><textarea name="answer"
						  id="inputA" >${a_content }</textarea>
					</td>
				</c:if>
			</tr>
			
			<tr class="nounderline">
				<td id="udbtn">
				<c:if test="${empty a_content }">
					<input type="submit" class="button" value="????????????" id="canclebtn" onclick="return test2();">
				</c:if>
				<c:if test="${not empty a_content }">
					<input type="submit" class="button" value="?????????" id="submitbtn" onclick="return test1();">
				</c:if>
				</td>
			</tr>
		</table>
		<br>
		<div id="back">
			<input type="button" value="???????????????" class="button" id="backtolist"
				onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
		 </div>
	</form>
</c:if>
</body>
</html>