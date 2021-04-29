<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	function checkValues() {
		if(document.getElementById("grade").value.length>2){
			alert("등급은 2자리 문자만 허용합니다.")
			return false;
		}
		// 유효성 검사를 쭈욱~~
		// return false;
		
		return true;
	}
	function checkId(){
		$.ajax( { 
			type : "POST"
			,url : "<%=request.getContextPath()%>/memberajax"
			,data : {
				 id : $("#idd").val()
				 } 
			,success : function( d1 ) {
				console.log(d1);
				alert(d1);

			}
			,error : function(e){
				alert(e.responseText);
			}
		} );
		
	}
</script>
</head>
<body>
<%= request.getContextPath() %>

	<form action="<%=request.getContextPath() %>/minsert" method="post">
		아이디: <input type="text" name="id" id="idd"/> <input type="button" value="중복확인" onclick ="return checkId();"> <br>
		패스워드: <input type="password" name="passwd"/> <br>
		이름: <input type="text" name="name"/> <br>
		이메일: <input type="text" name="email"/> <br>
		등급: <input type="text" name="grade" id="grade"/> <br>
		성별: 남<input type="radio" name="gender" value="m"/> &nbsp;&nbsp;&nbsp; 여<input type="radio" name="gender" value="f"/> <br>
		<input type="submit" onclick ="return checkValues();">
	</form>

</body>
</html>