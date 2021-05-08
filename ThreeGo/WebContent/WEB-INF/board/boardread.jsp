<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h1>글읽기 </h1>
	<input type="button" value="신고" onclick="window.location='<%=request.getContextPath() %>"> <!-- 신고페이지 -->


	<form action="<%=request.getContextPath()%>/WEB-INF/board/boardwrite.jsp" method="post">
		<input type="hidden" name="bd_content_no" value="${boardread.bd_content_no}">

		<table border="1">
			<tr>
				<td><h3>제목</h3></td>
				<td>${boardread.bd_subject}</td>
			</tr>
			<tr >
				<td>작성자</td>
				<td>${boardread.bd_writer}</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${boardread.bd_date}</td>
			</tr>
			<tr id="textform" >
				<td>내용</td>
				<td>${boardread.bd_content}</td>
			</tr>
			<tr colspan="2">
			<td>
				<input type=button value="글수정" onclick="window.location='<%=request.getContextPath()%>/boardupdate';">
				<input type="button" value="글삭제" onclick="window.location='<%=request.getContextPath()%>/WEB-INF/board/boarddelete.jsp';">
			</td>
			</tr>
		</table>
		</form>

		
		
		<hr>
		<table border="1">
			<form action="<%=request.getContextPath()%>/commentwrite" method="post" >
			<input type="text" name="bd_content_no" value="${boardread.bd_content_no }" id="bd_content_no">
			
			<h2>댓글 </h2>
				<tr colspan="2">
				<td><textarea class="form-control" placeholder="댓글작성하기" name ="com_contents" 
							maxlength="2048" style="height: 175px;"></textarea></td>
				<td><input type="submit" value="등록" onclick="window.location='<%=request.getContextPath()%>/WEB-INF//board/boardread.jsp';"> </td>
				</tr>
			</form>
		</table>
		

		
	<form action="<%=request.getContextPath() %>/commentlist" method="get">
	<!-- action="/commentlist.do" method="get" 쓰지 말고.. -->
	<input type="search" name="search" value="${search}" id="search">
	<button type="button" id="btnSearch">검색</button> 
	</form>
	<div id="comments"></div>
	<!--<c:if test="${not empty search}">
		<strong>${search}</strong>에 대한 검색 결과입니다.
	</c:if>
	<c:if test="${empty commentList}">
		댓글이 없습니다.
	</c:if>
	<c:if test="${not empty commentList}">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td>${commentread.com_writer}</td>
			</tr>
			<tr>	
				<td>작성일</td>
				<td>${commentread.rv_date}</td>
			</tr>
			<tr>
				<td>댓글내용</td>
				<td>${commentread.com_contents}</td>
			</tr>
		</table>
	</c:if>
	-->
	<br>
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/commentlist?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage}" end="${endPage}" var="s" step="1">
		<a href="<%=request.getContextPath() %>/commentlist?pageNum=${s }&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt}">
		<a href="<%=request.getContextPath() %>/commentlist?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	<br>
		<input type="button" value="메인화면" onclick="window.location='<%=request.getContextPath() %>/boardlist?search=${param.search}';"></td>
	

<script>
	console.log('${boardread.bd_content_no}');
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
				if($("#search").val()!=""){
					//htmltags += "<div><strong>${search}</strong>에 대한 검색 결과입니다.</div>";
				}
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

</body>
</html>