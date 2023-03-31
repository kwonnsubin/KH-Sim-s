<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="./include/header.jsp" />
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
									<!-- 리뷰 리스트 -->
											<div class="col-xl-6 col-md-5">
								                <div class="card table-card">
								                    <div class="card-body p-0">
								                        <div class="table-responsive">
								                            <table class="table table-hover mb-0">
								                                <thead>
								                                    <tr>
								                                        <th>리뷰</th>
								                                    </tr>
								                                </thead>
								                               <c:forEach items="${bizReviewList}" var="bizReview">
									                                <tbody>
									                                    <tr>
									                                        <td>
																		        <c:choose>
																		          <c:when test="${fn:length(bizReview.reviewContent) > 15}">
																		            ${fn:substring(bizReview.reviewContent, 0, 15)}...
																		          </c:when>
																		          <c:otherwise>
																		            ${bizReview.reviewContent}
																		          </c:otherwise>
																		        </c:choose>  
									                                        </td>
									                                        <td>${bizReview.reviewDate}</td>
									                                    </tr>
									                                </tbody>
								                                </c:forEach>
								                            </table>
								                        </div>
								                    </div>
								                </div>
								            </div>
								     <!-- 질문/답변 리스트  -->  
											<div class="col-xl-6 col-md-5">
								                <div class="card table-card">
								                    <div class="card-body p-0">
								                        <div class="table-responsive">
								                            <table class="table table-hover mb-0">
								                                <thead>
								                                    <tr>
								                                        <th>질문/답변</th>
								                                    </tr>
								                                </thead>
								                               <c:forEach items="${bizReviewList}" var="bizReview">
									                                <tbody>
									                                    <tr>
									                                        <td>
																		        <c:choose>
																		          <c:when test="${fn:length(bizReview.reviewContent) > 15}">
																		            ${fn:substring(bizReview.reviewContent, 0, 15)}...
																		          </c:when>
																		          <c:otherwise>
																		            ${bizReview.reviewContent}
																		          </c:otherwise>
																		        </c:choose>  
									                                        </td>
									                                        <td>${bizReview.reviewDate}</td>
									                                    </tr>
									                                </tbody>
								                                </c:forEach>
								                            </table>
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
			</div>
		</div>
	</div>
</div>
<jsp:include page="./include/footer.jsp" />
</body>
</html>