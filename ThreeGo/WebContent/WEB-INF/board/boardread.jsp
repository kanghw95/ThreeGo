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
	<input type="button" value="신고" onclick="window.location='<%=request.getContextPath()%>/boardlist';">
	</c:if>
	
		<form action="<%=request.getContextPath()%>/boardupdate" method="post">
	
		<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no}">
		<input type="hidden" name="bd_subject" value="${boardread.bd_subject}">
		<input type="hidden" name="bd_writer" value="${boardread.bd_writer}">
		<input type="hidden" name="bd_content" value="${boardread.bd_content}">
		<input type="hidden" name="fullname" value="${file.fullname}">
		<input type="hidden" name="filepath" value="${file.filepath}">

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
            
         	<c:forEach var="file" items="${files }">
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
		        	location.href="<%=request.getContextPath()%>/boardlist";
		        } else {//네
		        	location.href="<%=request.getContextPath()%>/boarddelete?bd_content_no=${boardread.bd_content_no}";
		        }
		    }
		</script>
		
	
		<br>
		<input type="button" value="목록으로" onclick="window.location='<%=request.getContextPath() %>/boardlist';"></td>
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
	<!-- action="/commentlist.do" method="get" 쓰지 말고.. 
	-->
	<input type="search" name="search" value="${search}" id="search">
	<button type="button" id="btnSearch">검색</button> 
	
	</form>
	
	<div id="comments"></div>
<script>
	console.log('${boardread.bd_content_no}');
	//console.log('${JSON.currentPage}');
	let searchWord = "";
	getComments();  // 로딩되면 일단 comment 일어오기
	$("#btnSearch").click(function(){
		searchWord=$("#search").val();
		getComments();
	});// 찾기 눌러도 아래 comment 가지러 갔다오기
	function getComments(){
		$.ajax({
			url: "<%=request.getContextPath()%>/commentlist",
			type : "GET" ,   // get방식을 쓰고..
			data : {
				bd_content_no : "${boardread.bd_content_no}",
				pageNum : "1"  
				// ${pageNum} 없네요. 임시로 1
				, search: searchWord  // 여기 ajax 로 가는게 더 좋아 보임.
			},
			
			dataType : "json",
			success:function(data){
				console.log(data);
				var htmltags=""
				
				$.each(data, function( index, e ){
					htmltags += "<div><span>"+ e.com_no + " </span>";
					htmltags += "<span>"+ e.bd_content_no + "</span>";
					htmltags += "<span>"+ e.user_no + "</span>";
					htmltags += "<span>"+ e.com_writer + " </span>";
					htmltags += "<span>"+ e.com_contents+ " </span>";
					htmltags += "<span>"+ e.rv_date+ " </span>"; 
					htmltags += "<span>"+ e.com_ref+ " </span>"; 
					htmltags += "<span>"+ e.com_re_step+ " </span>"; 
					htmltags += "<span>"+ e.com_re_level+ " </span>"; 
				});       
				if(htmltags==""){
					htmltags += "<div> 댓글이 없습니다. </div>";
				}
				//if(htmltags!=""){
					// ???
					// 요정도~~ 됐나요?  아래 page 만들든.. 암만들든.. 잠시만요
					//htmltags += "<div> e.com_writer</div> ";
					//htmltags += "<div> e.rv_date</div> ";
					//htmltags += "<div> e.com_contents</div> ";
				//}
				$("#comments").html(htmltags);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }			
		 });
	}
	</script>
	<!-- 
	<br>
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/commentlist?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage}" end="${endPage}" var="s" step="1">
		<a href="<%=request.getContextPath() %>/commentlist?pageNum=${s}&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/boardlist?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
-->

	
<%
}
%>


</body>
</html>