<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<title>질문 수정</title>
	
	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/qna.css">
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-sm">
			<div class="row box-myqna mx-auto">
				<div class="col-sm-12 p-2">
					<form action="${cpath }/faq/qnaupdate/${myqna.aqNo}" method="post" id="updateQna" onsubmit="return validForm()">
						<div class="py-2">
							<input type="text" name="aqTitle" value="${myqna.aqTitle }" class="border-0 w-100">
						</div>
						<hr>
						<div class="py-2">
							<textarea hidden="hidden" id="hiddenAa">${myqna.aqContent }</textarea>
							<textarea class="border-0 w-100" rows="10" name="aqContent" id="aq-content">${myqna.aqContent }</textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="text-end my-3">
				<button class="btn btn-secondary" type="button" onClick="history.back();">취소</button>
				<button class="btn btn-primary" type="submit" form="updateQna">수정</button>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>

	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	
	<script>
		function validForm() {
			var aaContent = document.getElementById("aq-content").value;
			var hiddenAa = document.getElementById("hiddenAa").value;
			if (aaContent == "") {
				alert("수정할 답변을 입력해주세요.");
				return false;
			} else if (aaContent == hiddenAa) {
				alert("수정할 내용이 없습니다.");
				return false;
			}
		}
	</script>
	
</body>
</html>