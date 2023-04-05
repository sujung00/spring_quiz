<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- AJAX를 사용하려면 jquery 원본 필요 -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>즐겨 찾기 추가하기</h2>
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" id="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<div class="d-flex">
				<input type="text" id="url" class="form-control col-11">
				<button type="button" id="urlCheckBtm" class="btn btn-info ml-2 col-1">중복확인</button>
			</div>
			<small id="urlStatusArea"></small>
		</div>
		<input type="button" id="addBtn" class="btn btn-success w-100" value="추가">
	</div>

<script>
	$(document).ready(function() {
		
		$("#urlCheckBtm").on("click", function() {
			$('#urlStatusArea').empty();
			let url = $("#url").val().trim();

			//validation
			$.ajax({
				type:"GET"
				, url:"/lesson06/quiz02/is_duplication"
				, data:{"url":url}
			
				, success:function(data){
					if(data.isDuplication){
						$("#urlStatusArea").append('<span class="text-danger" id="danger">중복된 url 입니다.</span>');
					} else {
						$("#urlStatusArea").append('<span class="text-success" id="success">저장 가능한 url 입니다.</span>');
					}
				}
				, error:function(request, status, error) {
					alert("중복 확인에 실패했습니다. 관리자에게 문의해주세요.");
				}
			})
		});
		
		$("#addBtn").on("click", function() {
			let name = $("#name").val().trim();
			let url = $("#url").val().trim();
			
			if(!name){
				alert("제목을 추가해주세요.");
				return;
			}
			if(!url) {
				alert("주소를 추가해주세요.");
				return;
			}
			// http도 아니고 https도 아닐 때 잘못된 주소
			if(!url.startsWith('http://') && !url.startsWith('https://')){
				alert("주소 형식이 잘못되었습니다.");
				 return;
			}
			//저장 가능한 url일 때만 추가 가능
			let urlStatus = $("#urlStatusArea").children().attr("id")
			if(urlStatus == 'danger' || urlStatus == null){
				alert("url을 확인해주세요.");
				return;
			}
			
			$.ajax({
				//request
				type:"POST"
				, url:"/lesson06/quiz01/add_bookmark"
				, data:{"name":name, "url":url}
			
				//response
				, success:function(data) { // jquery ajax 함수가 json string을 object로 파싱해줌
					if(data.code == 1) {
						location.href="/lesson06/quiz01/result_view"
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(request, status, error) {
					alert(request);
					alert(status);
					alert(error);
				}
			});
		});
		
	});
</script>
</body>
</html>