<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 작성</title>
</head>
<body>
<jsp:include page="../include/header.jsp" />
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
												<h5 class="m-b-10">공지사항 작성</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>공지사항 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>공지사항 작성</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/admin/saveNoticeWrite" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<%-- <input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/adminNotice/saveNoticeWrite'" value="저장"> --%>
										<input type="hidden" value="${username }" name="adminId">
										<input class="btn btn-primary right" type="submit" value="저장">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<!-- <h5 class="card-text"></h5>
										<p class="card-text"></p> -->
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
                                        			<input type="text" class="form-control" name="ntcTitle" placeholder="제목을 입력하세요">
                                    			</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" placeholder="내용을 입력하세요"></textarea>
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
<jsp:include page="../include/footer.jsp" />
</body>
</html>