<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 작성 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<form action="faqwrite" method="post">
			<div class="mb-3 row">
		   		<label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
		    	<div class="col-sm-10">
			      	<input type="text" class="form-control" id="inputPassword" name="faqTitle">
		    	</div>
		  	</div>	
				<div class="mb-3">
		  			<label for="exampleFormControlTextarea1" class="form-label "></label>
		  			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="faqContent" style="height: 500px;"></textarea>
				</div>
				
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-outline-dark">돌아가기</button>		
					</div>
					<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-outline-dark">완료</button>		
					</div>		
				</div>
		</form>
	</div>
</body>
</html>