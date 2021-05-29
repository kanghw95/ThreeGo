<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.left{

}
#table1{
   margin-top : 20px;
   
   width: 400px;
   margin-left: auto;
   margin-right: auto;
   border-collapse: collapse;
   border-radius: 12px;
}

.tr{
    border-bottom:1px solid #66612D;
    height: 35px;
    width: 170px;
    
}
#submitbtn ,#canclebtn{
  
   width: 90px;
  position:relative;
  height:25px;
  font-size:13px;
  cursor:pointer;

   margin-top: 3px;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
	background :white;
	color: black;

  cursor:pointer;
  outline:none;
  
}
.button{
  margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
	background :white;
	color: black;
  position:relative;
  height:30px;
  font-size:13px;
  cursor:pointer;
  outline:none;
}
#btnlike{
background :none;
color:none;
margin-right : 50px;
}

#likelike{
   text-aglin : right;
   font-size : 12px;
   height : 30px;
}

#boardname{
   font-size: 13px;
}
#textform {
   maxlength: 2048;
   border: none;
   width: 400px;
   height: 250px;
   resize: none;
}
#inputA{
   width:330px;
   height: 100px;
   overflow-y: scroll;
   resize: none;
   border : 0px;
}
#comtable{
     border-radius: 10px;
   border: 1px solid #EFEFEF;
 
}
#updateupdate {
   display: none;
}
#subject{
   font-size:26px;
   text-align: left;
}
#writer{
   font-size : 13px
}

#bthchat{
 margin: 0;
  padding: 1 4 1 4;
  border: 3px solid #CFCFCF;
  border-radius: 12px;
	background :white;
	color: black;
  position:relative;
  height:25px;
  font-size:12px;
  cursor:pointer;
  outline:none;
}
#date{
   font-size : 12px
}



#like{
   height : 10px;
   text-align : right;
}
.nounderline{
border : 0px;
}
#updateupdate{

   font-size : 12px;
   height : 100px;
   padding : 0px 0px;
   width: 70px;
   color : #black ;
   text-align : center;
}

#insertinsert{

   font-size : 12px;
   height : 100px;
   padding : 0px 0px;
   width: 70px;
   color :  #black; 
   text-align : center;
}
.comud{
background :#EFEFEF;
color: #balck;
text-align : center;

}

#back{
  text-align :center;

}
.th{
	text-align: left;
	width: 200px;
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
#p {
margin-top: 10;
margin-left: 50px;
float: left;
font-size: 20px;
font-weight: bold;
color : #66612D;
}

</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<p id="p">신고하기</p>



		<table id="table1">
			<tr class="tr">
				<th class="th">신고번호</th>
				<td>${bd_report_no }</td>
			</tr>
			<tr class="tr">
				<th class="th">신고당항 게시글번호</th>
				<td id="writer">${bd_content_no }</td>
			</tr>
			
			<tr class="tr">
				<th class="th">신고당한사람</th>
				<td onclick="location.href ='<%=request.getContextPath() %>/main/user/chat'" style="cursor: pointer">${reported }</td>
			</tr>
			<tr style="border-bottom:1px solid #66612D;">
				
				<td colspan="2">
				<textarea readonly id="textform"  style="border-bottom:1px solid #66612D;">${bd_content }</textarea> 
             	</td>
			</tr>
		</table>
	<br><br>
	
		<table id="table1">
			<tr style="border:none;">
				<th class="th">신고자</th>
				<td id="writer" onclick="location.href ='<%=request.getContextPath() %>/main/user/chat'" style="cursor: pointer">${reporter }</td>
			</tr>
			<tr style="border:none;">
				<td colspan="2"><textarea readonly id="inputA">${report_content }</textarea> </td>
			</tr>
		</table>	
		
	
	
	<br>
	<div id="back">
	<input type="button" class="button" id="backtolist" value="메인페이지" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
	</div>
</body>
</html>