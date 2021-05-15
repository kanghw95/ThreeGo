<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(function(){
   $("#filecancel").click(function(){

      $("#fileupload").val("");
   //   alert("첨부파일 취소");
      })
})

</script>

</head>
<body>
<c:if test="${msg == '글 등록 성공' }">
		<script>
			alert("${msg}");
			location.href = "boardlist1";
		</script>
	</c:if>
	<c:if test="${msg == '글 등록 실패' }">
		<script>
			alert("${msg}");
		</script>
	</c:if>


   <h1>글쓰기</h1>
   <form action="<%=request.getContextPath()%>/boardWrite"
      method="post" enctype="multipart/form-data">


      <table border="1">
         <tr>
            <td>제목</td>
            <td><input type="text" name="bd_subject"></td>
         </tr>
         <tr>
            <td>닉네임</td>
            <td><input type="text" name="bd_writer" value="로그인 " readonly ></td>
         </tr>
         <tr>
            <td>파일첨부</td>
         <td> 
            <input type="file" id="fileupload" name="uploads" multiple accept="image/*">
             <input type="button" id ="filecancel" value=삭제 >
            
            </td>
         </tr>
         <tr>
            <td>내용</td>
            <td><textarea class="form-control" placeholder="글 내용"
                  name="bd_content" maxlength="2048" style="height: 350px;"></textarea></td>
         </tr>

         
         <tr>
            <td colspan="2"><input type="submit" value="글등록"> 
            </td>
         </tr>
      </table>
            <input type="button" value="글목록"
               onclick="window.location='<%=request.getContextPath()%>/boardlist1';">

   </form>
</body>
</html>