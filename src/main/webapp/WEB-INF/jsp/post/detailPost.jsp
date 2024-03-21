<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<jsp:include page="/WEB-INF/jsp/common/memo-header-loggedIn.jsp" />
		<section class="contents d-flex justify-content-center align-items-center">
			<div class="contents-box">
				<div class="display-4 text-center"><b>메모 입력</b></div>
				<div class="d-flex align-items-center mt-4">
					<div class="h3 col-2"><b>제목 :</b></div>
					<input type="text" class="form-control">
				</div>
				<textarea class="form-control h-fixed-textarea mt-3"></textarea>
				<img width="100%" alt="메모 이미지" src="#">
				<div class="d-flex justify-content-between mt-3">
					<div class="d-flex justify-content-between col-5">
						<button type="button" class="btn btn-dark col-5">목록으로</button>
						<button type="button" class="btn btn-danger col-5">삭제</button>
					</div>
					<button type="button" class="btn btn-dark col-2">수정</button>
				</div>
			</div>			
		</section>
		<jsp:include page="/WEB-INF/jsp/common/memo-footer.jsp" />
		
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){

	});
</script>
</body>
</html>