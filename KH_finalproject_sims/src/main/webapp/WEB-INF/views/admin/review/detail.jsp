<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/reviewDetail.css"/>
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
												<h5 class="m-b-10">리뷰 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>리뷰 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>리뷰 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input id="delete-btn" class="btn btn-primary right m-l-10" type="button" value="삭제">
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/review/list'" value="목록">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<form>
				                                    <div class="form-group row d-flex justify-content-between">
				                                    	<label for="bizId" class="col-sm-1 col-form-label left" style="font-weight: bold;">통신사</label>
				                                        <div class="col-sm-2">
				                                            <input type="text" readonly class="form-control-plaintext" name="bizId" value="${reviewdetail.bizId }">
				                                        </div>
				                                        <label for="adminId" class="col-sm-1 col-form-label left" style="font-weight: bold;">작성자</label>
				                                        <div class="col-sm-2">
				                                            <input type="text" readonly class="form-control-plaintext" name="adminId" value="${reviewdetail.userId }">
				                                        </div>
				                                        <label for="staticEmail" class="col-sm-1 col-form-label" style="font-weight: bold;">작성일</label>
				                                        <div class="col-sm-2">
				                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${reviewdetail.reviewDate }" pattern="yyyy.MM.dd"/>">
				                                        </div>
						                                <div class="col-sm-2 d-flex align-items-center">
							                            	<c:forEach var="i" begin="1" end="5">
																<i class="fa${(reviewdetail.reviewStar)/2 >= i ? '-solid fa-star' : ((reviewdetail.reviewStar)/2 >= (i - 0.5) ? '-star-half-stroke fa-regular' : '-regular fa-star')}" style="color: #ffdd00; align-items: center;"></i>
															</c:forEach>
				                          				</div>
				                                    </div>
				                                </form>
			                                </div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly style="background-color: white;">${reviewdetail.reviewContent }</textarea>
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
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
<script>
$(function() {
	  $('#delete-btn').click(function() {
	    if (confirm("리뷰를 삭제하시겠습니까?")) {
			var reviewNo = ${reviewdetail.reviewNo};    	
		    $.ajax({
			      type: 'POST',
			      url: '<%=request.getContextPath()%>/admin/review/delete',
			      data: {reviewNo: reviewNo},
			      success: function(result) {
						alert('삭제 처리되었습니다.');
						location.href = '<%=request.getContextPath()%>/admin/review/list'; // 페이지 이동
			      },
			      error: function() {
			        alert('오류가 발생하였습니다.');
			      }
		   	 });
	    	}
	 	 });
	});
</script>
</body>
</html>