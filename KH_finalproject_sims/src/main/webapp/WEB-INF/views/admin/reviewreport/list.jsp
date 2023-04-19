<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 신고관리 리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
	<div class="pcoded-main-container">	
		<div class="pcoded-wrapper container">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<div class="pcoded-inner-content">
						<div class="main-body">
							<div class="page-wrapper">
								<div class="page-header">
									<div class="page-block">
										<div class="row align-items-center">
											<div class="col-md-12">
												<div class="page-header-title">
													<h5 class="m-b-10">신고관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>신고 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<!-- 검색 {s} -->
									<div class="card" style="margin: 0;">
										<div class="card-body">
											<form action="<%=request.getContextPath()%>/admin/reviewreport/list" method="post">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="floating-label"></label>
															<select class="" name="searchType">
																<option value="">선택</option>
																<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>신고사유</option>
																<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>통신사</option>
																<option value="content" <c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
															</select>
															<input class="form-control" type="text" name="keyword" value="${keyword}">
															<div class="input-group-append">
																<button class="btn  btn-primary" type="submit">검색</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 {e} -->
									<!-- 처리 상태별로 보기 버튼 {s} -->
									<div class="btn-group mb-2" role="group" aria-label="Basic example">
										<button type="button" class="btn  btn-secondary" id="not-confirmed">미확인</button>
										<button type="button" class="btn  btn-secondary" id="rejected">반려</button>
										<button type="button" class="btn  btn-secondary" id="deleted">삭제</button>
									</div>
                                    <!-- 처리 상태별로 보기 버튼 {e} -->
									<div class="card">
										<div class="card-body table-border-style">
											<div class="table-responsive">
												<table class="table table-hover">
													<thead>
														<tr class="text-center">
															<th>번호</th>
															<th>신고사유</th>
															<th>통신사</th>
															<th>신고일자</th>
															<th>처리상태</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="reviewreport" items="${requestScope.paging.page}">
															<tr>
																<td class="text-center">${reviewreport.reviewNo}</td>
																<td><a href="<%=request.getContextPath()%>/admin/reviewreport/detail/${reviewreport.reviewNo}">${reviewreport.reportReason}</a></td>															
																<td class="text-center">${reviewreport.bizId}</td>
																<td class="text-center"><fmt:formatDate value="${reviewreport.reportDate}" pattern="yyyy.MM.dd"/> </td>
																<td class="text-center">${reviewreport.reportStatus}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- 페이지 번호 {s} -->
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
													<c:choose>
														<c:when test="${requestScope.paging.prevPage eq -1 }">
															<li class="page-item disabled"><a class="page-link">prev</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
															 href="${path}/admin/reviewreport/list?p=${requestScope.paging.prevPage }">prev</a></li>
														</c:otherwise>
													</c:choose>
													<c:forEach var="pNum" items="${requestScope.paging.pageList }">
														<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" 
														href="${path}/admin/reviewreport/list?p=${pNum }">${pNum }</a></li>
													</c:forEach>
													<c:choose>
														<c:when test="${requestScope.paging.nextPage eq -1 }">
															<li class="page-item disabled"><a class="page-link">next</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
															 href="${path}/admin/reviewreport/list?p=${requestScope.paging.nextPage }">next</a></li>
														</c:otherwise>
													</c:choose>
												</ul>
											</nav>
											<!-- 페이지 번호 {e} -->
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
<script type="text/javascript">

  $(document).ready(function() {
    $('#not-confirmed').on("click", function() {
      // 서버에 선택된 처리상태 값을 전송
      var reportStatus = 1;
      sendReportStatus(reportStatus);
    });
  
    $('#deleted').on("click", function() {
      // 서버에 선택된 처리상태 값을 전송
      var reportStatus = 2;
      sendReportStatus(reportStatus);
    });

    $('#rejected').on("click", function() {
      // 서버에 선택된 처리상태 값을 전송
      var reportStatus = 3;
      sendReportStatus(reportStatus);
    });

    function sendReportStatus(reportStatus) {
      $.ajax({
        url: '<%=request.getContextPath()%>/admin/reviewreport/list',
        type: 'GET',
        data: {
        	reportStatus: reportStatus
        },
        success: function(data) {
			console.log(data);
        },
        error: function() {
        	alert("오류가 발생했습니다.");
        }
      });
    }
  });
  
</script>

</html>