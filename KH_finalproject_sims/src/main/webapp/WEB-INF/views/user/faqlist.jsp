<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h2>알뜰폰 궁금한 점 무엇이든 물어보세요</h2>
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://dummyimage.com/30x10" class="d-block w-100" alt="...">
					<div class="carousel-caption">
						<span>자주묻는질문</span>
					</div>
				</div>
			<c:forEach items="${list}" var="faq">
				<div class="carousel-item">
					<img src="https://dummyimage.com/30x10" class="d-block w-100" alt="...">
					<div class="carousel-caption">
						<span>${faq.faqNo}</span>
						<a href="<%=request.getContextPath()%>/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a>
						<a href="<%=request.getContextPath()%>/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container-sm">
		<table class="table table-hover table-group-divider mt-3 mb-3">
			<thead class="table-light text-center">
			<tr>
				<th class="text-center">번호</th>
				<th>제목</th>
			</tr>
			</thead>
 			<c:forEach items="${list}" var="faq">
				<tbody>
					<tr>
						<td class="text-center">${faq.faqNo}</td>
						<td class="text-center"><a href="<%=request.getContextPath()%>/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a></td>
					</tr>
				</tbody>
 			</c:forEach>
		</table>
	</div>
</body>
</html>