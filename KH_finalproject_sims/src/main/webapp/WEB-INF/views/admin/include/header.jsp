<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="" rel="stylesheet"> -->
<!-- UI 템플릿 적용 start -->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/images/favicon.ico" type="image/x-icon">

<!-- prism css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/css/plugins/prism-coy.css">
<!-- vendor css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/css/style.css">
<!-- UI 템플릿 적용 end -->

<!-- 컨텐츠 수정용 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/admin/theme/css/style.css">
<!-- 컨텐츠 수정용 CSS End -->

<title>sims</title>
</head>
<body>
<!-- [ Pre-loader ] start -->
    <div class="loader-bg">
        <div class="loader-track">
            <div class="loader-fill"></div>
        </div>
    </div>
    <!-- [ Pre-loader ] End -->
    <!-- [ navigation menu ] start -->
    <nav class="pcoded-navbar theme-horizontal menu-light">
        <div class="navbar-wrapper container">
            <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
                <ul class="nav pcoded-inner-navbar sidenav-inner">
                    <li class="nav-item pcoded-menu-caption">
                    	<label>Navigation</label>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/dashboard" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
                    </li>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="<%=request.getContextPath()%>/admin/applyList" class="nav-link " class="nav-link "><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">통신사 관리</span></a>
                        <ul class="pcoded-submenu">
                            <li><a href="<%=request.getContextPath()%>/admin/applyList">통신사 정보</a></li>
                           <!--  <li><a href="layout-horizontal.html" target="_blank">통신사정보</a></li>
                            <li><a href="layout-horizontal.html" target="_blank">탈퇴정보</a></li> -->
                            <li><a href="<%=request.getContextPath()%>/admin/bizPlanApplyList">통신사 요금제 가입정보</a></li>
                        </ul>
                    </li>
                    <li class="nav-item pcoded-menu-caption">
                    	<label>UI Element</label>
                    </li>
                    <!-- <li class="nav-item pcoded-hasmenu">
                    	<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-box"></i></span><span class="pcoded-mtext">사용자 관리</span></a>
                    	<ul class="pcoded-submenu">
                    		<li><a href="bc_alert.html">Alert</a></li>
                    		<li><a href="bc_button.html">Button</a></li>
                    		<li><a href="bc_badges.html">Badges</a></li>
                    		<li><a href="bc_breadcrumb-pagination.html">Breadcrumb & paggination</a></li>
                    		<li><a href="bc_card.html">Cards</a></li>
                    		<li><a href="bc_collapse.html">Collapse</a></li>
                    		<li><a href="bc_carousel.html">Carousel</a></li>
                    		<li><a href="bc_grid.html">Grid system</a></li>
                    		<li><a href="bc_progress.html">Progress</a></li>
                    		<li><a href="bc_modal.html">Modal</a></li>
                    		<li><a href="bc_spinner.html">Spinner</a></li>
                    		<li><a href="bc_tabs.html">Tabs & pills</a></li>
                    		<li><a href="bc_typography.html">Typography</a></li>
                    		<li><a href="bc_tooltip-popover.html">Tooltip & popovers</a></li>
                    		<li><a href="bc_toasts.html">Toasts</a></li>
                    		<li><a href="bc_extra.html">Other</a></li>
                    	</ul>
                    </li> -->
                    <!-- <li class="nav-item pcoded-menu-caption">
                        <label>공지사항 관리</label>
                    </li> -->
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/userList" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">사용자 관리</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/noticeList" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">공지사항 관리</span></a>
                    </li>
                   	<li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/faq/list" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">자주묻는질문 관리</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/reviewreport/list"><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">신고 관리</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/review/list" class="nav-link "><span class="pcoded-micon"><i class="feather icon-align-justify"></i></span><span class="pcoded-mtext">리뷰 관리</span></a>
                    </li>
                    <li class="nav-item pcoded-menu-caption">
                    	<label>문의내역 관리</label>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/admin/statistics" class="nav-link "><span class="pcoded-micon"><i class="feather icon-pie-chart"></i></span><span class="pcoded-mtext">통계 조회</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/logout" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">로그아웃</span></a>
                    </li>
                    <!-- <li class="nav-item">
                        <a href="map-google.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">로그 아웃</span></a>
                    </li> -->
                    <!-- <li class="nav-item pcoded-menu-caption">
                    	<label>Pages</label>
                    </li>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">Authentication</span></a>
                        <ul class="pcoded-submenu">
                            <li><a href="auth-signup.html" target="_blank">Sign up</a></li>
                            <li><a href="auth-signin.html" target="_blank">Sign in</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="sample-page.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-sidebar"></i></span><span class="pcoded-mtext">Sample page</span></a></li> -->

                </ul>
            </div>
        </div>
    </nav>
    <!-- [ navigation menu ] end -->
<!-- <div id="wrap">
	<div id="herder">
		<div class="head-top">
			<div class="head-area-web">
				<nav>
					<ul>
						<li><a>통신사 관리</a></li>
						<li><a>사용자 관리</a></li>
						<li><a>공지사항 관리</a></li>
						<li><a>신고 관리</a></li>
						<li><a>리뷰 관리</a></li>
						<li><a>문의내역 관리</a></li>
						<li><a>통계 조회</a></li>
						<li><a>로그아웃</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div> -->
</body>
</html>