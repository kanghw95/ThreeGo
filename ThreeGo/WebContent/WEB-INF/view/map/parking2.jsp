<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>




#container {
	overflow: hidden;
	height: 300px;
	position: relative;
}

#mapWrapper {
	width: 100%;
	height: 300px;
	z-index: 1;
}

#rvWrapper {
	width: 50%;
	height: 300px;
	top: 0;
	right: 0;
	position: absolute;
	z-index: 0;
}

#container.view_roadview #mapWrapper {
	width: 50%;
}

#roadviewControl {
	position: absolute;
	top: 5px;
	left: 5px;
	width: 42px;
	height: 42px;
	z-index: 1;
	cursor: pointer;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_search.png)
		0 -450px no-repeat;
}

#roadviewControl.active {
	background-position: 0 -350px;
}

#close {
	position: absolute;
	padding: 4px;
	top: 5px;
	left: 5px;
	cursor: pointer;
	background: #fff;
	border-radius: 4px;
	border: 1px solid #c8c8c8;
	box-shadow: 0px 1px #888;
}

#close .img {
	display: block;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png)
		no-repeat;
	width: 14px;
	height: 14px;
}

#mapwrap {
	position: absoulte;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 10px;
	left: 10px;
	width: 150px;
	height: 50px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #FF5F4A;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 45px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 22px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_coffee {
	background-position: -10px 0;
}

.category .ico_store {
	background-position: -10px -36px;
}

.category .ico_carpark {
	background-position: -10px -72px;
}








#search{
	position : fixed;
	width : 196px;
	height : 100%;
	float : left;
	
}
#searchBtn{
width : 32px;
height : 32px;
box-sizing :  border-content;
padding : 0;
float:left;
}
#img_btn{
width : 20px;
height : 20px;

}
#searchText{
width : 160px;
height : 28px;
padding : 0;

}
#search_result{
border : 1px solid black;
padding : 0;
width : 64px;
height : 100%;
float : left;
}
</style>
<body>
<div id = search>
<button type = "button" id = "searchBtn" class = "btn"><img id = "img_btn"src = "<%= request.getContextPath()%>/btnSearch.png"></button>
<input type = "text" id = "searchText" class = "searchText"/>
<hr>
</div>
<div id = search_result>

</div>
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
					class="ico_comm ico_coffee"></span>무료</li>
				<li id="carparkMenu" onclick="changeMarker('carpark')"><span
					class="ico_comm ico_carpark"></span>유료</li>
				<li id="storeMenu" onclick="changeMarker('store')"><span
					class="ico_comm ico_store"></span>전체</li>
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
				marker.setPosition(rvPosition);
			}
		});

		// 마커 이미지를 생성합니다
		var markImage = new kakao.maps.MarkerImage(
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
		var marker = new kakao.maps.Marker({
			image : markImage,
			position : mapCenter,
			draggable : true
		});

		// 마커에 dragend 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {

			// 현재 마커가 놓인 자리의 좌표입니다 
			var position = marker.getPosition();

			// 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
			toggleRoadview(position);
		});

		//지도에 클릭 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
			if (!overlayOn) {
				return;
			}

			// 클릭한 위치의 좌표입니다 
			var position = mouseEvent.latLng;

			// 마커를 클릭한 위치로 옮깁니다
			marker.setPosition(position);

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
				marker.setMap(map);

				// 마커의 위치를 지도 중심으로 설정합니다 
				marker.setPosition(map.getCenter());

				// 로드뷰의 위치를 지도 중심으로 설정합니다
				toggleRoadview(map.getCenter());
			} else {
				overlayOn = false;

				// 지도 위의 로드뷰 도로 오버레이를 제거합니다
				map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);

				// 지도 위의 마커를 제거합니다
				marker.setMap(null);
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
			var position = marker.getPosition();
			toggleMapWrapper(true, position);
		}
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
		// 공영 주차장이 표시될 좌표 배열입니다.
		// 커피숍 마커가 표시될 좌표 배열입니다
