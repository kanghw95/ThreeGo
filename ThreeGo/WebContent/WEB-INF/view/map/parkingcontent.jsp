<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>글읽기</h1>
	<form id="frm">
		<input type="hidden" name="addr" value="${parkingcontent.addr }">
		<input type="hidden" name="add_rates" value="${parkingcontent.add_rates }">
		<input type="hidden" name="add_time_rate" value="${parkingcontent.add_time_rate }">
		<input type="hidden" name="capacity" value="${parkingcontent.capacity }">
		<input type="hidden" name="parking_code" value="${parkingcontent.parking_code }">
		<input type="hidden" name="day_maximum" value="${parkingcontent.day_maximum }">
		<input type="hidden" name="fulltime_monthly" value="${parkingcontent.fulltime_monthly }">
		<input type="hidden" name="holiday_begin_time" value="${parkingcontent.holiday_begin_time }">
		<input type="hidden" name="holiday_end_time" value="${parkingcontent.holiday_end_time }">
		<input type="hidden" name="holiday_pay_nm" value="${parkingcontent.holiday_pay_nm }">
		<input type="hidden" name="lat" value="${parkingcontent.lat }">
		<input type="hidden" name="lng" value="${parkingcontent.lng }">
		<input type="hidden" name="parking_name" value="${parkingcontent.parking_name }">
		<input type="hidden" name="night_free_open" value="${parkingcontent.night_free_open }">
		<input type="hidden" name="night_free_open_nm" value="${parkingcontent.night_free_open_nm }">
		<input type="hidden" name="operation_rule" value="${parkingcontent.operation_rule }">
		<input type="hidden" name="operation_rule_nm" value="${parkingcontent.operation_rule_nm }">
		<input type="hidden" name="pay_nm" value="${parkingcontent.pay_nm }">
		<input type="hidden" name="pay_yn" value="${parkingcontent.pay_yn }">
		<input type="hidden" name="rates" value="${parkingcontent.rates }">
		<input type="hidden" name="saturday_pay_nm" value="${parkingcontent.saturday_pay_nm }">
		<input type="hidden" name="saturday_pay_yn" value="${parkingcontent.saturday_pay_yn }">
		<input type="hidden" name="sync_time" value="${parkingcontent.sync_time }">
		<input type="hidden" name="tel" value="${parkingcontent.tel }">
		<input type="hidden" name="time_rate" value="${parkingcontent.time_rate }">
		<input type="hidden" name="parking_type" value="${parkingcontent.parking_type }">
		<input type="hidden" name="parking_type_nm" value="${parkingcontent.parking_type_nm }">
		<input type="hidden" name="weekday_begin_time" value="${parkingcontent.weekday_begin_time }">
		<input type="hidden" name="weekday_end_time" value="${parkingcontent.weekday_end_time }">
		<input type="hidden" name="weekend_begin_time" value="${parkingcontent.weekend_begin_time }">
	</form>
		
</body>
</html>