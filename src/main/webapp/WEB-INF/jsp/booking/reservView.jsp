<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- AJAX를 사용하려면 jquery 원본 필요 -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/booking/reservListStyle.css" type="text/css">
<!-- datepicker 라이브러리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<header>
			<div class="display-4 text-center m-2">통나무 팬션</div>
		</header>
		<menu class="p-0">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link">객실보기</a></li>
				<li class="nav-item"><a href="/booking/reserv_view" class="nav-link">예약하기</a></li>
				<li class="nav-item"><a href="/booking/reserv_list_view" class="nav-link">예약목록</a></li>
			</ul>
		</menu>
		<section>
			<h2 class="text-center p-1">예약 하기</h2>
			<div class="col-6 container">
				<div class="form-group">
					<label for="name"><b>이름</b></label>
					<input type="text" id="name" class="form-control">
				</div>
				<div class="form-group">
					<label for="date"><b>예약날짜</b></label>
					<input type="text" id="date" class="form-control">
				</div>
				<div class="form-group">
					<label for="day"><b>숙박일수</b></label>
					<input type="text" id="day" class="form-control">
				</div>
				<div class="form-group">
					<label for="headcount"><b>숙박인원</b></label>
					<input type="text" id="headcount" class="form-control">
				</div>
				<div class="form-group">
					<label for="phoneNumber"><b>전화번호</b></label>
					<input type="text" id="phoneNumber" class="form-control">
				</div>
				<button type="button" class="btn btn-warning w-100" id="reservBtn">예약하기</button>
			</div>
		</section>
		<footer>
			<div>
				<small class="text-secondary">제주특별자치도 제주시 애월읍</small>
			</div>
			<div>
				<small class="text-secondary">사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목</small>
			</div>
			<div>
				<small class="text-secondary">Copyright 2025 tongnamu. All right reserved.</small>
			</div>
		</footer>
	</div>
	
<script>
	$(document).ready(function() {
		
		 // 모든 데이터피커에 적용
        $.datepicker.setDefaults({
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
            , dateFormat: 'yy-mm-dd'
        });

        // 오늘 날짜로 이동하는 함수
        $.datepicker._gotoToday = function(id) {
            $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
        };

        $('#date').datepicker({
            showButtonPanel: true // 오늘 버튼 노출
        });
		
		$("#reservBtn").on('click', function() {
			let name = $("#name").val().trim();
			let date = $("#date").val().trim();
			let day = $("#day").val().trim();
			let headcount = $("#headcount").val().trim();
			let phoneNumber = $("#phoneNumber").val().trim();
			
			$.ajax({
				
			})
			
		});
	});
</script>
</body>
</html>