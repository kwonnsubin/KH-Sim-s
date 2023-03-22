<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>통신사 상세정보</h1>

	${info}
	<img src="<%=request.getContextPath()%>/resources/img/${info.logoRenameFilename}"/>
	
</body>
</html>