<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body style="font-family:'서울남산 장체 L', sans-serif;">
 <h1>댓글수정</h1>
<form name="frm_update" >
      <input type="hidden" name="com_no" value="${com_no}">
       

      <table border="1">
         <tr>
            <td><h3>제목</h3></td>
            <td><textarea name="bd_subject" id="bd_subject">${bd_subject }</textarea></td>
         </tr>
         <tr id="textform">
            <td>내용</td>
            <td>
               <!-- 이미지 미리보기 기능 구현 --> 
               
               <!-- 파일 첨부  -->
               <input type="file" id="fileupload"
               name="uploads" multiple accept="image/*"
               onchange="setThumbnail(event);">
                          
                         

               <!-- 미리보기 이미지 출력  -->
               <div id="image_container">
                  ${files }
                  
                  
                  
                  
                  
<script type="text/javascript">
               //var files= '${files }';
               var list = $.parseJSON('${files }');
               
                var jsonData = JSON.parse('${files }');
                
                //이미지 출력
                      $('#image_container').empty();
               for(var l of list){
                     //for (var image of event.target.files) {
                     //var reader = new FileReader();
                     //reader.onload = function(event) { 
                        var img = document.createElement("img");  //이미지 요소 생성
                        var imgpath = "<%=request.getContextPath() %>" + l.filepath + "/" + l.fullname;
                        img.setAttribute("src", imgpath); 
                        document.querySelector("div#image_container").appendChild(img);
                        //}; 
                        //reader.readAsDataURL(img); 
                        
                  //}
                  
               }
               
               
</script>
<%--                     <c:forEach var="file" items="${files }">
                          <img id="file" width="100" src="<%=request.getContextPath() %>${file.filepath }/${file.fullname}" alt="file" />
                          </c:forEach>>    --%>            
               </div> 
               
               
               <!--삭제 @@   미리보기 이미지 출력  , 첨부파일 이름-->
               <input id="reset" type="button"  value="삭제"  onclick="fReset(event);" >
                <br>
                  
                  
                <textarea name="bd_content" id="bd_content">${bd_content}</textarea>
            </td>
         </tr>
         <tr>
            <td colspan="2"><input type="button" onclick="update_content();" value="수정 완료"> 
            <input
               type="button" value="글목록"
               onclick="window.location='<%=request.getContextPath()%>/boardlist';">
            </td>
         </tr>
      </table>
</form>

</body>
</html>