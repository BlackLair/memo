<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/memo-header.jsp" />
		<section class="contents d-flex justify-content-center">
			<div class="user-box my-5">
				<h2 class="text-center mt-4">회원가입</h2>
				<input type="text" placeholder="Username" class="form-control mt-4" id="idInput">
				<input type="password" placeholder="비밀번호" class="form-control mt-3" id="passwordInput">
				<input type="password" placeholder="비밀번호 확인" class="form-control mt-3" id="passwordConfirmInput">
				<input type="text" placeholder="이름" class="form-control mt-3" id="nameInput">
				<input type="text" placeholder="이메일 주소" class="form-control mt-3" id="emailInput">
				<button type="button" class="form-control btn-secondary mt-3" id="joinBtn">가입</button>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/memo-footer.jsp" />
	</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#joinBtn").on("click", function(){
			let id = $("#idInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			if(name == ""){
				alert("이름을 입력하세요.");
				return;
			}
			if(email == ""){
				alert("이메일을 입력하세요.");
				return;
			}
			$.ajax({
				type:"post"
				, url:"/user/join"
				, data:{"loginId":id, "password":password, "name":name, "email":email}
				, success:function(data){
					if(data.result == "success"){
						location.href = "/user/login-view";
					}else{
						alert("회원가입 실패");
					}
				}
				, error:function(){
					alert("회원가입 에러");
				}
			});
		});
	});
</script>
</body>
</html>