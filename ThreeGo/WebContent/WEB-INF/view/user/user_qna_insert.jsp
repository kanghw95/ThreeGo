<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="threego.model.vo.User"%>
<%
	User user = (User) session.getAttribute("user");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#subjectDiv {
clear: both;
	/* margin-bottom: 10px; */
	width: 400;
	box-sizing: border-box;
	height: 40;
	outline: none;
	border-top: 1px solid #66612D;
	border-bottom: 1px solid #66612D;
}



#contentDiv {
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


p {
   margin-top: 10;
   float: left;
   font-size: 20px;
   font-weight: bold;
}



#writebtn {
	margin-left:137;
	margin-top: 50;
	background-color: white;
	background: #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
	padding: 4 7 4 7;

}

#listbtn {
	margin-left:5;	
	padding: 1 4 1 4;
	background-color: white;
	border: 3px solid #E0DEC3;
	border-radius: 12px;
	cursor: pointer;
	
}



button {
   background-color: white;
   border: 0;
}

placeholder {
   font-size: 15px;
}

#que1{
border: none;
margin-top: 20;
	margin-bottom: 10;
	float: left;
	clear: both;
	font-size: 20px;
	font-weight: bold;
	color: #66612D;
}
#que2{
border: none;
margin-top: 20;
	margin-bottom: 10;
	float: left;
	clear: both;
	font-size: 18px;
	color: #66612D;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 0 50 0 50">
		
		
<span  id="que1">문의사항</span>
   <form action="<%=request.getContextPath()%>/userqnainsert" method="post" >
		<input type="hidden" value="<%=user.getUser_no() %>" name="user_no">
           	<span id="que2">
                       문의항목:
				<select id="select" name="select">
					<option value="계정">계정</option>
					<option value="채팅">채팅</option>
					<option value="게시판">게시판</option>
					<option value="쉐어링">쉐어링</option>
					<option value="기타">기타</option>
				</select>
			</span>
		
		
			<div id="subjectDiv">
            <input type="text"
               style="border: none; width: 390"
               placeholder="문의사항 제목"
               name="qna_subject">
         	</div>
		
			<div id="contentDiv" border=1px>
            <textarea class="textarea" placeholder="내용을 입력해 주세요" name="qna_content"></textarea>
         	</div>
         	
         	비밀번호 : <input  type="text" name="pwd"  style="border-radius:12px ; margin-top: 10;  height: 25px; border:1px solid #66612D;" 
         	 placeholder="답변확인시 비밀번호"  >
         
            <button  type="submit"  id="writebtn">문의하기</button>
            <!-- <input  type="submit"  id="writebtn" value="문의"/> -->
            <button type="button"  id="listbtn" onclick="window.location='<%=request.getContextPath()%>/main';">메인으로</button>
      
 
   </form>
   </div>
</body>
</html>