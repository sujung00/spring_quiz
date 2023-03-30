<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과거 날씨</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<!-- datepicker 라이브러리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/lesson05/style1.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="d-flex">
			<menu class="w-25 bg-primary m-0">
				<div class="mt-2">
					<img alt="footer" src="/img/header.jpg" width="100px">
				</div>
				<div class="mt-4">
					<ul class="nav flex-column">
						<li class="font-weight-bold"><a href="#" class="nav-link">날씨</a></li>
						<li class="font-weight-bold"><a href="#" class="nav-link">날씨입력</a></li>
						<li class="font-weight-bold"><a href="#" class="nav-link">테마날씨</a></li>
						<li class="font-weight-bold"><a href="#" class="nav-link">관측
								기후</a></li>
					</ul>
				</div>
			</menu>
			<section class="w-75 ml-4 mt-3">
				<h3>날씨 입력</h3>
				<div class="m-5 w-100">
					<form action="/weather/weatherInsert" method="post">
						<div class="d-flex justify-content-between">
							<div class="form-group d-flex align-items-center">
								<label for="date" class="w-25">날짜</label> <input type="text" id="date"
									name="date" class="form-control ml-2 mr-2">
							</div>
							<div class="form-group d-flex align-items-center">
								<label for="weather" class="w-50">날씨</label> <select
									id="weather" name="weather" class="form-control ml-2 mr-2">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="form-group d-flex align-items-center">
								<label for="microDust" class="w-100">미세먼지</label> <select
									id="microDust" name="microDust" class="form-control ml-2">
									<option>좋음</option>
									<option>보통</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between">
							<div class="d-flex">
								<label for="temperatures" class="w-25">기온</label>
								<div class="input-group">
									<input type="text" class="form-control" id="temperatures" name="temperatures">
									<div class="input-group-append">
										<span class="input-group-text">°C</span>
									</div>
								</div>
							</div>
							<div class="d-flex ml-3">
								<label for="temperatures" class="w-25">강수량</label>
								<div class="input-group">
									<input type="text" class="form-control" id="temperatures" name="temperatures">
									<div class="input-group-append">
										<span class="input-group-text">mm</span>
									</div>
								</div>
							</div>
							<div class="d-flex ml-3">
								<label for="temperatures" class="w-25">풍속</label>
								<div class="input-group">
									<input type="text" class="form-control" id="temperatures" name="temperatures">
									<div class="input-group-append">
										<span class="input-group-text">km/h</span>
									</div>
								</div>
							</div>
						</div>
						<div class="w-100 d-flex justify-content-end">
							<input type="submit" class="btn btn-success mt-2" value="저장">						
						</div>
					</form>
				</div>
			</section>
		</div>
		<footer>
			<div class="d-flex align-items-center ">
				<div class="w-25 d-flex justify-content-center">
					<img alt="footer" src="/img/footer.jpg" width="150px">
				</div>
				<div class="ml-3 text-secondary w-75">
					<div>(07062) 서울시 동작구 여의대방로16길 61</div>
					<div>Copyright@2020 KMA.All Rights RESERVED.</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>