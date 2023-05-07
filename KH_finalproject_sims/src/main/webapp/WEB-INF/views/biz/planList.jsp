<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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

<title>${bizName.bizName} | 요금제 현황</title>
<link rel="stylesheet" href="${path}/resources/css/biz/planList.css" />
<link rel="stylesheet" href="${path}/resources/css/font.css"/>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

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

<!-- Material Icons 라이브러리 추가 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container" style="display: flex; margin: -103px 0 -200px 0; padding: 150px 0 380px 0;">

		<jsp:include page="/WEB-INF/views/biz/nav.jsp" />

		<div class="content">
			
			<div class="container" style="margin-left: -139px;">
				<h2 class="tit">${bizName.bizName}의 요금제 목록</h2>
				<hr class="line">
			</div>
			
			<div class="searchTop">
				<form action="${path}/biz/planList" class="listSelect">
					<select class="form-select" style="width: 100px" name="cnt"
						onchange="submit();">
						<c:forEach var="num" begin="5" end="30" step="5">
							<option value="${num }"
								${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num }
								개</option>
						</c:forEach>
					</select>
				</form>

				<!-- search{s} -->
				<div class="input-group"
					style="width: auto; height: 20%; padding-right: 60px; margin-left: -10%;">

					<div style="display: flex;">
						<input class="form-control"
							style="display: inline-block; width: 300px;" type="text"
							name="keyword" id="keyword" placeholder="요금제명을 검색하세요.">
						<button name="searchBtn" class="btn btn-outline-primary"
							id="searchBtn">
							<span class="material-symbols-outlined"> search </span>
						</button>

					</div>
				</div>
				<!-- search{e} -->
			</div>


			<div style="display: inline-flex; width: 183%; margin-top: 4%;">
				<div style="width: 253%">
					<span class="count float-1 totalMent">총 ${vo} 건의 결과가 있습니다.</span>
				</div>

				<div class="regBtn" style="width: 116%">
					<button type="button" class="btn" onclick="registerBtn(this);">요금제
						등록하기</button>
				</div>
			</div>

			<%
				if (request.getParameter("keyword") != null && !request.getParameter("keyword").isEmpty()) {
			%>
			<span>"<%=request.getParameter("keyword")%>"의 검색 결과입니다.
			</span>
			<%
				}
			%>

			<table class="table table-hover" id="planTb" style="width: 148%;">
				<thead>
					<tr class="text-center mx-auto" style="background-color: #ecf7fd;">
						<th style="width: 6%"><input class="form-check-input" id="allCheck"
							type="checkbox" name="allCheck" /></th>
						<th>번호</th>
						<th>요금제명</th>
						<th>등록일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ empty requestScope.paging.page}">
						
						<c:if test="${requestScope.paging.pageList.size() eq 0}">
							<tr>
								<td colspan="4">등록된 요금제가 없습니다.</td>
							</tr>
						</c:if>
						<!-- pageList로 page 존재 유무 확인, 배열의 크기가 0보다 크면 그 이전 페이지로 이동.  -->
						<c:if test="${requestScope.paging.pageList.size() gt 0}">
							<% String p = request.getParameter("p"); 
							   String keyword = request.getParameter("keyword");
							   int intValueOfP = Integer.parseInt(p); // 문자열 p를 정수로 변환
							   int pMinusOne = intValueOfP - 1; // p-1 계산하여 새로운 변수에 할당 
							   response.sendRedirect(request.getContextPath() + "/biz/planList?p="+pMinusOne+"&keyword="+keyword); %>
						</c:if>
					</c:if>
					
					<c:if test="${not empty requestScope.paging.page}">
						<c:forEach var="plan" items="${requestScope.paging.page}">
							<tr class="text-center mx-auto">
								<td><input class="form-check-input" name="RowCheck"
									type="checkbox" value="${plan.planNo }" /></td>
								<td>${plan.rn }</td>
								<td><a
									href="<%=request.getContextPath()%>/biz/planDetail?planNo=${plan.planNo }">${plan.planName }</a></td>
								<td>${plan.planDate }</td>
								<td>
									<button type="button" class="btn"
										onclick="location.href=
	                    '${pageContext.request.contextPath}/biz/modifyPlan?planNo=${plan.planNo }'">수정</button>
									<button type="button" class="btn deleteBtn"
										data-bs-toggle="modal" data-bs-target="#deleteleModal"
										data-planno="${plan.planNo}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>


			<!-- 체크박스를 통한 선택삭제-->
			<div style="margin-top:2%;">
				<input type="button" value="선택삭제" class="btn checkDeleteBtn"
					onclick="deleteValue(event);" id="checkDeleteBtn" />
				<!-- data-bs-toggle="modal" data-bs-target="#checkDelete" -->
			</div>
			<!-- 선택삭제 Modal -->
			<div class="modal fade" id="checkDelete" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">선택한 요금제
								삭제</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">선택한 요금제들을 정말로 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary checkDelete-modal">삭제</button>
						</div>
					</div>
				</div>
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





			<!-- 페이지 번호 -->
			<c:if test="${not empty requestScope.paging.page}">
				<!-- 요금제가 하나도 없으면 페이징X -->
				<ul class="pagination" style="position: absolute;">
					<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
					<c:choose>
						<c:when test="${requestScope.paging.prevPage eq -1 }">
							<li class="page-item disabled"><a class="page-link">prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${path}/biz/planList?p=${requestScope.paging.prevPage }&keyword=${keyword }">prev</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="pNum" items="${requestScope.paging.pageList }">
						<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a
							class="page-link"
							href="${path}/biz/planList?p=${pNum }&keyword=${keyword }">${pNum }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${requestScope.paging.nextPage eq -1 }">
							<li class="page-item disabled"><a class="page-link">next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${path}/biz/planList?p=${requestScope.paging.nextPage }&keyword=${keyword }">next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</c:if>
		</div>

	</div>

	<script>
	function registerBtn(){
		location.href="<%=request.getContextPath()%>/biz/registerPlan";
	}
