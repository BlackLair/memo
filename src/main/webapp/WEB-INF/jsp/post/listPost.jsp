<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="h1 text-center mt-5"><b>메모 리스트</b></div>
			<div class="contents-box">
				<table class="table text-center mt-4">
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="post" items="${postList }" varStatus="status">
							<tr>
								<td>${post.id }</td>
								<td><a href="/post/detail-view?id=${post.id }">${post.title }</a></td>
								
								<td><fmt:formatDate value="${post.createdAt }" pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-end">
					<button onClick="location.href = '/post/create-view'" type="button" class="btn btn-secondary mt-3">글쓰기</button>
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

	});
</script>
</body>
</html>