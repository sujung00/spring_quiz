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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/lesson05/style1.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="d-flex">
			<menu class="w-25 bg-primary m-0">
				<div class="mt-2"><img alt="footer" src="/img/header.jpg" width="100px"></div>
				<div class="mt-4">
					<ul class="nav flex-column">
                        <li class="font-weight-bold"><a href="#" class="nav-link">날씨</a></li>
                        <li class="font-weight-bold"><a href="#" class="nav-link">날씨입력</a></li>
                        <li class="font-weight-bold"><a href="#" class="nav-link">테마날씨</a></li>
                        <li class="font-weight-bold"><a href="#" class="nav-link">관측 기후</a></li>
                    </ul>
				</div>
			</menu>
			<section class="w-75 ml-4 mt-3">
				<h3>과거 날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${history}" var="weather">
						<tr>
							<td>
								<fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd" var="date1"/>
								<fmt:formatDate value="${date1}" pattern="yyyy년 MM월 dd일"/>
							</td>
							<td>
								<c:choose>
									<c:when test="${weather.weather == '맑음'}">
										<img alt="맑음" src="/img/sunny.jpg">
									</c:when>
									<c:when test="${weather.weather == '구름조금'}">
										<img alt="맑음" src="/img/partlyCloudy.jpg">
									</c:when>
									<c:when test="${weather.weather == '흐림'}">
										<img alt="맑음" src="/img/cloudy.jpg">
									</c:when>
									<c:when test="${weather.weather == '비'}">
										<img alt="맑음" src="/img/rainy.jpg">
									</c:when>
									<c:otherwise>
										${weather.weather}
									</c:otherwise>
								</c:choose>
							</td>
							<td>${weather.temperatures}°C</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<footer>
			<div class="d-flex align-items-center ">
				<div class="w-25 d-flex justify-content-center"><img alt="footer" src="/img/footer.jpg" width="150px"></div>
				<div class="ml-3 text-secondary w-75">
					<div>(07062) 서울시 동작구 여의대방로16길 61</div>
					<div>Copyright@2020 KMA.All Rights RESERVED.</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>