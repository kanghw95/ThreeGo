
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#image_container img {
   width: 250px;
   height: 150px;
  display: flex;
  margin-left: 80;

}



#subjectDiv {
	clear: both;
	margin-bottom: 10px;
	width: 400;
	box-sizing: border-box;
	height: 40;
	outline: none;
	border-top: 1px solid #66612D;
	border-bottom: 1px solid #66612D;
}

#fileDiv {
   margin-bottom: 5;
   overflow: hidden;

}

#contentDiv {
	border-top: 1px solid #66612D;
	border-bottom: 1px solid #66612D;
	margin-top: 0;
}

textarea {
	border-color: white;
	maxlength: "2048";
	resize: none;
	outline: none;
	width: 380px;
	height: 320;
	margin-top: 30;
	margin-left: 15;
	margin-right: 0;
	maxlength: "2048";
	font-size: 17px;
	padding: 0;
}

input {
 padding: 10;
	outline: none;
}

#filecancel {
   float: right;
   padding: 1 3 1 3;
   margin: 1;
}

#fileupload {
   float: left;
   outline: none;
   margin: 1;
}

p {
   margin-top: 10;
   margin-bottom:10;
   float: left;
   font-size: 20px;
   font-weight: bold;
}

span {
margin-top: 20;
	margin-bottom: 10;
	float: left;
	clear: both;
	font-size: 20px;
	font-weight: bold;
	color: #66612D;
}

#writebtn{
	font-size:13;
	float: right;
	margin-top: 15;
	margin-bottom: 5;
	border: none;
	background-color: white;
	background: #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
	padding: 5 18 5 18;
}

#listbtn {
	float: right;
	margin-top: 5;
	padding: 1 4 1 4;
	background-color: white;
	border: 3px solid #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
}

#icon {
	border: none;
	width: 30;
	height: 30;
	margin: 5;
}


button {
   background-color: white;
   border: 0;
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
<div style="margin: 0 50 0 50; width=400;">
      <form name="frm_update" enctype="multipart/form-data" style="width:400">
      <input type="hidden" name="bd_content_no" value="${bd_content_no}">
      <input type="hidden" name="beforefile" value="${files}"> 
      <input type="button" style="" id="writebtn" onclick="update_content();" value="수정">


         <div id="subjectDiv">
            <input type="text" style="border: none;"
               name="bd_subject" id="bd_subject" value="${bd_subject }">
         </div>


         <!-- 파일 첨부  -->
         <div id="fileDiv" >
            <input type="file" id="fileupload" name="uploads" multiple
               accept="image/*" onchange="setThumbnail(event);">

            <!--삭제 @@   미리보기 이미지 출력  , 첨부파일 이름-->
            <button class="button" type="button" id="filecancel" onclick="fReset(event);">
              <img id="icon" src="<%=request.getContextPath()%>/img/x-mark (5).png">
            </button>
         </div>

         <div id="contentDiv" border=1px>
          <textarea name="bd_content" id="bd_content">${bd_content}</textarea>
            <br>
         
            <!-- 미리보기 이미지 출력  -->
            <div id="image_container" >
               ${files }
	<script type="text/javascript">

               var list = $.parseJSON('${files }');
               
                var jsonData = JSON.parse('${files }');

                
                //이미지 출력
                      $('#image_container').empty();
              		 for(var l of list){
               
                       var br = document.createElement("br");  //br 요소 생성
                        var img = document.createElement("img");  //이미지 요소 생성
                        var imgpath = "<%=request.getContextPath()%>" + l.filepath + "/" + l.fullname;
                        img.setAttribute("src", imgpath); 
                        
                        document.querySelector("div#image_container").appendChild(br);
                        document.querySelector("div#image_container").appendChild(img);
               }
</script>


             


              
            </div>
            </div>


            <input id="listbtn" type="button" value="목록으로"
               onclick="history.back()">
      </form>

   </div>
</body>
</html>