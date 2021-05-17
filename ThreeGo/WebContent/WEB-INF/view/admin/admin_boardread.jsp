<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css" type="text/css">
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
.button{
	boarder:0px;
	outline:0px;
	
}
#textform {
	maxlength: 2048;
	width: 400px;
	height: 250px;
}
#inputA{
	width: 400px;
	height: 100px
}

#updateupdate {
	display: none;
}
#subject{
font-size:26px;
}
#writer{
font-size : 13px
}
#bthchat{
font-size : 11px
}
#date{
font-size : 12px
}
#commentbtn{
font-size : 13px
background-color : none;
}
</style>
</head>
<body>

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


		<table width="400">
			<tr>
				<td id="subject">${boardread.bd_subject}</td>
			</tr>
			<tr>
				<td id="writer">
				${boardread.bd_writer} 
				&emsp;
				<input type="button" id="bthchat" name="btnchat" value="1:1채팅" onclick="location.href='<%=request.getContextPath() %>/main/user/chat'">
				</td>
			</tr>
			<tr>
				<td id="date">${boardread.bd_date}</td>
			</tr>
		
<hr>
			<tr>
			<td id="textform" colspan="2">
				${boardread.bd_content}<br>
				<c:forEach var="file" items="${files}">
						<img id="file" width="150" height="150" src="<%=request.getContextPath() %>${file.filepath }/${file.fullname}" alt="file" />
				</c:forEach>
			</tr>
			<tr>
			<td>
			<br>
			</td>
			</tr>
			<tr>
			<td>	
					<input type="button" value="글삭제" onclick="test()">
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


	<br>
	<input type="button" value="목록으로"
		onclick="window.location='<%=request.getContextPath()%>/board/boardlist';">
	</td>
	<hr>
	<br><br><br>
	<table border="1">
		<form name="updateformtag">
			<input type="hidden" name="bd_content_no"
				value="${boardread.bd_content_no }" id="bd_content_no"> <input
				type="hidden" name="user_no" value="5"
				id="user_no"> <input type="hidden" name="user_name"
				value="용휘쓰" id="user_name"> <input
				type="hidden" name="com_no" id="com_no">

			
			<tr colspan="2">
				<td><textarea class="form-control" placeholder="댓글을 남겨주세요" name="com_contents" maxlength="2048" id="inputA" readonly></textarea></td>
				<td id="commentbtn">
					<input type="button" value="등록" id="insertinsert" onclick="commentInsertUpdate(0);"> 
					<input type="button" value="수정완료" id="updateupdate" onclick="commentInsertUpdate(1);">
				</td>
			</tr>

		</form>
	</table>




	
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
					htmltags += "<span><div>"+ List[i].com_writer + " </span>";
					htmltags += "<span id='com_con-"+dd+"'>"+ List[i].com_contents+ " </span>";
					htmltags += "<span>"+ List[i].rv_date+ " </span>";
					htmltags += "<span><input type='hidden' value='List[i].com_no'></span>"; 
					
					if(List[i].com_writer==userNickname){
						htmltags += "<span><button id='com_update-"+dd+"'>수정</button></span>"; 
						htmltags += "<span><button id='com_delete-"+dd+"'>삭제</button></div></span>"; 
					}
					$("#comments").append(htmltags);
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