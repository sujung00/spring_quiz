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
</head>
<body>
	<div class="container">
		<header>
			<div class="display-4 text-center m-2"><a href="/booking/reserv_check_view" class="main">통나무 팬션</a></div>
		</header>
		<menu class="p-0 m-0">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link">객실보기</a></li>
				<li class="nav-item"><a href="/booking/reserv_view" class="nav-link">예약하기</a></li>
				<li class="nav-item"><a href="/booking/reserv_list_view" class="nav-link">예약목록</a></li>
			</ul>
		</menu>
		<section>
			<div>
				<img alt="배너 사진" src="/img/test06_banner1.jpg" class="w-100" id="bannerImage">
			</div>
			<div class="d-flex">
				<div class="col-4 text-div d-flex align-items-center justify-content-center">
					<div>
						<div class="display-4 text-white">실시간</div>
						<div class="display-4 text-white">예약하기</div>
					</div>
				</div>
				<div class="text-div2 col-4">
					<div class="p-3">
						<h3>예약확인</h3>
						<div class="form-group d-flex">
							<div class="d-flex align-items-center justify-content-end col-4">이름:</div>
							<input type="text" id="name" class="form-control">						
						</div>
						<div class="form-group d-flex">
							<div class="d-flex align-items-center justify-content-end col-4">전화번호:</div>
							<input type="text" id="phoneNumber" class="form-control">						
						</div>
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-success" id="checkBtn">조회하기</button>
						</div>
					</div>
				</div>
				<div class="col-4 text-div d-flex align-items-center justify-content-center">
					<div>
						<div class="text-white"><h3>예약문의:</h3></div>
						<div class="text-white"><h2>010-</h2></div>
						<div class="text-white"><h2>0000-1111</h2></div>
					</div>
				</div>
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
		
		 var bannerSrcArr = ['/img/test06_banner2.jpg', '/img/test06_banner3.jpg', '/img/test06_banner4.jpg', '/img/test06_banner1.jpg'];
         var currentIndex = 0;
         setInterval(function() {
             $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
             currentIndex++;

             if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
                 currentIndex = 0;
             }
         }, 3000); // 3초에 한번씩 함수 실행
         
         $("#checkBtn").on('click', function() {
        	 let name = $("#name").val().trim();
        	 let phoneNumber = $("#phoneNumber").val().trim();
        	 
        	 if(!name){
        		 alert("이름을 입력해주세요.");
        		 return;
        	 }
        	 if(!phoneNumber){
        		 alert("전화번호을 입력해주세요.");
        		 return;
        	 }
        	 
        	 $.ajax({
        		 type:"POST"
        		 , url:"/booking/reserv_check"
        		 , data:{"name":name, "phoneNumber":phoneNumber}
        	 
        	 	 , success:function(data) {
                	 if(data.code == 1){
                		 let date = 
                		 alert("이름: " + data.booking.name + 
                    			 "\n날짜: " + data.booking.date + 
                    			 "\n전화번호: " + phoneNumber +
                    			 "\n일수: " + data.booking.day +
                    			 "\n인원: " + data.booking.headcount +
                    			 "\n상태: " + data.booking.state);
                	 } else {
                		 alert(data.message);
                	 }
        	 	 }
        	 	, error:function(request, status, error) {
					alert("예약 확인에 실패했습니다. 관리자에게 문의해주세요.");
				}
        	 })
         });
	});
</script>
</body>
</html>