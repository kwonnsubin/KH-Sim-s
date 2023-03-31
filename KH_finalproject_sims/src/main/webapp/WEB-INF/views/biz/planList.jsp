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
<link rel="stylesheet" href="${path}/resources/css/biz/main.css"/>
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

<div id="wrap">
	    <header id="header">
	        <p class="tit">사이드바</p>
	        <ul class="list">
	            <li>
	                <a href="#">
	                   	     내 정보 보기 
	                       <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                       </span>
	                </a>
	            </li>
	            <li>
	                <a href="#">
	                    	내 정보 보기 
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	            <li>
	                <a href="#">
	                    	내 정보 보기 
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	            <li>
	                <a href="#">
	                    	내 정보 보기 
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	        </ul>
	    </header>


<h2>${planList[0].bizName}의 요금제 목록</h2>
	<div>
        <span class="count float-1">총 ${vo.listCnt} 건</span>
    </div>
    <div>
        <table border="solid">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>요금제명</th>
                    <th>등록일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="plan" items="${planList}">
                <tr>
                    <td>${plan.rownum }</td>
                    <td><a href="<%=request.getContextPath()%>/biz/planDetail?planNo=${plan.planNo }">${plan.planName }</a></td>
                    <td>${plan.planDate } </td>
                    <td>
                    <button>수정</button><!-- 요금제 수정이 필요한가??? -->
                    <button>삭제</button>
                    </td>
                </tr>
                </c:forEach>                
            </tbody>
        </table>
    </div>
    
    <div>
    	<button type="button"  onclick="registerBtn(this);">요금제 등록하기</button>
    </div>
    <%-- location.href='<%=request.getContextPath()%>/biz/registerPlan'" --%>
<script>
	function registerBtn(){
		location.href="<%=request.getContextPath()%>/biz/registerPlan";
	}
</script>   

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