<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search_park.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- 돋보기 같은 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.modal {

   position: absolute;
   overflow: hidden;
   top: 10px;
   right: 10px;
   z-index: 10;
   font-family: '서울남산 장체 L', sans-serif;
   font-size: 12px;
   text-align: center;
   background: white;
   border-radius: 12px;
   border: 3px solid #CFCFCF;
   
}

.modal2 {
   position: absolute;
   overflow: hidden;
   top: 10px;
   right: 70px;	
   z-index: 10;
   height : 54px;
   font-family: '서울남산 장체 L', sans-serif;
   font-size: 12px;
   font-weight : bolder;
   text-align: center;
   background: white;
   padding: 0 7 0 7;
        border-radius: 12px;
        border: 3px solid #CFCFCF;
}

   .modal_wrap{
   		
        display: none;
        width: 300px;
        height: 170px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -100px 0 0 -100px;
        background:white;
        z-index: 2;
        border-radius: 12px;
        border: 3px solid #CFCFCF;
        
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -35px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

window.onload = function()  {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
    document.querySelector('.modal_close').addEventListener('click', offClick);
    document.getElementById("modal_btn").addEventListener('click', onClick);
    document.getElementById("login_btn").addEventListener("click", onClick);
    
};
</script>
</head>

<body style="   font-family: '서울남산 장체 L', sans-serif;">
	<div id="container">
		<div id="rvWrapper">
			<div id="roadview" style="width: 100%; height: 100%;"></div>
			<!-- 로드뷰를 표시할 div 입니다 -->
			<div id="close" title="로드뷰닫기" onclick="closeRoadview()">
				<span class="img"></span>
			</div>
		</div>
		<div id="mapWrapper">
			<div id="map" style="width: 100%; height: 100%"></div>
			<!-- 지도를 표시할 div 입니다 -->
			<div id="roadviewControl" onclick="setRoadviewRoad()"></div>
		</div>
	
      <div class="black_bg"></div>
         <div class="modal_wrap">
                <div class="modal_close"><a href="#">close</a></div>
          <div><%@ include file="../login.jsp" %></div>   

   </div>
<%
      if (users != null || adminch != null) {
%>	
	<button type="button" id="modal_btn" class="modal" ><img src="<%=request.getContextPath() %>/img/myinfo.png"></button>
	
<%
      }else{
%>
	<button type="button" id="login_btn" class="modal2" >로그인/회원가입</button>
	<button type="button" id="modal_btn" class="modal" ><img src="<%=request.getContextPath() %>/img/login.png"></button>

<%
      
      }
%>


		<div class="category">
			<ul>
				<li  id="freeMenu" onclick="changeMarker('free')"><span
					class="ico_comm ico_free"></span>무료</li>
				<li id="notfreeMenu" onclick="changeMarker('notfree')"><span
					class="ico_comm ico_notfree"></span>유료</li>
				<li id="allMenu" onclick="changeMarker('all')"><span
					class="ico_comm ico_all"></span>전체</li>
			</ul>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e6ffb44bc370496fed6af6daa18ce21"></script>
	<script>
		var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
		container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
		mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
		rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다

		var mapCenter = new kakao.maps.LatLng(37.5679807077395,
				126.98301434065817), // 지도의 중심좌표
		mapOption = {
			center : mapCenter, // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 로드뷰 객체를 생성합니다 
		var rv = new kakao.maps.Roadview(rvContainer);

		// 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
		var rvClient = new kakao.maps.RoadviewClient();

		// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
		kakao.maps.event.addListener(rv, 'position_changed', function() {

			// 현재 로드뷰의 위치 좌표를 얻어옵니다 
			var rvPosition = rv.getPosition();

			// 지도의 중심을 현재 로드뷰의 위치로 설정합니다
			map.setCenter(rvPosition);

			// 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
			if (overlayOn) {
				// 마커의 위치를 현재 로드뷰의 위치로 설정합니다
				rv_marker.setPosition(rvPosition);
			}
		});

		// 마커 이미지를 생성합니다
		var rv_markImage = new kakao.maps.MarkerImage(
				'https://t1.daumcdn.net/localimg/localimages/07/2018/pc/roadview_minimap_wk_2018.png',
				new kakao.maps.Size(26, 46), {
					// 스프라이트 이미지를 사용합니다.
					// 스프라이트 이미지 전체 주차장의 크기를 지정하고
					spriteSize : new kakao.maps.Size(1666, 168),
					// 사용하고 싶은 영역의 좌상단 좌표를 입력합니다.
					// background-position으로 지정하는 값이며 부호는 반대입니다.
					spriteOrigin : new kakao.maps.Point(705, 114),
					offset : new kakao.maps.Point(13, 46)
				});

		// 드래그가 가능한 마커를 생성합니다
		var rv_marker = new kakao.maps.Marker({
			image : rv_markImage,
			position : mapCenter,
			draggable : true
		});

		// 마커에 dragend 이벤트를 등록합니다
		kakao.maps.event.addListener(rv_marker, 'dragend',
				function(mouseEvent) {

					// 현재 마커가 놓인 자리의 좌표입니다 
					var rv_position = rv_marker.getPosition();

					// 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
					toggleRoadview(rv_position);
				});

		
		// 주차장 제목 클릭 시 지도 이동 이벤트
		function panTo(name,code){
			var code = code;
			
			var codeclass1 = document.getElementsByClassName("park");
			var codeclass = document.getElementsByClassName("park"+code);
			for(var i=0; i<codeclass1.length; i++){
				codeclass1[i].style.background = "none";
			}
			codeclass[0].style.background = "#EEFDFF";
        	
			
			
			<c:forEach items="${listpark }" var="v" varStatus="s">
			console.log('${v.lat}, ${v.lng}');
			if(name == '${v.parking_name}'){
			var moveLatLon = new kakao.maps.LatLng(${v.lat}, ${v.lng});
			}
			</c:forEach>
				map.panTo(moveLatLon);
		}
		//지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			
			// 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
			if (!overlayOn) {
				return;
			}

			// 클릭한 위치의 좌표입니다 
			var rv_position = mouseEvent.latLng;

			// 마커를 클릭한 위치로 옮깁니다
			rv_marker.setPosition(rv_position);

			// 클락한 위치를 기준으로 로드뷰를 설정합니다
			toggleRoadview(rv_position);
		});

		// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
		// 로드뷰를 설정하는 함수입니다
		function toggleRoadview(rv_position) {
			rvClient.getNearestPanoId(rv_position, 50, function(panoId) {
				// 파노라마 ID가 null 이면 로드뷰를 숨깁니다
				if (panoId === null) {
					toggleMapWrapper(true, rv_position);
				} else {
					toggleMapWrapper(false, rv_position);

					// panoId로 로드뷰를 설정합니다
					rv.setPanoId(panoId, rv_position);
				}
			});
		}

		// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
		function toggleMapWrapper(active, rv_position) {
			if (active) {

				// 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
				container.className = '';

				// 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
				map.relayout();

				// 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
				map.setCenter(rv_position);
			} else {

				// 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
				// 로드뷰가 함께 표시되게 합니다
				if (container.className.indexOf('view_roadview') === -1) {
					container.className = 'view_roadview';

					// 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
					map.relayout();

					// 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
					map.setCenter(rv_position);
				}
			}
		}

		// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
		function toggleOverlay(active) {
			if (active) {
				overlayOn = true;

				// 지도 위에 로드뷰 도로 오버레이를 추가합니다
				map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

				// 지도 위에 마커를 표시합니다
				rv_marker.setMap(map);

				// 마커의 위치를 지도 중심으로 설정합니다 
				rv_marker.setPosition(map.getCenter());

				// 로드뷰의 위치를 지도 중심으로 설정합니다
				toggleRoadview(map.getCenter());
			} else {
				overlayOn = false;

				// 지도 위의 로드뷰 도로 오버레이를 제거합니다
				map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

				// 지도 위의 마커를 제거합니다
				rv_marker.setMap(null);
			}
		}

		// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
		function setRoadviewRoad() {
			var control = document.getElementById('roadviewControl');

			// 버튼이 눌린 상태가 아니면
			if (control.className.indexOf('active') === -1) {
				control.className = 'active';

				// 로드뷰 도로 오버레이가 보이게 합니다
				toggleOverlay(true);
			} else {
				control.className = '';

				// 로드뷰 도로 오버레이를 제거합니다
				toggleOverlay(false);
			}
		}

		// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
		function closeRoadview() {
			var rv_position = rv_marker.getPosition();
			toggleMapWrapper(true, rv_position);
		}
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

		// 무료 주차장 주차장 마커가 표시될 좌표 배열입니다
		var freePositions = [
			<c:forEach items="${listpark }" var="v" varStatus="s">
			<c:if test = "${fn:contains(v.pay_yn, 'N')}">

			new kakao.maps.LatLng(${v.lat}, ${v.lng})
			<c:if test="${fn:length(listpark) > 1 && fn:length(listpark) > (s.count)}">
			,
			</c:if>
			</c:if>

			</c:forEach>
			/* new kakao.maps.LatLng(37.58024201,127.0100353),
			new kakao.maps.LatLng(37.57464656,126.9677885) */
		];

		// 유료 주차장 마커가 표시될 좌표 배열입니다
		var notfreePositions = [
			<c:forEach items="${listpark }" var="v" varStatus="s">
			<c:if test = "${fn:contains(v.pay_yn, 'Y')}">
			new kakao.maps.LatLng(${v.lat}, ${v.lng})
			<c:if test="${fn:length(listpark) > 1 && fn:length(listpark) > (s.count)}">
			,
			</c:if>
			</c:if>
			</c:forEach>
				];

		// 전체 주차장 마커가 표시될 좌표 배열입니다
		var allPositions = [
			<c:forEach items="${listpark }" var="v" varStatus="s">
			new kakao.maps.LatLng(${v.lat}, ${v.lng})
			<c:if test="${fn:length(listpark) > 1 && fn:length(listpark) > (s.count)}">
			,
			</c:if>
			</c:forEach>
			 ];
		var markerImageSrc = "/ThreeGo/img/sprite.png"
		freeMarkers = [], // 무료 주차장 주차장 마커 객체를 가지고 있을 배열입니다
		allMarkers = [], // 전체 주차장 마커 객체를 가지고 있을 배열입니다
		notfreeMarkers = []; // 유료 주차장 마커 객체를 가지고 있을 배열입니다

		createFreeMarkers(); // 무료 주차장 주차장 마커를 생성하고 무료 주차장 주차장 마커 배열에 추가합니다
		createAllMarkers(); // 전체 주차장 마커를 생성하고 전체 주차장 마커 배열에 추가합니다
		createNotFreeMarkers(); // 유료 주차장 마커를 생성하고 유료 주차장 마커 배열에 추가합니다

		changeMarker('all'); // 지도에 무료 주차장 주차장 마커가 보이도록 설정합니다    

		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
			var markerImage = new kakao.maps.MarkerImage(src, size, options);
			return markerImage;
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
	 function createMarker(position, image) {
         var marker = new kakao.maps.Marker({
            position : position,
            image : image
         });
         <c:forEach items="${listpark }" var="v" varStatus="s">
         var name${v.parking_code} = {
            La: ${v.lng},
            Ma: ${v.lat}
         };
         </c:forEach>
               
          iwRemoveable = true; 

         
          kakao.maps.event.addListener( marker, 'click', function() {
         var parkname ;
            <c:forEach items="${listpark }" var="v" varStatus="s">
                     
                  if(JSON.stringify(name${v.parking_code})==JSON.stringify(position)){
                     parkname="${v.parking_name}";                  
                  }
         
            </c:forEach>
            var iwContent = "<div id='pk_info' style='padding:5px; text-align:center; width:120px;'>"+parkname+"</div>"; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
         var infowindow = new kakao.maps.InfoWindow({
             content : iwContent,
             removable : iwRemoveable
         });
             infowindow.open(map, marker);  

          
         

          });
         return marker;
         
      }

		// 무료 주차장 주차장 마커를 생성하고 무료 주차장 주차장 마커 배열에 추가하는 함수입니다
		function createFreeMarkers() {

			for (var i = 0; i < freePositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 0),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						freePositions[i], markerImage);

				// 생성된 마커를 무료 주차장 주차장 마커 배열에 추가합니다
				freeMarkers.push(marker);
			}
		}

		// 무료 주차장 주차장 유료 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setFreeMarkers(map) {
			for (var i = 0; i < freeMarkers.length; i++) {
				freeMarkers[i].setMap(map);
			}
		}

		// 전체 주차장 유료 주차장 조회 마커를 생성하고 전체 주차장 마커 배열에 추가하는 함수입니다
		function createAllMarkers() {
			for (var i = 0; i < allPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 36),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(allPositions[i],
						markerImage);

				// 생성된 마커를 전체 주차장 마커 배열에 추가합니다
				allMarkers.push(marker);
			}
		}

		// 전체 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setAllMarkers(map) {
			for (var i = 0; i < allMarkers.length; i++) {
				allMarkers[i].setMap(map);
			}
		}

		// 유료 주차장 마커를 생성하고 유료 주차장 마커 배열에 추가하는 함수입니다
		function createNotFreeMarkers() {
			for (var i = 0; i < notfreePositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 72),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						notfreePositions[i], markerImage);

				// 생성된 마커를 유료 주차장 마커 배열에 추가합니다
				notfreeMarkers.push(marker);
			}
		}

		// 유료 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setNotFreeMarkers(map) {
			for (var i = 0; i < notfreeMarkers.length; i++) {
				notfreeMarkers[i].setMap(map);
			}
		}

		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type) {

			var freeMenu = document.getElementById('freeMenu');
			var allMenu = document.getElementById('allMenu');
			var notfreeMenu = document.getElementById('notfreeMenu');

			// 무료 주차장 주차장 카테고리가 클릭됐을 때
			if (type === 'free') {
				<c:forEach items="${listpark }" var="v" varStatus="s">
				<c:if test = "${v.pay_yn} == 'N'">
				console.log("${v.pay_yn}")
				</c:if>
				</c:forEach>
				// 무료 주차장 주차장 카테고리를 선택된 스타일로 변경하고
				freeMenu.className = 'menu_selected';

				// 전체 주차장과 유료 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
				allMenu.className = '';
				notfreeMenu.className = '';

				// 무료 주차장 주차장 마커들만 지도에 표시하도록 설정합니다
				setFreeMarkers(map);
				setAllMarkers(null);
				setNotFreeMarkers(null);

			} else if (type === 'all') { // 전체 주차장 카테고리가 클릭됐을 때

				// 전체 주차장 카테고리를 선택된 스타일로 변경하고
				freeMenu.className = '';
				allMenu.className = 'menu_selected';
				notfreeMenu.className = '';

				// 전체 주차장 마커들만 지도에 표시하도록 설정합니다
				setFreeMarkers(null);
				setAllMarkers(map);
				setNotFreeMarkers(null);

			} else if (type === 'notfree') { // 유료 주차장 카테고리가 클릭됐을 때

				// 유료 주차장 카테고리를 선택된 스타일로 변경하고
				freeMenu.className = '';
				allMenu.className = '';
				notfreeMenu.className = 'menu_selected';

				// 유료 주차장 마커들만 지도에 표시하도록 설정합니다
				setFreeMarkers(null);
				setAllMarkers(null);
				setNotFreeMarkers(map);
			}
			
		}
		

			
	</script>
</body>
</html>