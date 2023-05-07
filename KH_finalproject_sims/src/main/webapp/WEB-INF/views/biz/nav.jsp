<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/biz/nav.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<div id="wrap">
<nav id="header">
	        <ul class="list">
	        	<li>
		        	<a class="tit" href="${path}/biz/myPage" style="border-bottom: 3px solid #555; font-size:28px;">마이페이지</a>
		        </li>
	            <li>
	                <a href="${path}/biz/infodetail">
	                   	     내 정보 보기
	                       <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                       </span>
	                </a>
	            </li>
	            <li>
	                <a href="${path}/biz/planList">
	                    	요금제 현황
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	            <li>
	                <a href="${path}/biz/applyList">
	                    	가입신청 현황 
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                        
	                </a>
	            </li>
	            <li>
	                <a href="${path}/biz/reviewList">
	                    	리뷰 현황
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	            <li>
	                <a href="${path}/biz/main">
	                    	통계 현황
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	        </ul>
</nav>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
	  const links = document.querySelectorAll('#header .list li a');
	  const currentURL = window.location.href;

	  links.forEach(link => {
	    if (link.href === currentURL) {
	      link.classList.add('active');
	    }
	  });
	});
</script>