var coffeePositions = [ 
	new kakao.maps.LatLng(37.58024201,127.0100353),
	new kakao.maps.LatLng(37.58033446,127.0094949),
	new kakao.maps.LatLng(37.58043453,127.009102),
	new kakao.maps.LatLng(37.58030329,127.0096269),
	new kakao.maps.LatLng(37.58027332,127.0097603),
	new kakao.maps.LatLng(37.58025229,127.009896),
	new kakao.maps.LatLng(37.58024483,127.0101731),
	new kakao.maps.LatLng(37.58039978,127.0092317),
	new kakao.maps.LatLng(37.58036623,127.009363),
	new kakao.maps.LatLng(37.57464656,126.9677885),
	new kakao.maps.LatLng(37.57470832,126.9678757),
	new kakao.maps.LatLng(37.57477163,126.9679624)
      
];

// 편의점 마커가 표시될 좌표 배열입니다
var storePositions = [
	new kakao.maps.LatLng(37.58024201,127.0100353),
	new kakao.maps.LatLng(37.58033446,127.0094949),
	new kakao.maps.LatLng(37.58043453,127.009102),
	new kakao.maps.LatLng(37.58030329,127.0096269),
	new kakao.maps.LatLng(37.58027332,127.0097603),
	new kakao.maps.LatLng(37.58025229,127.009896),
	new kakao.maps.LatLng(37.58024483,127.0101731),
	new kakao.maps.LatLng(37.58039978,127.0092317),
	new kakao.maps.LatLng(37.58036623,127.009363),
	new kakao.maps.LatLng(37.57464656,126.9677885),
	new kakao.maps.LatLng(37.57470832,126.9678757),
	new kakao.maps.LatLng(37.57477163,126.9679624),
	new kakao.maps.LatLng(37.57449014,126.9741859),
	new kakao.maps.LatLng(37.57107424,126.9731594),
	new kakao.maps.LatLng(37.56983402,126.9815059),
	new kakao.maps.LatLng(37.56914518,126.9950416),
	new kakao.maps.LatLng(37.56950488,126.995483),
	new kakao.maps.LatLng(37.56910086,126.9955402),
	new kakao.maps.LatLng(37.5691333,126.9955392),
	new kakao.maps.LatLng(37.56905059,126.9950538),
	new kakao.maps.LatLng(37.56917369,126.9950363),
	new kakao.maps.LatLng(37.56951194,126.9949868),
	new kakao.maps.LatLng(37.56903928,126.995547),
	new kakao.maps.LatLng(37.56907039,126.995544),
	new kakao.maps.LatLng(37.56911422,126.9950458),
	new kakao.maps.LatLng(37.56898489,126.9950609),
	new kakao.maps.LatLng(37.56931467,126.9950139),
	new kakao.maps.LatLng(37.5695689,126.994979),
	new kakao.maps.LatLng(37.56953573,126.995482),
	new kakao.maps.LatLng(37.56954051,126.9949831),
	new kakao.maps.LatLng(37.56937739,126.9950066),
	new kakao.maps.LatLng(37.569596,126.9954735),
	new kakao.maps.LatLng(37.56934736,126.9950118),
	new kakao.maps.LatLng(37.56960045,126.9949789),
	new kakao.maps.LatLng(37.5695652,126.9954784),
	new kakao.maps.LatLng(37.56901767,126.9950578),
	new kakao.maps.LatLng(37.56938589,126.9954957),
	new kakao.maps.LatLng(37.56947483,126.9954868),
	new kakao.maps.LatLng(37.56944573,126.9954916),
	new kakao.maps.LatLng(37.56940856,126.9950029),
	new kakao.maps.LatLng(37.56921876,126.9955234),
	new kakao.maps.LatLng(37.56908092,126.9950481),
	new kakao.maps.LatLng(37.56916043,126.9955317),
	new kakao.maps.LatLng(37.56900853,126.9955527),
	new kakao.maps.LatLng(37.56941418,126.9954925),
	new kakao.maps.LatLng(37.56955668,126.9833738),
	new kakao.maps.LatLng(37.56954998,126.9835796),
	new kakao.maps.LatLng(37.56956367,126.9831674),
	new kakao.maps.LatLng(37.5695603,126.9838496),
	new kakao.maps.LatLng(37.56955581,126.9837815),
	new kakao.maps.LatLng(37.56955216,126.9837142),
	new kakao.maps.LatLng(37.56954962,126.9836479),
	new kakao.maps.LatLng(37.56950891,126.9831892),
	new kakao.maps.LatLng(37.56956539,126.9839177),
	new kakao.maps.LatLng(37.56955255,126.9835109),
	new kakao.maps.LatLng(37.56955461,126.9834427),
	new kakao.maps.LatLng(37.56956199,126.983236),
	new kakao.maps.LatLng(37.56955933,126.9833049),
	new kakao.maps.LatLng(37.57231272,126.9846183),
	new kakao.maps.LatLng(37.5723083,126.9845854),
	new kakao.maps.LatLng(37.57236773,126.9850051),
	new kakao.maps.LatLng(37.57236339,126.9849763),
	new kakao.maps.LatLng(37.57233636,126.9847853),
	new kakao.maps.LatLng(37.57235875,126.9849457),
	new kakao.maps.LatLng(37.57232736,126.9847199),
	new kakao.maps.LatLng(37.57234976,126.9848806),
	new kakao.maps.LatLng(37.57231777,126.9846535),
	new kakao.maps.LatLng(37.57230376,126.984555),
	new kakao.maps.LatLng(37.57229875,126.9845238),
	new kakao.maps.LatLng(37.57232231,126.9846856),
	new kakao.maps.LatLng(37.57234522,126.9848488),
	new kakao.maps.LatLng(37.57233182,126.9847518),
	new kakao.maps.LatLng(37.57234068,126.984817),
	new kakao.maps.LatLng(37.5723543,126.9849139),
	new kakao.maps.LatLng(37.57158787,126.9729356),
	new kakao.maps.LatLng(37.57159174,126.9739111),
	new kakao.maps.LatLng(37.57158993,126.9731404),
	new kakao.maps.LatLng(37.57158699,126.9728679),
	new kakao.maps.LatLng(37.57142086,126.9741155),
	new kakao.maps.LatLng(37.57136605,126.9741163),
	new kakao.maps.LatLng(37.57165567,126.9740745),
	new kakao.maps.LatLng(37.57147607,126.974116),
	new kakao.maps.LatLng(37.57165604,126.9741431),
	new kakao.maps.LatLng(37.57165697,126.9742804),
	new kakao.maps.LatLng(37.57158871,126.973504),
	new kakao.maps.LatLng(37.57165696,126.9742122),
	new kakao.maps.LatLng(37.57158909,126.9735726),
	new kakao.maps.LatLng(37.57159097,126.9738424),
	new kakao.maps.LatLng(37.57158877,126.9730044),
	new kakao.maps.LatLng(37.57158924,126.9730718),
	new kakao.maps.LatLng(37.57806188,126.9893414),
	new kakao.maps.LatLng(37.57844214,126.989317),
	new kakao.maps.LatLng(37.57849518,126.9893065),
	new kakao.maps.LatLng(37.57774739,126.9893215),
	new kakao.maps.LatLng(37.57831279,126.9893457),
	new kakao.maps.LatLng(37.57798976,126.9893384),
	new kakao.maps.LatLng(37.5782594,126.9893581),
	new kakao.maps.LatLng(37.57815842,126.9893496),
	new kakao.maps.LatLng(37.57769267,126.9893231),
	new kakao.maps.LatLng(37.57780195,126.9893269),
	new kakao.maps.LatLng(37.57836684,126.9893319),
	new kakao.maps.LatLng(37.5780136,126.9893407),
	new kakao.maps.LatLng(37.57763687,126.9893291),
	new kakao.maps.LatLng(37.57813399,126.9893467),
	new kakao.maps.LatLng(37.57810955,126.9893452),
	new kakao.maps.LatLng(37.57803804,126.9893414),
	new kakao.maps.LatLng(37.57808631,126.9893444),
	new kakao.maps.LatLng(37.57067078,127.0177646),
	new kakao.maps.LatLng(37.57034406,127.0170586),
	new kakao.maps.LatLng(37.57216171,127.0224105),
	new kakao.maps.LatLng(37.57217485,127.0222579),
	new kakao.maps.LatLng(37.57031598,127.0169854),
	new kakao.maps.LatLng(37.57169804,127.0197728),
	new kakao.maps.LatLng(37.57146299,127.0193178),
	new kakao.maps.LatLng(37.57213784,127.0225991),
	new kakao.maps.LatLng(37.5721271,127.0226665),
	new kakao.maps.LatLng(37.57023639,127.0167509),
	new kakao.maps.LatLng(37.57063505,127.0176964),
	new kakao.maps.LatLng(37.5719916,127.0206237),
	new kakao.maps.LatLng(37.57197551,127.0205551),
	new kakao.maps.LatLng(37.57207997,127.0209962),
	new kakao.maps.LatLng(37.5713947,127.0191843),
	new kakao.maps.LatLng(37.57215893,127.0213678),
	new kakao.maps.LatLng(37.57142888,127.0192478),
	new kakao.maps.LatLng(37.57172406,127.0198308),
	new kakao.maps.LatLng(37.57015026,127.0164684),
	new kakao.maps.LatLng(37.57210801,127.0211315),
	new kakao.maps.LatLng(37.57077685,127.0179757),
	new kakao.maps.LatLng(37.57011017,127.0163365),
	new kakao.maps.LatLng(37.57019149,127.0166074),
	new kakao.maps.LatLng(37.57216394,127.0214355),
	new kakao.maps.LatLng(37.57074755,127.0179317),
	new kakao.maps.LatLng(37.57060019,127.0176276),
	new kakao.maps.LatLng(37.57167001,127.019713),
	new kakao.maps.LatLng(37.57210442,127.0228103),
	new kakao.maps.LatLng(37.57216859,127.0223392),
	new kakao.maps.LatLng(37.57211636,127.0227369),
	new kakao.maps.LatLng(37.57037032,127.0171333),
	new kakao.maps.LatLng(37.57216873,127.0215082),
	new kakao.maps.LatLng(37.57026174,127.0168239),
	new kakao.maps.LatLng(37.57209467,127.0210653),
	new kakao.maps.LatLng(37.57195823,127.0204842),
	new kakao.maps.LatLng(37.57012955,127.0164019),
	new kakao.maps.LatLng(37.57017023,127.0165343),
	new kakao.maps.LatLng(37.57074267,127.0179095),
	new kakao.maps.LatLng(37.57175492,127.0198927),
	new kakao.maps.LatLng(37.57540383,126.9786815),
	new kakao.maps.LatLng(37.57527737,126.9787548),
	new kakao.maps.LatLng(37.57523394,126.9787793),
	new kakao.maps.LatLng(37.57544599,126.9786582),
	new kakao.maps.LatLng(37.57546727,126.9786463),
	new kakao.maps.LatLng(37.57542571,126.9786694),
	new kakao.maps.LatLng(37.57525565,126.9787674),
	new kakao.maps.LatLng(37.57521215,126.9787923),
	new kakao.maps.LatLng(37.57536163,126.9787049),
	new kakao.maps.LatLng(37.57531915,126.9787303),
	new kakao.maps.LatLng(37.575298,126.978742),
	new kakao.maps.LatLng(37.57538307,126.9786926),
	new kakao.maps.LatLng(37.57534073,126.9787157),
	new kakao.maps.LatLng(37.57185042,126.9844954),
	new kakao.maps.LatLng(37.57190485,126.9844778),
	new kakao.maps.LatLng(37.57214387,126.9844034),
	new kakao.maps.LatLng(37.57154559,126.9845935),
	new kakao.maps.LatLng(37.57169044,126.9845485),
	new kakao.maps.LatLng(37.57174492,126.9845305),
	new kakao.maps.LatLng(37.57179781,126.9845134),
	new kakao.maps.LatLng(37.57163668,126.9845657),
	new kakao.maps.LatLng(37.57195793,126.9844611),
	new kakao.maps.LatLng(37.56829903,126.9880723),
	new kakao.maps.LatLng(37.56829211,126.9885707),
	new kakao.maps.LatLng(37.56829666,126.9882176),
	new kakao.maps.LatLng(37.5682943,126.9884302),
	new kakao.maps.LatLng(37.56829785,126.9881457),
	new kakao.maps.LatLng(37.56830886,126.9891937),
	new kakao.maps.LatLng(37.56831363,126.9892663),
	new kakao.maps.LatLng(37.56829931,126.9890589),
	new kakao.maps.LatLng(37.56831662,126.9893367),
	new kakao.maps.LatLng(37.56829312,126.9885006),
	new kakao.maps.LatLng(37.56830587,126.989127),
	new kakao.maps.LatLng(37.56947712,126.9923344),
	new kakao.maps.LatLng(37.56909542,126.9923842),
	new kakao.maps.LatLng(37.56964546,126.9923151),
	new kakao.maps.LatLng(37.56904162,126.9923908),
	new kakao.maps.LatLng(37.56898596,126.9923954),
	new kakao.maps.LatLng(37.56887639,126.9924071),
	new kakao.maps.LatLng(37.56915109,126.9923777),
	new kakao.maps.LatLng(37.56882001,126.9924153),
	new kakao.maps.LatLng(37.56942229,126.9923412),
	new kakao.maps.LatLng(37.56959054,126.9923216),
	new kakao.maps.LatLng(37.56953264,126.9923284),
	new kakao.maps.LatLng(37.5689309,126.9924008),
	new kakao.maps.LatLng(37.58411794,126.9698478)
];

