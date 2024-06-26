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
		<div class="h1 text-center mt-5"><b>메모 보기</b></div>
			<div class="contents-box" data-post-id="${post.id }" id="contentsDiv" >
				<div class="d-flex align-items-center mt-4">
					<div class="h3 col-2"><b>제목 :</b></div>
					<input id="titleInput" type="text" class="form-control" value="${post.title }">
				</div>
				<textarea id="contentsTextarea" class="form-control h-fixed-textarea mt-3">${post.contents }</textarea>
				<c:if test="${not empty post.imagePath }">
				<img id="postImg" class="mt-3" width="100%" alt="메모 이미지" src="${post.imagePath }">
				</c:if>
				<div class="d-flex justify-content-between mt-3">
					<div class="d-flex justify-content-between col-5">
						<button onClick="location.href='/post/list-view'" type="button" class="btn btn-dark col-5">목록으로</button>
						<button id="deleteBtn" type="button" class="btn btn-danger col-5">삭제</button>
					</div>
					<button id="saveBtn" type="button" class="btn btn-dark col-2">수정</button>
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
		$("#deleteBtn").on("click", function(){
			let id = $("#contentsDiv").data("post-id");
			$.ajax({
				type:"delete"
				, url:"/post/delete"
				, data:{"id":id}
				, success:function(data){
					if(data.result == "success"){
						alert("삭제되었씁니다.");
						location.href = "/post/list-view";
					}else{
						alert("삭제 실패");
					}
				}
				, error:function(){
					alert("삭제 에러");
				}
			});
		});
		
		$("#saveBtn").on("click", function(){
			let title = $("#titleInput").val();
			let contents = $("#contentsTextarea").val();
			if(title == ""){
				alert("제목을 입려갛세요.");
				return;
			}
			if(contents == ""){
				alert("내용을 입력하세요.");
				return;
			}
			let id = $("#contentsDiv").data("post-id");
			$.ajax({
				type:"put"
				, url:"/post/update"
				, data:{"id":id, "title":title, "contents":contents}
				, success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("수정 실패");
					}
				}
				, error:function(){
					alert("수정 에러");
				}
			});
		});
	});
</script>
</body>
</html>