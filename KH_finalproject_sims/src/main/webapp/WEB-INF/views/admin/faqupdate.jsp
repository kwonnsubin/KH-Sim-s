<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 작성 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<%-- <form:form action="faqupdate/${faqlist.faqNo}" method="post"> <- 왜 이렇게 오류나는건지 이해가 안갑니다.. --%>
 		<form:form action="../faqupdate/${faqlist.faqNo}" method="post"> <!-- 해결 : 상대경로이용 -->
		
			<div class="mb-3 row">
		   		<label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
		    	<div class="col-sm-10">
		    		<input type="hidden" class="form-control" value="${username}" name="adminId">
		    		<input type="hidden" class="form-control" value="${faqlist.faqNo}" name="faqNo">		    		
			      	<input type="text" class="form-control" name="faqTitle" value="${faqlist.faqTitle}">
		    	</div>
		  	</div>
				<div class="mb-3">
		  			<label for="exampleFormControlTextarea1" class="form-label "></label>
		  			<textarea class="form-control" rows="3" style="height: 500px;" name="faqContent">${faqlist.faqContent}</textarea>
				</div>
				
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-outline-dark">돌아가기</button>		
					</div>
					<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-outline-dark">저장</button>		
					</div>
 					<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-outline-dark" id="delete_btn">삭제</button>		
					</div>
				</div>
		</form:form>
				<a href="<%=request.getContextPath()%>/admin/faqdelete/${faqlist.faqNo}">삭제</a>	
	</div>
</body>

<%--  <script type="text/javascript">
	$("#delete_btn").on("click", function(e){
		
		location.href="<%=request.getContextPath()%>/admin/faqdelete/${faqlist.faqNo}";
	})
</script>  --%>


</html>