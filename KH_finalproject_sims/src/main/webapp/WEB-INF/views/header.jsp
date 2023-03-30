<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- ***** Preloader Start ***** -->
 <div id="js-preloader" class="js-preloader">
   <div class="preloader-inner">
     <span class="dot"></span>
     <div class="dots">
       <span></span>
       <span></span>
       <span></span>
     </div>
   </div>
 </div>
  
<header class="header-area header-sticky wow slideInDown sticky-top" data-wow-duration="0.75s" data-wow-delay="0s">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** Logo Start ***** -->
					<a href="#" class="logo"> <img
						src="https://dummyimage.com/50x50" alt="Sim-s">
					</a>
					<!-- ***** Logo End ***** -->
					<!-- ***** Menu Start ***** -->
					<ul class="nav">
						<li><a href="<%=request.getContextPath()%>/" class="active">홈</a></li>
						<li><a href="<%=request.getContextPath()%>/plans">요금제 찾기</a></li>
						<li><a href="<%=request.getContextPath()%>/faq/faqlist">자주 묻는 질문</a></li>
						<sec:authorize access="isAnonymous()">
						<li><a href="<%=request.getContextPath()%>/login">로그인 </a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
						</sec:authorize>
						<li><a href="<%=request.getContextPath()%>/mypage">마이페이지</a></li>
					</ul>
					<a class='menu-trigger'> 
						<span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>

