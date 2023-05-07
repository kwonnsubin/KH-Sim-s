<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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

<title>${planDetail.bizName} | 요금제 상세 정보 | ${planDetail.planName} </title>
<link rel="stylesheet" href="${path}/resources/css/biz/planDetail.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
     <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>


	<div class="container" style="display: flex; margin: -103px 0 -200px 0; padding: 150px 0 380px 0;">
		<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>


	
	<div class="content fade-box">
				<h2 class="tit">요금제 상세정보</h2>
				<hr class="line">
	

	<div class="container">
		<table class="table" id="planDetail" style="width: 118%">
			<tr > 
				<th>
					<span>요금제명</span>
				</th>
				<td colspan="2">${planDetail.planName} </td>
				<th>
					<span>통신사명</span>
				</th>
				<td colspan="2">${planDetail.bizName}</td>
			</tr>
			<tr>
				<th>
					<span>통신망</span>
				</th>
				<td colspan="2">
				<c:choose>
					<c:when test="${planDetail.netNo eq 1}">
						KT
					</c:when>
					<c:when test="${planDetail.netNo eq 2}">
						SKT
					</c:when>
					<c:otherwise>
						LGU+
					</c:otherwise>
				</c:choose>
				</td>
				<th>
					<span>통신세대</span>
				</th>
				<td colspan="2">
				<c:choose>
					<c:when test="${planDetail.genNo eq 1}">
						5G
					</c:when>
					<c:when test="${planDetail.genNo eq 2}">
						LTE
					</c:when>
					<c:when test="${planDetail.genNo eq 3}">
						3G
					</c:when>
					<c:otherwise>
						LTE/3G
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					<span>기본료(원)</span>
				</th>
				<td colspan="2"><fmt:formatNumber value="${planDetail.planPrice}" pattern="#,##0" /></td> <!-- 천단위 구분 -->
				<th>
					<span>기본음성(분)</span>
				</th>
				<td colspan="2"><fmt:formatNumber value="${planDetail.planVoice}" pattern="#,##0" /></td>
			</tr>
			<tr>
				<th>
					<span>기본문자(건)</span>
				</th>
				<td colspan="2"><fmt:formatNumber value="${planDetail.planMessage}" pattern="#,##0" /></td>
				<th>
					<span>기본데이터(mb)</span>
				</th>
				<td colspan="2"><fmt:formatNumber value="${planDetail.planData}" pattern="#,##0" /></td>
			</tr>
			<tr>
				<th>
					<span>초과음성단가(초)</span>
				</th>
				<td>${planDetail.planVoiceOver}</td>
				<th>
					<span>초과문자단가(건)</span>
				</th>
				<td>${planDetail.planMessageOver}</td>
				<th>
					<span>초과데이터단가(mb)</span>
				</th>
				<td>${planDetail.planDataOver}</td>
			</tr>
			<!-- 수정된 적이 없으면 애초에 수정일자가 보이지 않게..  -->
			<c:if test="${not empty planDetail.planUpdateDate}">
			  <tr>
			    <th><span>수정일자</span></th>
			    <td>${planDetail.planUpdateDate}</td>
			  </tr>
			</c:if>
	
		</table>
	</div>
	
	
		<div class="btnGroup">
			<button class= "btn" onclick="location.href='${pageContext.request.contextPath}/biz/planList'">목록</button>
			<button class= "btn" onclick="location.href='${pageContext.request.contextPath}/biz/modifyPlan?planNo=${planDetail.planNo }'">수정</button>
			<button type="button" class="btn deleteBtn" data-bs-toggle="modal" data-bs-target="#deleteleModal"
					data-planno="${planDetail.planNo}">삭제</button>
		</div>
		
		<!-- 개별 요금제 삭제 Modal -->
			<div class="modal fade" id="deleteleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">요금제 삭제</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">요금제를 정말로 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<input type="hidden" id="selectedPlanNo">
							<button type="button" class="btn modalDelete btn-secondary"
								id="deletePostBtn">삭제</button>
							<button type="button" class="btn btn-primary"
								data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		
		
	</div>
</div>	


	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<script>
		$(document).ready(function() {

			$(".deleteBtn").click(function() {
				console.log($("#selectedPlanNo").val());
				console.log($(this).data("planno"));
				$("#selectedPlanNo").val($(this).data("planno"));
			});
			$('.btn.modalDelete').click(function() {
				console.log("모달창의 삭제 버튼을 누름");
				console.log('에이작스 전 planNo : ' + $("#selectedPlanNo").val());
				//	  var planNo = $('.deleteBtn').data('planNo');
				var planNo = $("#selectedPlanNo").val();
				$.ajax({
					url : "${pageContext.request.contextPath}/biz/deletePlan",
					type : "post",
					data : {
						planNo : planNo
					},
					success : function(result) {
						console.log('성공했을 때' + planNo);
						location.href="${pageContext.request.contextPath}/biz/planList"
					},
					error : function(xhr, status, error) {

						alert("에러가 발생했습니다.");
						console.log('에이작스 후 planNo : ' + planNo);
					}
				});
			});
		});
	</script>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
  	
	

</body>
</html>