// 주차장 마커가 표시될 좌표 배열입니다
var carparkPositions = [
	new kakao.maps.LatLng(37.57449014,126.9741859),
			new kakao.maps.LatLng(37.57107424,126.9731594),
			new kakao.maps.LatLng(37.56983402,126.9815059),
			new kakao.maps.LatLng(37.56914518,126.9950416),
			new kakao.maps.LatLng(37.56950488,126.995483),
			new kakao.maps.LatLng(37.56910086,126.9955402),
			new kakao.maps.LatLng(37.5691333,126.9955392),
			new kakao.maps.LatLng(37.56905059,126.9950538),
			new kakao.maps.LatLng(37.56917369,126.9950363),
			new kakao.maps.LatLng(37.56951194,126.9949868),
			new kakao.maps.LatLng(37.56903928,126.995547),
			new kakao.maps.LatLng(37.56907039,126.995544),
			new kakao.maps.LatLng(37.56911422,126.9950458),
			new kakao.maps.LatLng(37.56898489,126.9950609),
			new kakao.maps.LatLng(37.56931467,126.9950139),
			new kakao.maps.LatLng(37.5695689,126.994979),
			new kakao.maps.LatLng(37.56953573,126.995482),
			new kakao.maps.LatLng(37.56954051,126.9949831),
			new kakao.maps.LatLng(37.56937739,126.9950066),
			new kakao.maps.LatLng(37.569596,126.9954735),
			new kakao.maps.LatLng(37.56934736,126.9950118),
			new kakao.maps.LatLng(37.56960045,126.9949789),
			new kakao.maps.LatLng(37.5695652,126.9954784),
			new kakao.maps.LatLng(37.56901767,126.9950578),
			new kakao.maps.LatLng(37.56938589,126.9954957),
			new kakao.maps.LatLng(37.56947483,126.9954868),
			new kakao.maps.LatLng(37.56944573,126.9954916),
			new kakao.maps.LatLng(37.56940856,126.9950029),
			new kakao.maps.LatLng(37.56921876,126.9955234),
			new kakao.maps.LatLng(37.56908092,126.9950481),
			new kakao.maps.LatLng(37.56916043,126.9955317),
			new kakao.maps.LatLng(37.56900853,126.9955527),
			new kakao.maps.LatLng(37.56941418,126.9954925),
			new kakao.maps.LatLng(37.56955668,126.9833738),
			new kakao.maps.LatLng(37.56954998,126.9835796),
			new kakao.maps.LatLng(37.56956367,126.9831674),
			new kakao.maps.LatLng(37.5695603,126.9838496),
			new kakao.maps.LatLng(37.56955581,126.9837815),
			new kakao.maps.LatLng(37.56955216,126.9837142),
			new kakao.maps.LatLng(37.56954962,126.9836479),
			new kakao.maps.LatLng(37.56950891,126.9831892),
			new kakao.maps.LatLng(37.56956539,126.9839177),
			new kakao.maps.LatLng(37.56955255,126.9835109),
			new kakao.maps.LatLng(37.56955461,126.9834427),
			new kakao.maps.LatLng(37.56956199,126.983236),
			new kakao.maps.LatLng(37.56955933,126.9833049),
			new kakao.maps.LatLng(37.57231272,126.9846183),
			new kakao.maps.LatLng(37.5723083,126.9845854),
			new kakao.maps.LatLng(37.57236773,126.9850051),
			new kakao.maps.LatLng(37.57236339,126.9849763),
			new kakao.maps.LatLng(37.57233636,126.9847853),
			new kakao.maps.LatLng(37.57235875,126.9849457),
			new kakao.maps.LatLng(37.57232736,126.9847199),
			new kakao.maps.LatLng(37.57234976,126.9848806),
			new kakao.maps.LatLng(37.57231777,126.9846535),
			new kakao.maps.LatLng(37.57230376,126.984555),
			new kakao.maps.LatLng(37.57229875,126.9845238),
			new kakao.maps.LatLng(37.57232231,126.9846856),
			new kakao.maps.LatLng(37.57234522,126.9848488),
			new kakao.maps.LatLng(37.57233182,126.9847518),
			new kakao.maps.LatLng(37.57234068,126.984817),
			new kakao.maps.LatLng(37.5723543,126.9849139),
			new kakao.maps.LatLng(37.57158787,126.9729356),
			new kakao.maps.LatLng(37.57159174,126.9739111),
			new kakao.maps.LatLng(37.57158993,126.9731404),
			new kakao.maps.LatLng(37.57158699,126.9728679),
			new kakao.maps.LatLng(37.57142086,126.9741155),
			new kakao.maps.LatLng(37.57136605,126.9741163),
			new kakao.maps.LatLng(37.57165567,126.9740745),
			new kakao.maps.LatLng(37.57147607,126.974116),
			new kakao.maps.LatLng(37.57165604,126.9741431),
			new kakao.maps.LatLng(37.57165697,126.9742804),
			new kakao.maps.LatLng(37.57158871,126.973504),
			new kakao.maps.LatLng(37.57165696,126.9742122),
			new kakao.maps.LatLng(37.57158909,126.9735726),
			new kakao.maps.LatLng(37.57159097,126.9738424),
			new kakao.maps.LatLng(37.57158877,126.9730044),
			new kakao.maps.LatLng(37.57158924,126.9730718),
			new kakao.maps.LatLng(37.57806188,126.9893414),
			new kakao.maps.LatLng(37.57844214,126.989317),
			new kakao.maps.LatLng(37.57849518,126.9893065),
			new kakao.maps.LatLng(37.57774739,126.9893215),
			new kakao.maps.LatLng(37.57831279,126.9893457),
			new kakao.maps.LatLng(37.57798976,126.9893384),
			new kakao.maps.LatLng(37.5782594,126.9893581),
			new kakao.maps.LatLng(37.57815842,126.9893496),
			new kakao.maps.LatLng(37.57769267,126.9893231),
			new kakao.maps.LatLng(37.57780195,126.9893269),
			new kakao.maps.LatLng(37.57836684,126.9893319),
			new kakao.maps.LatLng(37.5780136,126.9893407),
			new kakao.maps.LatLng(37.57763687,126.9893291),
			new kakao.maps.LatLng(37.57813399,126.9893467),
			new kakao.maps.LatLng(37.57810955,126.9893452),
			new kakao.maps.LatLng(37.57803804,126.9893414),
			new kakao.maps.LatLng(37.57808631,126.9893444),
			new kakao.maps.LatLng(37.57067078,127.0177646),
			new kakao.maps.LatLng(37.57034406,127.0170586),
			new kakao.maps.LatLng(37.57216171,127.0224105),
			new kakao.maps.LatLng(37.57217485,127.0222579),
			new kakao.maps.LatLng(37.57031598,127.0169854),
			new kakao.maps.LatLng(37.57169804,127.0197728),
			new kakao.maps.LatLng(37.57146299,127.0193178),
			new kakao.maps.LatLng(37.57213784,127.0225991),
			new kakao.maps.LatLng(37.5721271,127.0226665),
			new kakao.maps.LatLng(37.57023639,127.0167509),
			new kakao.maps.LatLng(37.57063505,127.0176964),
			new kakao.maps.LatLng(37.5719916,127.0206237),
			new kakao.maps.LatLng(37.57197551,127.0205551),
			new kakao.maps.LatLng(37.57207997,127.0209962),
			new kakao.maps.LatLng(37.5713947,127.0191843),
			new kakao.maps.LatLng(37.57215893,127.0213678),
			new kakao.maps.LatLng(37.57142888,127.0192478),
			new kakao.maps.LatLng(37.57172406,127.0198308),
			new kakao.maps.LatLng(37.57015026,127.0164684),
			new kakao.maps.LatLng(37.57210801,127.0211315),
			new kakao.maps.LatLng(37.57077685,127.0179757),
			new kakao.maps.LatLng(37.57011017,127.0163365),
			new kakao.maps.LatLng(37.57019149,127.0166074),
			new kakao.maps.LatLng(37.57216394,127.0214355),
			new kakao.maps.LatLng(37.57074755,127.0179317),
			new kakao.maps.LatLng(37.57060019,127.0176276),
			new kakao.maps.LatLng(37.57167001,127.019713),
			new kakao.maps.LatLng(37.57210442,127.0228103),
			new kakao.maps.LatLng(37.57216859,127.0223392),
			new kakao.maps.LatLng(37.57211636,127.0227369),
			new kakao.maps.LatLng(37.57037032,127.0171333),
			new kakao.maps.LatLng(37.57216873,127.0215082),
			new kakao.maps.LatLng(37.57026174,127.0168239),
			new kakao.maps.LatLng(37.57209467,127.0210653),
			new kakao.maps.LatLng(37.57195823,127.0204842),
			new kakao.maps.LatLng(37.57012955,127.0164019),
			new kakao.maps.LatLng(37.57017023,127.0165343),
			new kakao.maps.LatLng(37.57074267,127.0179095),
			new kakao.maps.LatLng(37.57175492,127.0198927),
			new kakao.maps.LatLng(37.57540383,126.9786815),
			new kakao.maps.LatLng(37.57527737,126.9787548),
			new kakao.maps.LatLng(37.57523394,126.9787793),
			new kakao.maps.LatLng(37.57544599,126.9786582),
			new kakao.maps.LatLng(37.57546727,126.9786463),
			new kakao.maps.LatLng(37.57542571,126.9786694),
			new kakao.maps.LatLng(37.57525565,126.9787674),
			new kakao.maps.LatLng(37.57521215,126.9787923),
			new kakao.maps.LatLng(37.57536163,126.9787049),
			new kakao.maps.LatLng(37.57531915,126.9787303),
			new kakao.maps.LatLng(37.575298,126.978742),
			new kakao.maps.LatLng(37.57538307,126.9786926),
			new kakao.maps.LatLng(37.57534073,126.9787157),
			new kakao.maps.LatLng(37.57185042,126.9844954),
			new kakao.maps.LatLng(37.57190485,126.9844778),
			new kakao.maps.LatLng(37.57214387,126.9844034),
			new kakao.maps.LatLng(37.57154559,126.9845935),
			new kakao.maps.LatLng(37.57169044,126.9845485),
			new kakao.maps.LatLng(37.57174492,126.9845305),
			new kakao.maps.LatLng(37.57179781,126.9845134),
			new kakao.maps.LatLng(37.57163668,126.9845657),
			new kakao.maps.LatLng(37.57195793,126.9844611),
			new kakao.maps.LatLng(37.56829903,126.9880723),
			new kakao.maps.LatLng(37.56829211,126.9885707),
			new kakao.maps.LatLng(37.56829666,126.9882176),
			new kakao.maps.LatLng(37.5682943,126.9884302),
			new kakao.maps.LatLng(37.56829785,126.9881457),
			new kakao.maps.LatLng(37.56830886,126.9891937),
			new kakao.maps.LatLng(37.56831363,126.9892663),
			new kakao.maps.LatLng(37.56829931,126.9890589),
			new kakao.maps.LatLng(37.56831662,126.9893367),
			new kakao.maps.LatLng(37.56829312,126.9885006),
			new kakao.maps.LatLng(37.56830587,126.989127),
			new kakao.maps.LatLng(37.56947712,126.9923344),
			new kakao.maps.LatLng(37.56909542,126.9923842),
			new kakao.maps.LatLng(37.56964546,126.9923151),
			new kakao.maps.LatLng(37.56904162,126.9923908),
			new kakao.maps.LatLng(37.56898596,126.9923954),
			new kakao.maps.LatLng(37.56887639,126.9924071),
			new kakao.maps.LatLng(37.56915109,126.9923777),
			new kakao.maps.LatLng(37.56882001,126.9924153),
			new kakao.maps.LatLng(37.56942229,126.9923412),
			new kakao.maps.LatLng(37.56959054,126.9923216),
			new kakao.maps.LatLng(37.56953264,126.9923284),
			new kakao.maps.LatLng(37.5689309,126.9924008),
			new kakao.maps.LatLng(37.58411794,126.9698478)
];    

var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

    
createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image
    });
    
    return marker;  
}   
   
// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createCoffeeMarkers() {
    
    for (var i = 0; i < coffeePositions.length; i++) {  
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(coffeePositions[i], markerImage);  
        
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
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 36),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(storePositions[i], markerImage);  

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
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 72),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(carparkPositions[i], markerImage);  

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
function changeMarker(type){
    
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
</body>
</html>