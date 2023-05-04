<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/faqDetail.css"/>
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
												<h5 class="m-b-10">자주묻는질문 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/faq/update/${faqlist.faqNo}'" value="수정">
										<input class="btn btn-primary right m-l-10" type="button" onclick="deleteFaq()" value="삭제">
										<input type="hidden" name="faqNo" value="${faqlist.faqNo}">
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/faq/list'" value="목록">
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" value="${faqlist.faqTitle }" readonly style="background-color: white;">
	                                   			</div>
											</div>
											<!-- <div class="row"> -->
												<div class="col-sm-12">
					                                    <div class="form-group row  text-center">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-4">
					                                            <input type="text" readonly class="form-control-plaintext" name="adminId" value="${faqlist.adminId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-4">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${faqlist.faqDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
					                                    </div>
				                                </div>
			                                <!-- </div> -->
											<div class="col-sm-12">
<%-- 											<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly style="background-color: white;">${faqlist.faqContent }</textarea>
			                                    </div> --%>
												<div class="form-group">
												  <div class="textarea-like">${faqlist.faqContent}</div>
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
</body>
<script type="text/javascript">

// 자주묻는질문 삭제
function deleteFaq() {
	
	var faqNo = $('input[name=faqNo]').val();
	console.log(faqNo);
	
	if(confirm("삭제하시겠습니까?")) {
 	 	$.ajax({
	        url : '<%=request.getContextPath()%>/admin/faq/delete',
	        data: {faqNo: faqNo},
			type : "get",
			success : function(result) {
					if (result != null) {
						let url = '<%=request.getContextPath()%>/admin/faq/list';
						alert("삭제되었습니다.")
						location.replace(url);
					}
				},
			error : function() {
				alert("서버 요청 실패!")
			}
		});		
	}
}

</script>
</html>