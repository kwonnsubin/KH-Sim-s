<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/biz/bizInfo.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/chain/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/chain/assets/css/templatemo-chain-app-dev.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/chain/assets/css/animated.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/chain/assets/css/owl.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/user/myinfo.css" />


</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	
	<div class="container" style="margin:-103px 0 -200px 0; padding:150px 0 380px 0;">
	<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
	

	<div class="container" style="margin-left:27%">
	
		<div class="container" style="margin-left: -139px;">
				<h2 class="tit">내 정보 보기</h2>
				<hr class="line">
		</div>
	
		<div class="text-center" style="margin-top: 70px;">
			<img src="${path}${imagePath}" onerror="this.onerror=null; this.src='https://www.dummyimage.com/600x400/000/fff.jpg&text=Please+upload+your+logo';" class="mx-auto"
				style="width: 35% !important" />
		</div>


		<div
			style="display: flex; flex-direction: column; position: relative;">
			<div style="margin-top: 5%;">
					<div class="d-flex">
						<div class="division-box">
							<span>기본정보</span>
						</div>
						<hr>
					</div>
				<table class="table" style="margin: 0;height: 360px;">
					<tbody>
						<tr>
							<th scope="row"><span>법인명</span></th>
							<td>${bizinfo.bizName }</td>
							<th scope="row"><span>대표자명</span></th>
							<td>${bizinfo.bizOwnerName }</td>
						</tr>
						<tr>
							<th scope="row"><span>사업자등록번호</span></th>
							<td>${bizinfo.bizCrn }</td>
							<th scope="row"><span>법인등록번호</span></th>
							<td>${bizinfo.bizSsn }</td>
						</tr>
						<tr>
							<th scope="row"><span>회사우편번호</span></th>
							<td colspan="3">${bizinfo.bizZipCode }</td>
						</tr>
						<tr>
							<th scope="row"><span>회사주소</span></th>
							<td colspan="3">${bizinfo.bizLocation }</td>
						</tr>
						<tr>
							<th scope="row"><span>전화</span></th>
							<td>${bizinfo.bizPhone }</td>
							<th scope="row"><span>팩스</span></th>
							<td>${bizinfo.bizFax }</td>
						</tr>
						<tr>
							<th scope="row"><span>이메일</span></th>
							<td>${bizinfo.bizEmail }</td>
							<th scope="row"><span>홈페이지</span></th>
							<td><a href="${bizinfo.bizHp }">${bizinfo.bizHp }</a></td>
						</tr>
					</tbody>
				</table>
			</div>


			<div style="margin-top: 5%;">
				<div class="d-flex" style="margin-top:4%;">
					<div class="division-box" >
						<span>상세정보</span>
					</div>
					<hr>
				</div>
				<table class="table" style="margin: 0; height: 390px;">
					<tr>
						<th scope="row"><span>개통 소요시간</span></th>
						<td>평균 ${bizinfo.phoneOpTime }일</td>
						<th scope="row"><span>개통 소요시간 (유심보유시)</span></th>
						<td>평균 ${bizinfo.phoneOpTimeUsim }일</td>
					</tr>

					<tr>
						<th scope="row"><span>카드 결제일</span></th>
						<td>${bizinfo.bizCardPayDate }일</td>
						<th scope="row"><span>계좌이체 결제일</span></th>
						<td>${bizinfo.bizAccPayDate }일</td>
					</tr>


					<tr>
						<th scope="row"><span>영업시간</span></th>
						<td>${bizinfo.bizBeginTime }~ ${bizinfo.bizEndTime }</td>
						<th scope="row"><span>휴무일</span></th>
						<td>${bizinfo.bizClosedDay }</td>
					</tr>

					<tr>
						<th scope="row"><span>지원통신망</span></th>
						<td colspan="3">${bizinfo.network }</td>
					</tr>

					<c:forEach var="service" items="${serviceList }">
						<tr>
							<th scope="row"><span>고객센터번호</span></th>
							<td colspan="1">
							<c:choose>
								<c:when test="${service.netNo eq 1}">
							      KT
							    </c:when>
									<c:when test="${service.netNo eq 2}">
							      SKT
							    </c:when>
									<c:when test="${service.netNo eq 3}">
							      LGU+
							    </c:when>
							</c:choose>
							</td>
							<c:if test="${not empty service.bizNetService}">
								<td colspan="2">${service.bizNetService}</td>
							</c:if>
							<c:if test="${empty service.bizNetService}">
								<td colspan="2">미운영</td>
							</c:if>

						</tr>
					</c:forEach>



				</table>
			</div>
		</div>


		<button type="button"
			onclick="location.href='<%=request.getContextPath()%>/biz/modifyInfo'"
			class="btn modyBtn">수정하기</button>

	</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- Scripts -->
	<script
		src="<%=request.getContextPath()%>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chain/assets/js/owl-carousel.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chain/assets/js/animation.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chain/assets/js/imagesloaded.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chain/assets/js/popup.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/chain/assets/js/custom.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/user/myinfo.js"></script>

</body>
</html>