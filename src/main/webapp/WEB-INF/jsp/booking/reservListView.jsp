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
		<menu class="p-0">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link">객실보기</a></li>
				<li class="nav-item"><a href="/booking/reserv_view" class="nav-link">예약하기</a></li>
				<li class="nav-item"><a href="/booking/reserv_list_view" class="nav-link">예약목록</a></li>
			</ul>
		</menu>
		<section>
			<h2 class="text-center p-1">예약 목록 보기</h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bookingList}" var="booking">
					<tr>
						<td>${booking.name}</td>
						<td>
							<fmt:parseDate value="${booking.date}" pattern="yyyy-mm-dd" var="date" />
							<fmt:formatDate value="${date}" pattern="yyyy년 m월 d일"/>
						</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state == '대기중'}">
									<span class="text-primary">${booking.state}</span>
								</c:when>
								<c:when test="${booking.state == '확정'}">
									<span class="text-success">${booking.state}</span>
								</c:when>
							</c:choose>
						</td>
						<td>
							<button type="button" class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
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
		$(".del-btn").on('click', function() {
			let id = $(this).data('booking-id');
			
			$.ajax({
				type:"POST"
				, url:"/booking/delete_booking"
				, data:{"id":id}
			
				, success:function(data){
					if(data.code == 1){
						location.reload(true); 						
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(request, status, error) {
					alert("예약 삭제에 실패했습니다. 관리자에게 문의해주세요.");
				}
			})
		});
	});
</script>
</body>
</html>