</script>

	<script>
	$(document).on('click','#searchBtn', function(e){
		e.preventDefault();
		var url ="<%=request.getContextPath()%>/biz/planList";
			url = url + "?keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});
	</script>

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
						location.reload();
					},
					error : function(xhr, status, error) {

						alert("에러가 발생했습니다.");
						console.log('에이작스 후 planNo : ' + planNo);
					}
				});
			});
		});
	</script>

	<script>
		$(function() {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheck']").click(function() { //상단의 체크박스 선택시 모든 체크박스가 체크됨
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked; //이때 this는 이벤트가 발생한 체크박스 요소
				}
			});
			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;//모든 "RowCheck"가 체크되면 "allCheck"도 체크되게 함. 
				} else { // RowCheck가 모두 선택되어있지 않다면 allCheck 체크 선택 해제하게 함.
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});

		function deleteValue(event) {
			var url = "/biz/deleteChkBox" // 컨트롤러로 보내고자 하는 url
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { // 선택되어 있으면 배열에 값을 저장
					valueArr.push(list[i].value);
					console.log(valueArr);
				}
			}

			if (valueArr.length == 0) {
				alert("선택된 글이 없습니다.");
				//모달창이 아예 작동하지않도록 함. 
				$('#checkDeleteBtn').removeAttr('data-bs-toggle data-bs-target');
			} else {
				$('#checkDeleteBtn').attr({
					'data-bs-toggle' : 'modal',
					'data-bs-target' : '#checkDelete'
				});
				$('#checkDelete').modal('show');
				console.log(valueArr);
				// 모달의 삭제 버튼 클릭시 이벤트 처리
				$('.checkDelete-modal').on('click', function() {
					// 선택된 값 컨트롤러로 전송
					$.ajax({
						url : "${pageContext.request.contextPath}" + url,
						type : 'post',
						traditional : true //적어주는 거 잊지말 것. ajax 배열 넘기기 옵션!
						,
						data : {
							valueArr : valueArr
						},
						success : function(result) {
							alert("삭제가 되었습니다.");
							location.reload();
						},
						error : function(xhr, status, error) {
							alert("에러가 발생했습니다.");
						}

					});
				});

				$('#checkDeleteBtn').removeAttr('data-bs-toggle data-bs-target'); //속성 다시 제거해서 바로 다음 미체크시 모달창 작동 막음 

			}

		}
	</script>


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