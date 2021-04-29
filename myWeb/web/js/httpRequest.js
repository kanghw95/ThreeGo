// XHR 객체 생성
function getXMLHttpRequest() {
	if (window.ActiveXObject) {  // 브라우저 IE 경우
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");   // 신버젼
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) { // IE 이외 브라우저
		return new XMLHttpRequest();
	} else {
		return null;
	} 
}

var httpRequest = null;  // 전역변수로 XMLHttpRequest로 생성된 것을 담을 변수

// 메소드지정, url지정, parmeters 값을 웹서버에 전송
function sendRequest(method, url, params, callback) {
	httpRequest = getXMLHttpRequest(); // XMLHttpRequest로 생성된 것을 담을 변수
	var httpMethod = method ? method : 'GET';  // js 0으로 인식하는 경우 'GET'
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';   // 오타 등으로 알수 없는 방식이 들어오는 경우 'GET' 설정
	}
	var httpParams = (params == null || params == "") ? null : params;
	var httpUrl = url;
	// GET 메소드면 URL 뒤에 파라미터를 붙임
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	// 비동기식으로 XMLHttpRequest 객체 사용
	httpRequest.open(httpMethod, httpUrl, true);
	// 웹 서버에 전송할 컨텐트 타입 지정
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	// 콜백 함수 지정
	httpRequest.onreadystatechange = callback;
	// HTTP 요청 방식이 'POST'면 send() 함수를 통해 파라미터 전송
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}
