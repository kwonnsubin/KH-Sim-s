<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요금 모달창</title>
</head>
<body>
<!-- 스크롤링 모달 -->
<div class="col-xl-4 col-md-6">
	<div class="card">
		<div class="card-header">
			<h5>요금제</h5>
		</div>
		<div class="card-body">
			<div id="exampleModalLong" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" 
			 	 style="display:none;" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">요금제</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="close">
								<span aria-hidden="true"></span>
							</button>
						</div>
						<div class="modal-body">
						<p class="mb-0"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
							<button type="button" class="btn btn=primary">save changes</button>
						</div>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="exampleModalLong">Launch demo modal</button> 
		</div>
	</div>
</div> 
</body>
</html>