<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/common/memo-header.jsp" />
		<section class="contents d-flex justify-content-center align-items-center">
			<div class="user-box">
				<input id="idInput" type="text" class="form-control" placeholder="Username">
				<input id="passwordInput" type="password" class="form-control mt-2" placeholder="Password">
				<button id="loginBtn" type="button" class="form-control mt-2 btn-secondary text-white">로그인</button>
				<a class="text-center d-block mt-4" href="/user/join-view">회원가입</a>
			</div>
		</section>
		<jsp:include page="/WEB-INF/jsp/common/memo-footer.jsp" />
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#loginBtn").on("click", function(){
			let id = $("#idInput").val();
			let password = $("#passwordInput").val();
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
			}else if(password == ""){
				alert("패스워드를 입력하세요.");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/user/login"
				, data:{"loginId":id, "password":password}
				, success:function(data){
					if(data.result == "success"){
						location.href = "/post/list-view";
					}else{
						alert("일치하는 계정이 없습니다.");
					}
				}
				, error:function(request, status, error){
					alert("code:" + code + "\n" + "error:" + error);
				}
			});
			
		});
	});
</script>
</body>
</html>