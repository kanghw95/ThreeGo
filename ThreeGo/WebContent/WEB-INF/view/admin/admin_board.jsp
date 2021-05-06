<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
function park(board){
	var boardmenu = board.val();
	location.href = '<%=request.getContextPath()%>/adminboard?menu='+boardmenu ;
};
</script>
</head>
<body>
	<!-- TODO..값에 들어 가야 함. -->
	<input type="hidden" name="park" value="park" id="park" class="board">
	<input type="hidden" name="park" value="sharing" id="sharing" class="board">
	<input type="hidden" name="park" value="drive" id="drive" class="board">
	<input type="hidden" name="park" value="free" id="free" class="board">
	<input type="hidden" name="park" value="pride" id="pride" class="board">
	
	<h1><input type="button" onclick="park($('#park'));" value="주차장평가"></h1>
	<h1><input type="button" onclick="park($('#sharing'));" value="주차권쉐어링"></h1>
	<h1><input type="button" onclick="park($('#drive'));" value="드라이브코스"></h1>
	<h1><input type="button" onclick="park($('#free'));" value="자유게시판"></h1>
	<h1><input type="button" onclick="park($('#pride'));" value="자랑게시판"></h1>
</body>
</html>