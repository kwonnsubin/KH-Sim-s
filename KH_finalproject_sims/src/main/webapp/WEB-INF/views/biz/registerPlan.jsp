<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>

	<form action="registerPlan" method="post">
        <div>
            <label>요금제명</label>
            <input type="text" name="planName">
            <label>통신사명</label>
            <input type="text" name="bizName" value="${vo.bizName}" readonly >
            <%-- value="${pageContext.request.userPrincipal.name }" 이렇게 하면 통신사 아이디--%>
        </div>
        <div>
            <label>통신망</label>
            <select name="netNo">
                <option value="1">SKT</option>
                <option value="2">KT</option>
                <option value="3">LGU+</option>
            </select>
            <label>통신세대</label>
            <select name="genNo">
                <option value="1">5G</option>
                <option value="2">LTE</option>
                <option value="3">3G</option>
                <option value="4">LTE/3G</option>
            </select>
        </div>
        <div>
            <label>기본료(원)</label>
            <input type="text" name="planPrice">
            <label>기본음성(분)</label>
            <input type="text" name="planVoice">
        </div>
         <div>
            <label>기본문자(건)</label>
            <input type="text" name="planMessage">
            <label>기본데이터(mb)</label>
            <input type="text" name="planData">
        </div>
        <div>
            <label>초과음성단가(초)</label>
            <input type="text" name="planVoiceOver">
            <label>초과문자단가(분)</label>
            <input type="text" name="planMessageOver">
            <label>초과데이터단가(MB)</label>
            <input type="text" name="planDataOver">
        </div>
        <button type="submit">등록</button>
    </form>
    
    <!-- 등록이 되면 등록이 되었다는 창이 뜨게 하고 요금제 목록 창으로  -->
    
 
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
     
</body>
</html>