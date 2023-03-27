<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리 리스트</title>
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
													<h5 class="m-b-10">사용자 관리</h5>
												</div>
												<ul class="breadcrumb">
													<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
													<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>사용자 관리</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-body">
										<form action="<%=request.getContextPath()%>/adminNotice/noticeList" method="post">
											<div class="row">
												<div class="col-sm-12">
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

													
												
</body>
</html>