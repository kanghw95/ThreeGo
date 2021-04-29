<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btn").click(function() {

		// 유효성 체크 이후 submit
	$.ajax({
		url :"pizzactrl"
		,type : "post"
		,data :{
			id : $("#id").val()
			,passwd : $("#passwd").val()
		}
		,dataType : "json"
		,success : function (d1){
			console.log(d1);
			console.log(d1.name);
			console.log(d1.result);
			if(d1.result =="ok"){
				var v1= "'<%=request.getContextPath()%>/logout'";
				var text = '<h3>환영합니다,'+d1.name+'님!</h3>'
				+ '<p>${member.id} 님! <span>등급 : ${member.grade} </span> </p>'
				+ '<button type="button" onclick="#">회원정보보기</button>'
		
				+ '<button type="button" id="btnLogout" onclick="location.href='+v1+';">로그아웃</button>';
				$(".box").html(text);
			}
		}
		,error : function (error){
			alert(error);
		}
		
	});
		
		
		//frm.action = "login";
		// frm.method = "post";
		// frm.submit(); 
	});

	
</script>

</head>
<body>
	<table border="1">
	<tr>
		<td>종류</td>
		<td>이름</td>
		<td>가격</td>
		<td rowspan="12">&nbsp;</td>
		<td>종류</td>
		<td>이름</td>
		<td>가격</td>
	</tr>
	<tr>
		<td rowspan="5">피자</td>
		<td>치즈피자</td>
		<td>5000</td>
		<td rowspan="11">사이드</td>
		<td>오븐구이통닭</td>
		<td>9000</td>
	</tr>
	<tr>
		<td>콤비네이션피자</td>
		<td>6000</td>
		<td>치즈스틱&윙</td>
		<td>4900</td>
	</tr>
	<tr>
		<td>포테이토피자</td>
		<td>7000</td>
		<td>치즈오븐스파게티</td>
		<td>4000</td>
	</tr>
	<tr>
		<td>고구마피자</td>
		<td>7000</td>
		<td>새우링&웨지감자</td>
		<td>3500</td>
	</tr>
	<tr>
		<td>불고기피자</td>
		<td>8000</td>
		<td>갈릭포테이토</td>
		<td>3000</td>
	</tr>
	<tr>
		<td rowspan="6">토핑</td>
		<td>고구마무스</td>
		<td>1500</td>
		<td>콜라</td>
		<td>1500</td>
	</tr>
	<tr>
		<td>콘크림무스</td>
		<td>1500</td>
		<td>사이다</td>
		<td>1500</td>
	</tr>
	<tr>
		<td>파인애플토핑</td>
		<td>2000</td>
		<td>갈릭소스</td>
		<td>500</td>
	</tr>
	<tr>
		<td>치즈토핑</td>
		<td>2000</td>
		<td>피클</td>
		<td>300</td>
	</tr>
	<tr>
		<td>치즈크러스트</td>
		<td>2000</td>
		<td>핫소스</td>
		<td>100</td>
	</tr>
	<tr>
		<td>치즈바이트</td>
		<td>3000</td>
		<td>파마산 치즈가루</td>
		<td>100</td>
	</tr>
	</table>
	피자 :<select>
			<option>치즈피자</option>
			<option>콤비네이션피자</option>
			<option>포테이토피자</option>
			<option>고구마피자</option>
			<option>불고기피자</option>
		</select><br>
	토핑 :<input type="checkbox" name="top"value="1"> 고구마무스 
	<input type="checkbox" name="top"value="2"> 콘크림무스
	<input type="checkbox" name="top"value="3"> 파인애플토핑
	<input type="checkbox" name="top"value="4"> 치즈토핑
	<input type="checkbox" name="top"value="5"> 치즈크러스트
	<input type="checkbox" name="top"value="6"> 치즈바이트 <br>
	
	사이드 :<input type="checkbox" name="side"value="1"> 오븐구이통닭 
	<input type="checkbox" name="side"value="2"> 치킨스틱&윙
	<input type="checkbox" name="side"value="3"> 치즈스파게티
	<input type="checkbox" name="side"value="4"> 새우링&웨지감자
	<input type="checkbox" name="side"value="5"> 갈릭포테이토
	<input type="checkbox" name="side"value="6"> 콜라
	<input type="checkbox" name="side"value="7"> 사이다
	<input type="checkbox" name="side"value="8"> 갈릭소스
	<input type="checkbox" name="side"value="9"> 피클
	<input type="checkbox" name="side"value="10"> 핫소스
	<input type="checkbox" name="side"value="11"> 파마산 치즈가루<br>
	<input type="text" id ="test">
	<input type="button" value="확인" id="btn">
	

</body>
</html>