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
									<form id="reportStatusForm" action="<%=request.getContextPath()%>/admin/reviewreport/list" method="post" style="display: flex; justify-content: flex-end;">
									 <div class="btn-group btn-group-toggle mt-3 mb-3" data-toggle="buttons">
									    <label for="all" class="btn btn-primary">
									      <input type="radio" id="all" name="reportStatus" value="0">전체
									    </label>
									    <label for="not-confirmed" class="btn btn-primary">
									      <input type="radio" id="not-confirmed" name="reportStatus" value="1">미확인
									    </label>
									    <label for="rejected" class="btn btn-primary">
									      <input type="radio" id="rejected" name="reportStatus" value="2">삭제
									    </label>
									    <label for="deleted" class="btn btn-primary">
									      <input type="radio" id="deleted" name="reportStatus" value="3">반려
									    </label>
									  </div>					  							
									</form>
                                    <!-- 처리 상태별로 보기 버튼 {e} -->
									<div class="card" id="reviewRepostList">
										<div class="card-body table-border-style">
											<!-- 리스트 {s} -->
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
														<c:forEach var="reviewreport" items="${requestScope.paging.page}" varStatus="status">
															<tr>
																<td class="text-center">${paging.totalRowCount - ((paging.currentPage-1) * 10 + status.index)}</td>
																<td>
																	<a href="<%=request.getContextPath()%>/admin/reviewreport/detail/${reviewreport.reviewNo}" style="font-weight: bold;">${reviewreport.reportReason}</a>
																	<jsp:useBean id="now" class="java.util.Date" />
																	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowTime" scope="request"/>
																	<fmt:parseNumber value="${reviewreport.reportDate.time / (1000*60*60*24)}" integerOnly="true" var="reportDateTime" scope="request"/>
																	<c:if test="${nowTime - reportDateTime <= 3}">
																		<img src="<%=request.getContextPath()%>/resources/img/admin/new.png" width="12px" alt="new" />
																	</c:if>
																</td>															
																<td class="text-center">${reviewreport.bizId}</td>
																<td class="text-center"><fmt:formatDate value="${reviewreport.reportDate}" pattern="yyyy.MM.dd"/> </td>
																<td class="text-center" style="${reviewreport.reportStatus eq '미확인' ? 'color: red;' : ''}">
  																	${reviewreport.reportStatus}
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- 리스트 {e} -->
											<!-- 페이지 번호 {s} -->
											<nav aria-label="Page navigation example" id="pageNumber">
												<ul class="pagination justify-content-center">
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
														<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${path}/admin/reviewreport/list?p=${pNum }&reportStatus=${reportStatus}">${pNum }</a></li>
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
	     var selectedValue = "<%= request.getParameter("reportStatus") %>";
	     // 서버에서 전달된 선택값
	     
	     if (selectedValue) { // selectedValue가 존재하는 경우
	         $('input[type=radio][name=reportStatus][value="' + selectedValue + '"]').parent().addClass('active');
	     }

	     $('input[type=radio][name=reportStatus]').change(function() {
	       $('#reportStatus').val();
	       $('#reportStatusForm').submit(); // 폼 제출
	     });
	   });
</script>

</html>