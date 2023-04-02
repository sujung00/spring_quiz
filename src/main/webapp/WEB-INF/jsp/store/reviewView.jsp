<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/lesson05/storeStyle.css" type="text/css">
</head>
<body>
	<div class="container">
		<header class="bg-info p-2">
			<h2 class="text-white ml-2">배탈의 민족</h2>
		</header>
		<section class="p-2">
			<span class="display-4">${storeName} - 리뷰</span>
		</section>
		<section>
		<c:if test="${fn:length(reviews) != 0}">
			<c:forEach items="${reviews}" var="review">
				<div class="border rounded border-info p-3 mb-3">
					<div class="d-flex">
						<b class="mr-2">${review.userName}</b>
						<c:choose>
							<c:when test="${review.point == 0}">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 0.5}">
								<img alt="반만 채워진 별" src="/img/star_half.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 1}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 1.5}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="반만 채워진 별" src="/img/star_half.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 2}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 2.5}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="반만 채워진 별" src="/img/star_half.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 3}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 3.5}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="반만 채워진 별" src="/img/star_half.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 4}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="비어있는 별" src="/img/star_empty.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 4.5}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="반만 채워진 별" src="/img/star_half.png" width="15" height="15">
							</c:when>
							<c:when test="${review.point == 5}">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
								<img alt="채워진 별" src="/img/star_fill.png" width="15" height="15">
							</c:when>
						</c:choose>
					</div>
					<div class="text-secondary">
						<fmt:formatDate value="${review.updatedAt}" pattern="yyyy년 M월 d일" />
					</div>
					<div>${review.review}</div>
					<div class="mt-1">
						<span class="rounded p-1" id="menu">${review.menu}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${fn:length(reviews) == 0}">
			<div class="text-center"><h2>작성된 리뷰가 없습니다.</h2></div>
		</c:if>
		</section>
		<footer>
			<hr>
			<h5>(주)우와한형제</h5>
			<span>고객센터 : 1500-1500</span>
		</footer>
	</div>
</body>
</html>