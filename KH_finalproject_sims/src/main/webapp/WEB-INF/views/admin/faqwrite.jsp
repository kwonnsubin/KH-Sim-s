<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 작성</title>
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
												<h5 class="m-b-10">자주묻는질문 작성</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>자주묻는질문 작성</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form:form action="faqwrite" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
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
                                        			<input type="text" class="form-control" name="faqTitle" placeholder="제목을 입력하세요">
                                    			</div>
											</div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="faqContent" rows="20" placeholder="내용을 입력하세요"></textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>	
							</form:form>
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