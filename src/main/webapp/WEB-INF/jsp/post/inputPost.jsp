<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo 입력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/memo-header.jsp" />
		<section class="contents d-flex align-items-center flex-column">
			<div class="h1 text-center mt-5"><b>메모 입력</b></div>
			<div class="contents-box">
				<div class="d-flex align-items-center mt-4">
					<div class="h3 col-2"><b>제목 :</b></div>
					<input id="titleInput" type="text" class="form-control" placeholder="제목을 입력해주세요.">
				</div>
				<textarea id="contentsTextarea" class="form-control h-fixed-textarea mt-3" placeholder="내용을 입력해주세요."></textarea>
				<input id="fileInput" type="file" accept="image/*" class="form-control mt-3">
				<div class="d-flex justify-content-between mt-3">
					<button onClick="location.href='/post/list-view'" type="button" class="btn btn-dark col-2">목록으로</button>
					<button id="saveBtn" type="button" class="btn btn-dark col-2">저장</button>
				</div>
			</div>			
		</section>
		<c:import url="/WEB-INF/jsp/include/memo-footer.jsp" />
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#saveBtn").on("click", function(){
			let title = $("#titleInput").val();
			let contents = $("#contentsTextarea").val();
			let file = $("#fileInput")[0].files[0];  //   files[0] : 0번째 파일
			if(title == ""){
				alert("제목을 입력하세요.");
				return;
			}else if(contents == ""){
				alert("내용을 입력하세요.");
				return;
			}
			
			let formData = new FormData();  // 파일을 포함한 데이터
			formData.append("title", title);
			formData.append("contents", contents);
			formData.append("imageFile", file);
			$.ajax({
				type:"post"
				, url:"/post/create"
				, data:formData
				, enctype:"multipart/form-data" // 파일 업로드 필수 옵션
				, processData:false				// 파일 업로드 필수 옵션
				, contentType:false				// 파일 업로드 필수 옵션
				, success:function(data){
					if(data.result == "success"){
						location.href = "/post/list-view";
					}else{
						alert("메모 작성 실패");
					}
				}
				, error:function(){
					alert("메모 작성 에러");
				}
			});
		});
	});
</script>
</body>
</html>