<%@page import="threego.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글 조회</title>
</head>
<body>
<%User user = (User) session.getAttribute("user"); %>
	<h2>작성 댓글 조회 페이지입니다.</h2>

		<form action="<%=request.getContextPath() %>/commentlist" method="get"> 

	<div id="comments">
	
	</div>
		
	<script>
	let p = 1;
	getComments();
	// 로딩되면 일단 comment 일어오기
	function getComments(){
		console.log(p);
		p = (p > 0) ? p : 1;
		$.ajax({
			url: "<%=request.getContextPath()%>/usermycomment",
			type : "POST" ,   // get방식을 쓰고..
			data : {
				user_no : <%=user.getUser_no()%>,
				pageNum : p
				// ${pageNum} 없네요. 임시로 1
				// 여기 ajax 로 가는게 더 좋아 보임.
			},
			
			dataType : "json",
			
			success:function(data){
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
	
	
	
</body>
</html>