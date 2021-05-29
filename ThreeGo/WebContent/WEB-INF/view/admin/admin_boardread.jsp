<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="threego.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="threego.admin.Admin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
</style>

</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">

<%
	Admin admin = (Admin) session.getAttribute("admin");
%>
<%
      if (admin == null) {
%>
	로그인 후 이용하시길 바랍니다.
	<a href="<%=request.getContextPath()%>/main">메인화면으로</a>
	<%
		} else {
	%>
	

	<form action="<%=request.getContextPath()%>/boardupdate" method="post">

		<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no}">
		<input type="hidden" name="bd_subject" value="${boardread.bd_subject}"> 
		<input type="hidden" name="bd_writer" value="${boardread.bd_writer}">
		<input type="hidden" name="bd_content" value="${boardread.bd_content}">
		<input type="hidden" name="fullname" value="${file.fullname}">
		<input type="hidden" name="filepath" value="${file.filepath}">
		<input type="hidden" name="fullname" value="${file.contents_type}">
		 <input type="hidden" name="bd_category_1" value="${bd_category_1}"> 


		<table id="table1">
			<tr class="tr" id="likelike" >
				<td>
				</td>
			</tr>
			<tr class="tr">
				<td id="subject">${boardread.bd_subject}</td>
			</tr>
			<tr class="nounderline">
				<td id="writer">
				${boardread.bd_writer} 
				&emsp;
				<input type="button" id="bthchat" name="btnchat" value="1:1채팅" onclick="location.href='<%=request.getContextPath() %>/main/user/chat'">
				</td>
			</tr>
			<tr class="tr">
				<td id="date">${boardread.bd_date}</td>
			</tr>
		
<hr>
			<tr class="tr" class="left">
			<td>
            <textarea readonly id="textform" >${boardread.bd_content}</textarea>
				<c:forEach var="file" items="${files}">
						<img id="file" width="150" height="150" src="<%=request.getContextPath() %>${file.filepath }/${file.fullname}" alt="file" />
				</c:forEach>
				</td>
			</tr>
			
			
			<tr class="nounderline">
				<td id="udbtn">	
						<input type="button" id="canclebtn" value="글삭제" onclick="test()">
				</td>
			</tr>
		</table>
	</form>

	<script>
		    function test() {
		        if (!confirm("정말 삭제하시겠습니까?")) {//니요
		        	location.href="<%=request.getContextPath()%>/history.back()";
		        } else {//네
		        	location.href="<%=request.getContextPath()%>/boarddelete?bd_content_no=${str}";
		        }
		    }
		</script>

 <div id="back">
	<br>
	<input type="button" value="목록으로" class="button"
		onclick="window.location='<%=request.getContextPath()%>/board/boardlist';">
<br><br>
</div>
	
	<table id="table2">
		<form name="updateformtag">
			<input type="hidden" name="bd_content_no"
				value="${boardread.bd_content_no }" id="bd_content_no"> <input
				type="hidden" name="user_no" value="5"
				id="user_no"> <input type="hidden" name="user_name"
				value="용휘쓰" id="user_name"> <input
				type="hidden" name="com_no" id="com_no">

			
			<tr colspan="2"  id="comtable"
		 style="border-radius: 10px;">
				<td><textarea class="form-control" placeholder="댓글을 남겨주세요" name="com_contents" maxlength="2048" id="inputA" readonly></textarea></td>
				<td id="commentbtn" style="border-left: none;">
					<input type="button" class="button" value="등록" id="insertinsert" onclick="commentInsertUpdate(0);"> 
					<input type="button" value="수정완료" id="updateupdate" onclick="commentInsertUpdate(1);">
				</td>
			</tr>

		</form>
	</table>




	<br>
	<div id="comments"></div>

	<script>
	function commentInsertUpdate(isUpdate) {
		url="<%=request.getContextPath()%>/commentwrite";
		if(isUpdate){
			url = "<%=request.getContextPath()%>/commentupdatectrl2";
		}
			
		updateformtag.action=url;
		updateformtag.method="post";
		updateformtag.submit();
	}
	
	
	var dd = "";
	var comcontentupdate="";
	let p = 1;
	var check 
	getComments();

	
	function getComments(){
		
		var url = "<%=request.getContextPath()%>/commentlist";	
		p = (p > 0) ? p : 1;
		$.ajax({
			url: url,
			type : "POST" ,   
			data : {
				bd_content_no : "${boardread.bd_content_no}",
				pageNum : p
			},
			
			dataType : "json",
			
			success:function(data){
			    p = data.currentPage;
				var htmltags=""
				var List = data.List;
				var userNickname = '${user.nickname}';
				
				$.each(List, function(i,list){
		               dd = List[i].com_no;
		               comcontentupdate = List[i].com_contents;
		               htmltags += "<table id='tablemargin'><tr class='nounderline'>"
		               htmltags += "<td><span>"+ List[i].com_writer + "</span></td>";
		               htmltags += "<td class='com2'id='com_con-"+dd+"'><span>"+ List[i].com_contents+ "</span></td>";
		               htmltags += "<td><span>"+ List[i].rv_date+ "</span></td>";
		               htmltags += "<td><input type='hidden' value='List[i].com_no'></td>"; 
		               if(List[i].com_writer==userNickname){
		                  htmltags += "<td class='right'><button class='comud' id='com_update-"+dd+"'>수정</button></td>"; 
		                  htmltags += "<td class='right'><button class='comud' id='com_delete-"+dd+"'>삭제</button></td>"; 
		               }
		               $("#comments").append(htmltags);
		               htmltags += "</tr></table>"; 
		               
		               
		            });
				
				$("#comments").html(htmltags);
				
				//var htmlpagingtags="";

				//if(data.startPage != 1) {
				//	var pre = data.startPage-1;
				//	htmlpagingtags += "<a href='commentlist?pageNum="+pre+"'>이전</a>";
				//}
				//for(var i=data.startPage; i<=data.endPage; i++){
				//	htmlpagingtags += "<a href='commentlist?pageNum="+i+"'>"+i+"</a>";
				//}
				//if(data.endPage < data.pageCnt ) {
				//	var pro = data.endPage+1;
				//	htmlpagingtags += "<a href='commentlist?pageNum="+pro+"'>이후</a>";
				//}
				//$("#page_content").html(htmlpagingtags);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }			
		 });
	}
	
	$(document).on("click","[id^=com_update-]",function(){
		var uId = this.id;
		var unum = uId.split("com_update-")[1];
		dd = unum;
		var cId = "com_con-"+dd;
		var rcId = "#"+ cId;
		var cval= $(rcId).text();
		var inputA=document.getElementById('inputA');
		inputA.value=cval;
		var com_no=document.getElementById('com_no');
		com_no.value=dd;
		
		$("#insertinsert").css('display','none');
		$("#updateupdate").css('display','inline-block');
	});

	$("#updateupdate").on("click",function(){
		
		$("#insertinsert").css('display','inline-block');
		$("#updateupdate").css('display','none');
	});
	
	$(document).on("click","[id^=com_delete-]",function(){
			var dId = this.id;
			var dnum = dId.split("com_delete-")[1];
	        if (!confirm("정말 삭제하시겠습니까?")) {//니요
	        	location.href="<%=request.getContextPath()%>/history.back()";
	        } else {//네
	        	location.href="<%=request.getContextPath()%>/commentdelete?com_no="+dnum;
							}
						});
	</script>
	</form>
	<br>

	<%
		}
	%>

</body>
</html>