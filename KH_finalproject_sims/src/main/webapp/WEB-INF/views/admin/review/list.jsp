<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 리스트</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
													<h5 class="m-b-10">리뷰관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>리뷰 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<form action="<%=request.getContextPath()%>/admin/review/list" method="post">
												<div class="row">
													<div class="col-sm-12">
														<div class="input-group">
															<label class="floating-label"></label>
															<select class="" name="searchOption">
																<option value="">선택</option>
																<option value="writer" <c:if test="${searchOption eq 'writer' }">selected</c:if>>작성자</option>
																<option value="content" <c:if test="${searchOption eq 'content' }">selected</c:if>>내용</option>
															</select>
															<input class="form-control" type="text" name="searchBox" value="${searchBox}">
															<div class="input-group-append">
																<button class="btn  btn-primary" type="submit">검색</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="card">
										<div class="card-body table-border-style">
											<div class="table-responsive">
												<table class="table table-hover">
													<thead>
														<tr class="text-center">
															<th>번호</th>
															<th>내용</th>
															<th>작성자</th>
															<th>작성일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${reviewlist}" var="review">
															<tr>
																<td class="text-center">${review.reviewNo}</td>
																<td>
																<c:choose>
														          <c:when test="${fn:length(review.reviewContent) > 40}">
														            <a href="<%=request.getContextPath()%>/admin/review/detail/${review.reviewNo }" class="">${fn:substring(review.reviewContent, 0, 40)}...&nbsp;</a>
														          </c:when>
														          <c:otherwise>
														            <a href="<%=request.getContextPath()%>/admin/review/detail/${review.reviewNo }" class="">${review.reviewContent}&nbsp;</a>
														          </c:otherwise>
														        </c:choose>  
													                <i class="fa${review.reviewStar < 1 ? '-regular' : '-solid'} fa-star" style="color: #ffdd00;"></i>
													                <i class="fa${review.reviewStar < 1.5 ? '-regular' : (review.reviewStar < 2 ? '-half-stroke' : '-solid')} fa-star" style="color: #ffdd00;"></i>
													                <i class="fa${review.reviewStar < 2.5 ? '-regular' : (review.reviewStar < 3 ? '-half-stroke' : '-solid')} fa-star" style="color: #ffdd00;"></i>
													                <i class="fa${review.reviewStar < 3.5 ? '-regular' : (review.reviewStar < 4 ? '-half-stroke' : '-solid')} fa-star" style="color: #ffdd00;"></i>
													                <i class="fa${review.reviewStar < 4.5 ? '-regular' : '-solid'} fa-star" style="color: #ffdd00;"></i>
																</td>
																<td class="text-center">${review.userId}</td>
																<td class="text-center"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/> </td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center">
													<li class="page-item"><a class="page-link" href="" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
													<li class="page-item"><a class="page-link" href="" aria-label="Previous">1</a></li>
													<li class="page-item"><a class="page-link" href="" aria-label="Previous">2</a></li>
													<li class="page-item"><a class="page-link" href="" aria-label="Previous">3</a></li>
													<li class="page-item"><a class="page-link" href="" aria-label="Previous"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
												</ul>
											</nav>
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
	<div class="row">
			
			
			<%-- 
			<div id="container">
				<div class="contain-area">
					<div class="content">
						<h1>공지사항관리</h1>
						
						<div class="contents">
							<div class="searchBox">
								<label for="searchbox">검색</label>
								<select class="search">
									<option>제목</option>
									<option>작성자</option>
									<option>내용</option>
								</select> 
								<input class="search" type="text" id="searchbox"> <input class="sims_btn" type="button" value="검색">
							</div>
						</div>
					</div>
				</div>
			</div>
			 --%>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
</html>