<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<header class="bg-info p-2">
			<h2 class="text-white ml-2">배탈의 민족</h2>
		</header>
		<section class="p-2">
			<span class="display-4">우리동네 가게</span>
		</section>
		<section>
		<c:forEach items="${storeList}" var="stores">
			<div class="border rounded border-info p-3 mb-3">
				<div><h3>${stores.name}</h3></div>
				<div>전화 번호 : ${stores.phoneNumber}</div>
				<div>주소 : ${stores.address}</div>
			</div>
		</c:forEach>
		</section>
		<footer>
			<hr>
			<h5>(주)우와한형제</h5>
			<span>고객센터 : 1500-1500</span>
		</footer>
	</div>
</body>
</html>