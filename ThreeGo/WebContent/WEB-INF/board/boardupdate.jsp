<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#textform {
   maxlength: 2048;
   height: 350px;
}

img{
width:200px;
height:200px;
}

</style>


<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

//div비우기


//이미지 미리보여주기 기능

function setThumbnail(event) {
    $('#image_container').empty();
   for (var image of event.target.files) {
   var reader = new FileReader();
   reader.onload = function(event) { 
      var img = document.createElement("img");  //이미지 요소 생성
      var br = document.createElement("br");  //br 요소 생성
      img.setAttribute("src", event.target.result); 
      
      document.querySelector("div#image_container").appendChild(br);
      document.querySelector("div#image_container").appendChild(img);

      }; 
      reader.readAsDataURL(image); 
      }
}


//삭제기능
function fReset() {
$("#image_container").empty();
$("#fileupload").val("");
}
  
  
function update_content(){  
      frm_update.action="<%=request.getContextPath()%>/boardupdate2";
      frm_update.method="post";
      frm_update.submit();
}

var str = '${files}';
str = str.replaceAll('"' , "'");
$("#files").val(str);
</script>

</head>




<body>

<hr>

   <h1>글수정</h1>

<form name="frm_update" enctype="multipart/form-data">
      <input type="hidden" name="bd_content_no" value="${bd_content_no}">
      <input type="hidden" name="beforefile" value="${files}">
       

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
                          
                    
               <!--삭제 @@   미리보기 이미지 출력  , 첨부파일 이름-->
               <input id="reset" type="button"  value="삭제"  onclick="fReset(event);" >
                <br>     

               <!-- 미리보기 이미지 출력  -->
               <div id="image_container">
                  ${files } 
                  
                  
                  
                  
                  
                  
<script type="text/javascript">

               var list = $.parseJSON('${files }');
               
                var jsonData = JSON.parse('${files }');
                
                //이미지 출력
                      $('#image_container').empty();
               for(var l of list){
                     //for (var image of event.target.files) {
                     //var reader = new FileReader();
                     //reader.onload = function(event) { 
                       var br = document.createElement("br");  //br 요소 생성
                        var img = document.createElement("img");  //이미지 요소 생성
                        var imgpath = "<%=request.getContextPath() %>" + l.filepath + "/" + l.fullname;
                        img.setAttribute("src", imgpath); 
                        
                        document.querySelector("div#image_container").appendChild(br);
                        document.querySelector("div#image_container").appendChild(img);
                        //}; 
                        
                        //reader.readAsDataURL(img); 
                        
                  //}
                  
               }
               
               
</script>
      
               </div> 
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