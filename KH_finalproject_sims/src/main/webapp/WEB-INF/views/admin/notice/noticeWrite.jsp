<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 작성</title>
</head>
<body>
<jsp:include page="../include/header.jsp" />
	<div id="container">
		<div class="contain-area">
			<form action="<%=request.getContextPath()%>/adminNotice/saveNoticeWrite" method="post">
				<div class="content">
					<h1>공지사항 작성</h1>
					<%-- <input class="sims_btn" type="button" onclick="location.href='<%=request.getContextPath()%>/adminNotice/saveNoticeWrite'" value="저장"> --%>
					<input class="sims_btn" type="submit" value="저장">
					<div class="contents">
						<div>
							<label for="title">제목</label>
							<input type="hidden" value="${username }" name="adminId">
							<input type="text" name="ntcTitle"  >
						</div>
						<div>
							<label for="">내용</label>
							<input type="textarea" name="ntcContent">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>