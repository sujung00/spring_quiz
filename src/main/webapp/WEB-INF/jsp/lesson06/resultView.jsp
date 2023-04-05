<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- AJAX를 사용하려면 jquery 원본 필요 -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>즐겨 찾기 목록</h2>
		<table class="table" id="bookmarkTable">
			<thead>
				<tr>
					<th>NO.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${bookmarks}" var="bookmark" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${bookmark.name}</td>
					<td>${bookmark.url}</td>
					<td>
						<%-- <button type="button" class="del-btn btn btn-danger" id="${bookmark.id}">삭제</button> --%>
						<button type="button" class="del-btn btn btn-danger" data-bookmark-id="${bookmark.id}">삭제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>

<script>
	$(document).ready(function() {
		/* $(".del-btn").on("click", function(e) {
			let id = e.target.value // javascript
			//let id = $(this).attr("id") // jquery
			
			$.ajax({
				type:"POST"
				, url:"/lesson06/quiz02/delete_url"
				, data:{"id":id}
			
				, success:function(data){
					//화면 새로고침
					if(data.code == 1){
						// $("#bookmarkTable").load(location.href+" #bookmarkTable");
						location.reload();
					} else {
						alert("삭제에 실패했습니다.");
					}
				}
				, error:function(request, status, error) {
					alert(request);
					alert(status);
					alert(error);
				}
			});
			
		}); */
		
		// data를 활용
		// data-bookmark-id  태그에 값을 심어 놓는다.
		// data-  그 뒤부터는 이름을 직접 짓는다.(대문자 불가능!! camel 불가능!!)
		// 스크립트 : $(this).data('bookmark-id');
		$('.del-btn').on('click', function() {
			let id = $(this).data('bookmark-id');
			
			$.ajax({
				type:"POST"
				, url:"/lesson06/quiz02/delete_url"
				, data:{"id":id}
			
				, success:function(data){
					//화면 새로고침
					if(data.code == 1){
						// $("#bookmarkTable").load(location.href+" #bookmarkTable");
						// location.href() 이용하면 스크롤이 젤 위로 올라감
						location.reload(true); 
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(request, status, error) {
					alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>
</html>