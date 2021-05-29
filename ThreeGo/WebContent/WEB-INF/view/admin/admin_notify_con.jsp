<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="threego.model.vo.User"%>
<%@page import="threego.admin.Admin"%>

<%
	Admin admin = (Admin) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
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

#inputA {
   width: 330px;
   height: 100px;
   overflow-y: scroll;
   resize: none;
   border: 1px solid #66612D;
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
#p {
margin-top: 10;
margin-left: 50px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function test() {
    if (!confirm("정말 삭제하시겠습니까?")) {//니요
       return false;
       
    } else {//네
		return true;
    }
}

</script>
<p id="p">공지사항/이용방법</p>
<%if(admin != null) {%>
<form action="<%=request.getContextPath()%>/adminfaqupdate" method="post">
	<input type="hidden" value="${no }" name="no">
		<table id="table1" >
			<tr class="tr">
				<td id="subject">${sub }</td>
			</tr>
			<tr class="tr">
				<td>
					<textarea name="con" id="textform" >${con }
					</textarea>
				</td>
			</tr>
			<tr class="nounderline">
				<td id="udbtn">
					<input type="submit" class="button" value="글수정" id="submitbtn">
					<form method="post" action="<%=request.getContextPath()%>/adminfaqdelete">
						<input type="submit" class="button" value="글삭제" id="canclebtn" onclick="return test();">
						<input type="hidden" name="no" value="${no }">
					</form>
				</td>
			</tr>
		</table>
		<div id="back">
		<br>
		<input type="button" class="button" value="메인페이지" id="backtolist"
			onclick="window.location='<%=request.getContextPath()%>/admin/adminmain';">
		</div>

<%}else{ %>
		<table id="table1">
			<tr class="tr">
				<td id="subject">${sub }</td>
			</tr>
			<tr class="tr">
				<td>
					<textarea name="con" id="textform" readonly >${con }
					</textarea>
				</td>
			</tr>
		</table>
	<br>
		<div id="back">
		<input type="button" class="button" value="메인페이지" id="backtolist"
			onclick="window.location='<%=request.getContextPath()%>/main';">
		</div>
<%} %>
</form>
</body>
</html>