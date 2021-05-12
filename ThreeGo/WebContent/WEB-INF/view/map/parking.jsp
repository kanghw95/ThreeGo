<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search_park.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
</style>
<!-- 돋보기 같은 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
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
		<div class="category">
			<ul>
				<li id="coffeeMenu" onclick="changeMarker('coffee')"><span
					class="ico_comm ico_carpark"></span>무료</li>
				<li id="carparkMenu" onclick="changeMarker('carpark')"><span
					class="ico_comm ico_carpark"></span>유료</li>
				<li id="storeMenu" onclick="changeMarker('store')"><span
					class="ico_comm ico_carpark"></span>전체</li>
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
					// 스프라이트 이미지 전체의 크기를 지정하고
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
					var position = rv_marker.getPosition();

					// 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
					toggleRoadview(position);
				});

		
		// 주차장 제목 클릭 시 지도 이동 이벤트
		//지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			
			// 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
			if (!overlayOn) {
				return;
			}

			// 클릭한 위치의 좌표입니다 
			var position = mouseEvent.latLng;

			// 마커를 클릭한 위치로 옮깁니다
			rv_marker.setPosition(position);

			// 클락한 위치를 기준으로 로드뷰를 설정합니다
			toggleRoadview(position);
		});

		// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
		// 로드뷰를 설정하는 함수입니다
		function toggleRoadview(position) {
			rvClient.getNearestPanoId(position, 50, function(panoId) {
				// 파노라마 ID가 null 이면 로드뷰를 숨깁니다
				if (panoId === null) {
					toggleMapWrapper(true, position);
				} else {
					toggleMapWrapper(false, position);

					// panoId로 로드뷰를 설정합니다
					rv.setPanoId(panoId, position);
				}
			});
		}

		// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
		function toggleMapWrapper(active, position) {
			if (active) {

				// 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
				container.className = '';

				// 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
				map.relayout();

				// 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
				map.setCenter(position);
			} else {

				// 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
				// 로드뷰가 함께 표시되게 합니다
				if (container.className.indexOf('view_roadview') === -1) {
					container.className = 'view_roadview';

					// 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
					map.relayout();

					// 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
					map.setCenter(position);
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
			var position = rv_marker.getPosition();
			toggleMapWrapper(true, position);
		}
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

		// 커피숍 마커가 표시될 좌표 배열입니다
		var coffeePositions = [
			<c:forEach items="${listpark }" var="v" varStatus="s">
			new kakao.maps.LatLng(${v.lat}, ${v.lng})
			<c:if test="${fn:length(listpark) > 1 && fn:length(listpark) > (s.count)}">
			,
			</c:if>
			</c:forEach>
			/* new kakao.maps.LatLng(37.58024201,127.0100353),
			new kakao.maps.LatLng(37.57464656,126.9677885) */
		];

		// 주차장 마커가 표시될 좌표 배열입니다
		var carparkPositions = [
				new kakao.maps.LatLng(37.57449014, 126.9741859),
				new kakao.maps.LatLng(37.57107424, 126.9731594),
				new kakao.maps.LatLng(37.57449014, 126.9741859),
				new kakao.maps.LatLng(37.57107424, 126.9950416),
				new kakao.maps.LatLng(37.56983402, 126.9815059),
				new kakao.maps.LatLng(37.56914518, 126.9950416),
				new kakao.maps.LatLng(37.56955668, 126.9833738),
				new kakao.maps.LatLng(37.57231272, 126.9846183),
				new kakao.maps.LatLng(37.57158787, 126.9729356),
				new kakao.maps.LatLng(37.57806188, 126.9893414),
				new kakao.maps.LatLng(37.57067078, 127.0177646),
				new kakao.maps.LatLng(37.57540383, 126.9786815),
				new kakao.maps.LatLng(37.57185042, 126.9844954),
				new kakao.maps.LatLng(37.56829903, 126.9880723),
				new kakao.maps.LatLng(37.56947712, 126.9923344),
				new kakao.maps.LatLng(37.58411794, 126.9698478) 
				];

		// 편의점 마커가 표시될 좌표 배열입니다
		var storePositions = [
			<c:forEach items="${listpark }" var="v" varStatus="s">
				new kakao.maps.LatLng(${v.lat}, ${v.lng})
				<c:if test="${fn:length(listpark) > 1 && fn:length(listpark) > (s.count) }">
				,
				</c:if>
			</c:forEach>
			 ];
		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png'; // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

		createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
		createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
		createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

		changeMarker('store'); // 지도에 커피숍 마커가 보이도록 설정합니다    

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

		    
		    kakao.maps.event.addListener(marker, 'click', function() {
						
		    });
			return marker;
			
		}

		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createCoffeeMarkers() {

			for (var i = 0; i < coffeePositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 0),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						coffeePositions[i], markerImage);

				// 생성된 마커를 커피숍 마커 배열에 추가합니다
				coffeeMarkers.push(marker);
			}
		}

		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCoffeeMarkers(map) {
			for (var i = 0; i < coffeeMarkers.length; i++) {
				coffeeMarkers[i].setMap(map);
			}
		}

		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createStoreMarkers() {
			for (var i = 0; i < storePositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 36),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(storePositions[i],
						markerImage);

				// 생성된 마커를 편의점 마커 배열에 추가합니다
				storeMarkers.push(marker);
			}
		}

		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setStoreMarkers(map) {
			for (var i = 0; i < storeMarkers.length; i++) {
				storeMarkers[i].setMap(map);
			}
		}

		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createCarparkMarkers() {
			for (var i = 0; i < carparkPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 72),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						carparkPositions[i], markerImage);

				// 생성된 마커를 주차장 마커 배열에 추가합니다
				carparkMarkers.push(marker);
			}
		}

		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {
			for (var i = 0; i < carparkMarkers.length; i++) {
				carparkMarkers[i].setMap(map);
			}
		}

		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type) {

			var coffeeMenu = document.getElementById('coffeeMenu');
			var storeMenu = document.getElementById('storeMenu');
			var carparkMenu = document.getElementById('carparkMenu');

			// 커피숍 카테고리가 클릭됐을 때
			if (type === 'coffee') {

				// 커피숍 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = 'menu_selected';

				// 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
				storeMenu.className = '';
				carparkMenu.className = '';

				// 커피숍 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(map);
				setStoreMarkers(null);
				setCarparkMarkers(null);

			} else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때

				// 편의점 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';
				storeMenu.className = 'menu_selected';
				carparkMenu.className = '';

				// 편의점 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(null);
				setStoreMarkers(map);
				setCarparkMarkers(null);

			} else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때

				// 주차장 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';
				storeMenu.className = '';
				carparkMenu.className = 'menu_selected';

				// 주차장 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(null);
				setStoreMarkers(null);
				setCarparkMarkers(map);
			}
			
		}
		
	</script>
	<hr>
	${fn:length(listpark) }
</body>
</html>