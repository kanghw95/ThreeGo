<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="threego.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#textform{
maxlength : 2048;
height: 350px;
}
</style>
</head>
<body>
<%
	User user = (User) session.getAttribute("user");
		if (user == null) {
%>
로그인 후 이용하시길 바랍니다.
<a href="<%=request.getContextPath() %>/main">메인화면으로</a> 
<%
		} else {
%>


<h1>글읽기 </h1>
 	<c:if test="${boardread.bd_writer!=user.getUser_id()}">
	<input type="button" value="신고" onclick="window.location='<%=request.getContextPath()%>/boardlist1';">
	</c:if>
	
		<form action="<%=request.getContextPath()%>/boardupdate" method="post">
	
		<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no}">
		<input type="hidden" name="bd_subject" value="${boardread.bd_subject}">
		<input type="hidden" name="bd_writer" value="${boardread.bd_writer}">
		<input type="hidden" name="bd_content" value="${boardread.bd_content}">
		<input type="hidden" name="fullname" value="${file.fullname}">
		<input type="hidden" name="filepath" value="${file.filepath}">
		<input type="hidden" name="fullname" value="${file.contents_type}">
		

 <table border="1">
         <tr>
            <td><h3>제목</h3></td>
            <td>${boardread.bd_subject}</td>
         </tr>
         <tr>
            <td>작성자</td>
            <td>${boardread.bd_writer}</td>
         </tr>
         <tr>
            <td>작성날짜</td>
            <td>${boardread.bd_date}</td>
         </tr>

         <tr id="textform">
            <td>내용</td>
            <td>${boardread.bd_content}</td>
         </tr>

         <tr>
            <td>파일</td>
            <td id="filetd">
            
         	<c:forEach var="file" items="${files}">
            <img id="file" width="100" src="<%=request.getContextPath() %>${file.filepath }/${file.fullname}" alt="file" />
         	</c:forEach>            
         <br/>
            </td>
         </tr>
		<c:if test="${boardread.bd_writer!=user.getUser_id()}">
		<tr colspan="2">
			<td>
				<input type="submit" value="글수정">
				<input type="button" value="글삭제" onclick="test()">
			<td>
		</tr>
		</c:if>
			</tr>
		</table>
		</form>
		  
		<script>
		    function test() {
		        if (!confirm("정말 삭제하시겠습니까?")) {//니요
		        	location.href="<%=request.getContextPath()%>/history.back()";
		        } else {//네
		        	location.href="<%=request.getContextPath()%>/boarddelete?bd_content_no=${boardread.bd_content_no}";
		        }
		    }
		</script>
		
	
		<br>
		<input type="button" value="목록으로" onclick="window.location='<%=request.getContextPath() %>/boardlist1';"></td>
		<hr>
		<table border="1">
			<form action="<%=request.getContextPath()%>/commentwrite" method="post" >
			<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no }" id="bd_content_no">
			
			<h2>댓글 </h2>
				<tr colspan="2">
				<td><textarea class="form-control" placeholder="댓글작성하기" name ="com_contents" 
							maxlength="2048" style="height: 175px;"></textarea></td>
				<td><input type="submit" value="등록" onclick="window.location='<%=request.getContextPath()%>/WEB-INF//board/boardread.jsp';"> </td>
				</tr>
			</form>
		</table>
		
	
	
	
	<form action="<%=request.getContextPath() %>/commentlist" method="get"> 

	<div id="comments">
	
	</div>
	<script>
		    function commentdelete() {
		        if (!confirm("정말 삭제하시겠습니까?")) {//니요
		        	location.href="<%=request.getContextPath()%>/history.back();";
		        } else {//네
		        	location.href="<%=request.getContextPath()%>/commentdelete?bd_content_no=${boardread.bd_content_no}";
		        }
		    }
		</script>
		
	<script>
	let p = 1;
	getComments();
	// 로딩되면 일단 comment 일어오기
	function getComments(){
		console.log(p);
		p = (p > 0) ? p : 1;
		$.ajax({
			url: "<%=request.getContextPath()%>/commentlist",
			type : "POST" ,   // get방식을 쓰고..
			data : {
				bd_content_no : "${boardread.bd_content_no}",
				pageNum : p
				// ${pageNum} 없네요. 임시로 1
				// 여기 ajax 로 가는게 더 좋아 보임.
			},
			
			dataType : "json",
			
			success:function(data){
			      console.log("됐다!!!");
			         console.log('[ejkim] data:'+ data);
			         console.log('[ejkim] data.pageCnt: '+ data.pageCnt);
			         console.log('[ejkim] data.startPage: '+ data.startPage);
			         console.log('[ejkim] data.endPage: '+ data.endPage);
			         console.log('[ejkim] data.currentPage: '+ data.currentPage);
			         p = data.currentPage;

				console.log(data);
				var htmltags=""
				var List = data.List;
				$.each(List, function(i,list){
					console.log('[ejkim]List[i].com_writer: '+ List[i].com_writer);
					console.log('[ejkim]List[i].com_writer: '+ List[i].com_contents);
					console.log('[ejkim]List[i].com_writer: '+ List[i].rv_date);
					//htmltags += "<div><span>"+ e.com_no + " </span>";
					//htmltags += "<span>"+ e.bd_content_no + "</span>";
					//htmltags += "<span>"+ e.user_no + "</span>";
					htmltags += "<span>"+ List[i].com_writer + " </span>";
					htmltags += "<span>"+ List[i].com_contents+ " </span>";
					htmltags += "<span>"+ List[i].rv_date+ " </span></div><br>"; 
					//htmltags += "<span>"+ e.com_ref+ " </span>"; 
					//htmltags += "<span>"+ e.com_re_step+ " </span>"; 
					//htmltags += "<span>"+ e.com_re_level+ " </span>"; 
					$("#comments").append(htmltags);
				});
				if(htmltags==""){
					htmltags += "<div> 댓글이 없습니다. </div>";
				}
				$("#comments").html(htmltags);
				
				var htmlpagingtags="";
				if(data.startPage != 1) {
					var pre = data.startPage-1;
					htmlpagingtags += "<a href='commentlist?pageNum="+pre+"'>이전</a>";
				}
				for(var i=data.startPage; i<=data.endPage; i++){
					htmlpagingtags += "<a href='commentlist?pageNum="+i+"'>"+i+"</a>";
				}
				if(data.endPage < data.pageCnt ) {
					var pro = data.endPage+1;
					htmlpagingtags += "<a href='commentlist?pageNum="+pro+"'>이후</a>";
				}
				$("#page_content").html(htmlpagingtags);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }			
		 });
	}
	</script>
	</form>
	
	<br>
	<div id="page_content">
	</div>



	
<%
}
%>


</body>
</html>