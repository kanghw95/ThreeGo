<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 돋보기 같은 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script>
	function qnacheck(no,sub,con,answer){
		console.log(no,sub,con,answer);
		var sql = "no="+no+"&sub="+sub+"&con="+con+"&answer="+answer;
		$.ajax({
			type : "post"
			,url : "<%=request.getContextPath() %>"
			,data : sql
			
		});
	};
/*	
	$(function(){ 
		<c:forEach items="${list }" var="i" >
    	 $(".btnc${i.qna_no }").hover(function(e1){
    		$(".sub").css("display","none");
     	  	$(".sub${i.qna_no }").css("display","block");

     	  	console.log(e1.clientX);
     	  	console.log(e1.clientY);
     		})
     	</c:forEach>
    	 $(!".btnc").hover(function(){
    		 $(".sub").css("display","none");
    	 })
	 });
*/	
	
</script>
    <style>
    	body{
    		text-align: center;
    		font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
    	}

        .btnc{
            background-color: white;
            border : 0;
            outline: 0;
            cursor: pointer;
            white-space:nowrap;  
			text-overflow:ellipsis; 
			overflow:hidden;
			width: 200px;
			text-align: left;
        }
         .btnc:hover{
            color: purple;
            text-decoration: underline;
        }
        .ans{
        	width: 85px;
        	text-align: center;
        }
        .ansbtn{
        	text-align: center;
        	
        }
		.mainTable{
			width : 415px;
			table-layout:fixed;
			margin-left:auto; 
    		margin-right:auto;
    		border-collapse : collapse;
    		
		}
		.subTable{
			margin-left:auto; 
    		margin-right:auto;
    		border-collapse : collapse;
		}
		.mainTable td{
			white-space:nowrap;  
			text-overflow:ellipsis; 
			overflow:hidden;
		}
        .no{
        	width: 30px;
        }
        .subj{
        	width: 200px;
        }
        .writer{
        	width: 100px;
        }
        tr{
        	border-bottom:1px solid aquamarine;
       		height: 25px;
        }
		table * tr:first-child{
			background-color: aquamarine;
	        font-weight:bold;
	        text-align:center;
		}
        .minisearch{
			width: 150px;
			height: 20px;
			
		}
		.minisearchbtn{
			width: 20px;
			height: 20px;
			background: aquamarine;
		}
		.sub{
			display: none;
			position: relative;
			width: 500px;
			overflow: visible;
			text-overflow: clip;
		}


		

    </style>
<body>

<div style="position: relative;">
<input type="hidden" name ="list" value="${list }">
<h1>문의사항</h1>
<hr>
	<form action="<%=request.getContextPath() %>/userqna" method="get">
		<input type="search" class="minisearch" name="search" value="${search}">
		<button type="submit" class="minisearchbtn"><i class="fas fa-search fa-lg"></i></button>
	</form>
<h2>자주묻는질문</h2>
	<c:if test="${ empty list }">
		<p>게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	
		<table  class="table subTable">
			<tr>
				<th class="no">No</th>
				<th class="subj">제목</th>

			</tr>
		 	<c:forEach items="${list3 }" var="i" >
				<tr>
					<td>${i.faq_no }</td>
					<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
					<td>
						<input type="submit" class="btnc" value="${i.faq_subject }">
						<input type="hidden" value="${i.faq_no }" name="no">
						<input type="hidden" value="${i.faq_subject }" name="sub">
						<input type="hidden" value="${i.faq_content }" name="con">
						<input type="hidden" value="${i.admin_number }" name="a_num">
					</td>
					</form>
				</tr>
			</c:forEach>
		</table>
		<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
			<input type="submit" value="글쓰기">
			<input type="hidden" value="5" name="a_num">			
		</form>
</c:if>

<h2>QNA</h2>
	<c:if test="${ empty list }">
		<p>게시글이 없습니다.</p>
	</c:if>
	<c:if test="${not empty list }">
	
		<table  class="table mainTable">
			<tr>
				<th class="no">No</th>
				<th class="subj">제목</th>
				<th class="writer">작성자</th>
				<th class="ans">답변하기</th>

			</tr>
		 	<c:forEach items="${list }" var="i" >
			<tr>
				<td>${i.qna_no }</td>

				<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
					<td>
						<input type="submit" class="btnc btnc${i.qna_no }" value="${i.qna_subject }">
						<input type="hidden" value="${i.qna_no }" name="no">
						<input type="text" value="${i.qna_subject }" name="sub" class="sub sub${i.qna_no }">
						<input type="hidden" value="${i.qna_content }" name="con">
						<input type="hidden" value="${i.a_content }" name="a_con">
						<input type="hidden" value="${i.qna_kind }" name="kind">
						<c:forEach items="${list2 }" var="j">
							<c:if test="${i.qna_no == j.qna_no }">
								<input type="hidden" value="${j.nickname }" name="nickname">
							</c:if>
						</c:forEach>
					</td>
				</form>
				<c:forEach items="${list2 }" var="j">
				<c:if test="${i.qna_no == j.qna_no }">
					<td class="writer">${j.nickname }</td>
				</c:if>
				</c:forEach>
				<c:forEach items="${list2 }" var="j">
					<c:if test="${i.qna_no == j.qna_no && j.a_content !=null}">
						<td class="ans">완료</td>
					</c:if>
					
					<c:if test="${i.qna_no == j.qna_no && j.a_content ==null}">
						<td class="ansbtn">
							<form method="post" action="<%=request.getContextPath()%>/adminqnaanswer">
								<input type="submit" value="답변하기" >
								<input type="hidden" value="${i.qna_no }" name="no">
								<input type="hidden" value="${i.qna_subject }" name="sub">
								<input type="hidden" value="${i.qna_content }" name="con">
								<c:forEach items="${list2 }" var="j">
									<c:if test="${i.qna_no == j.qna_no }">
										<input type="hidden" value="${j.nickname }" name="nickname">
									</c:if>
								</c:forEach>								
							</form>
						</td>
					</c:if>
				</c:forEach>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${startPage-1}&search=${search}">이전</a> 
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${s }&search=${search}">${s }</a> 
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/adminctrl?pageNum=${endPage+1}&search=${search}">다음</a>
	</c:if>
	
	<br>
	<input type="button" value="메인화면" onclick="location.href='<%=request.getContextPath()%>/admin/adminmain';">
	<c:if test="${not empty search}">
		<input type="button" value="전체글목록" onclick="window.location='<%=request.getContextPath()%>/userqna';">
	</c:if>
	</div>
</body>
</html>