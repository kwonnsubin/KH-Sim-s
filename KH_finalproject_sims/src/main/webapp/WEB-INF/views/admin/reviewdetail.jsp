<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
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
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/reviewlist'" value="목록">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<!-- <div class="row"> -->
												<div class="col-sm-12">
													<form>
					                                    <div class="form-group row">
					                                    	<label for="bizId" class="col-sm-1 col-form-label left">통신사</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="bizId" value="${reviewdetail.bizId }">
					                                        </div>
					                                        <label for="adminId" class="col-sm-1 col-form-label left">작성자</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="adminId" value="${reviewdetail.userId }">
					                                        </div>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="aaaaa" value="${reviewdetail.reviewStar }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-1 col-form-label">작성일</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${reviewdetail.reviewDate }" pattern="yyyy.MM.dd"/>">
					                                        </div>
					                                    </div>
					                                </form>
				                                </div>
			                                <!-- </div> -->
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly>${reviewdetail.reviewContent }</textarea>
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
<script>
$(function() {
	  $('#delete-btn').click(function() {
	    if (confirm("리뷰를 삭제하시겠습니까?")) {
			var reviewNo = ${reviewdetail.reviewNo};    	
		    $.ajax({
			      type: 'POST',
			      url: '<%=request.getContextPath()%>/admin/reviewdelete',
			      data: {reviewNo: reviewNo},
			      success: function(result) {
						alert('삭제 처리되었습니다.');
						location.href = '<%=request.getContextPath()%>/admin/reviewlist'; // 페이지 이동
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