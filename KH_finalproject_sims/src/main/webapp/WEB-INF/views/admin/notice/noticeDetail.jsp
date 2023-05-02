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
												<h5 class="m-b-10">공지사항
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/noticeList/"><i class="breadcrumb-item"></i>공지사항 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>공지사항 
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/admin/saveNoticeModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/noticeList'" value="목록">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/deleteNotice?ntcNo=${noticeDetail.ntcNo}'" value="삭제">
										<c:choose>
											<c:when test="${cmd eq 'read' }">
												<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/selectNoticeModify/${noticeDetail.ntcNo}'" value="수정">
											</c:when>
											<c:otherwise>
												<input class="btn btn-primary right" type="submit" value="저장">
											</c:otherwise>
										</c:choose>
										<input type="hidden" value="${username }" name="adminId">
										<input type="hidden" value="${noticeDetail.ntcNo }" name="ntcNo">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${noticeDetail.ntcTitle }">
	                                   			</div>
											</div>
											<!-- <div class="row"> -->
												<div class="col-sm-12">
													<form>
					                                    <div class="form-group row">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-4">
					                                            <input type="text" readonly class="form-control-plaintext" name="adminId" value="${noticeDetail.adminId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-4">
					                                        	
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${noticeDetail.ntcDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
					                                    </div>
					                                </form>
				                                </div>
			                                <!-- </div> -->
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" style=resize:none; <c:if test="${cmd eq 'read' }">readonly</c:if>>${noticeDetail.ntcContent}</textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>	
							</form>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
<script>
$(document).ready(function(){
	
	var result = '<c:out value="${result }"/>';
	var html = result;
	result = result.replace(" ", "");
	if(result == null || result == "" || result == undefined){
		
	} else {
		alert(html);
	}
});

</script>
</body>
</html>