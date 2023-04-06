<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<title>요금제</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/plans.css"/>

</head>
<body>

	<jsp:include page="../../header.jsp"/>
	<section>
		<div class="container-fluid d-flex justify-content-center filter-div">
	       	<div class="row align-self-center border-0 rounded-3">
	       		<div class="col m-3 filter-area">
	       			<p>데이터</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       		<div class="col m-3 filter-area">
	       			<p>통화량</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       		<div class="col m-3 filter-area">
	       			<p>가격</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       	</div>
       	</div>
 		<div class="container-fluid d-flex justify-content-center">
			<div class="row my-3 mt-4 choose-div">
				<div class="col-2 text-center">
	        		<div class="select-div">
					  <select class="select text-start" id="floatingSelect" aria-label="select">
					    <option value="선택순" selected>선택순</option>
					    <option value="별점순">별점순</option>
					    <option value="추천순">추천순</option>
					  </select>
					</div>
				</div>
				<div class="col-2 text-center">
					<button type="button" class="btn btn-light btn-outline-secondary modalBtn" data-bs-toggle="modal" data-bs-target="#filter-modal">
						필터
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="filter-modal" tabindex="-1" aria-labelledby="filter-modal" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header-div">
									<div class="row m-3 mb-1">
										<div class="col text-start">
											<h5 class="modal-title" id="filter-modal" style="font-weight: bold">필터</h5>
										</div>
										<div class="col text-end">
											<button type="button" class="btn-close text-end" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
									</div>
									<div class="btn-div text-start mx-4">
										<button onclick="goToScroll('planData')">데이터</button>
										<button onclick="goToScroll('planVoice')">통화량</button>
										<button onclick="goToScroll('planMessage')">문자량</button>
										<button onclick="goToScroll('planPrice')">가격</button>
										<button onclick="goToScroll('netInfo')">통신정보</button>
										<button onclick="goToScroll('bizName')">통신사</button>
									</div>
									<hr style="border:0;border-top:1px solid #555;margin:0;height:1px;" />
								</div>
								<div class="modal-body">
					        		<div class="filter-list text-start m-3">
					        			<div id="planData">
					        				<div>
						        				<p class="mb-2">데이터</p>
						        				<div class="range-div my-2 mb-3">
						        					<div class="text-center">
						        						<label class="range1-label" for="range1">전체</label>
						        					</div>
						        			
							        				<div slider id="slider-distance">
													  <div>
													    <div inverse-left style="width:70%;"></div>
													    <div inverse-right style="width:70%;"></div>
													    <div range style="left:0%;right:0%;"></div>
													    <span thumb style="left:0%;"></span>
													    <span thumb style="left:100%;"></span>
													    <div sign style="left:0%;">
													      <span id="value">0</span>
													    </div>
													    <div sign style="left:100%;">
													      <span id="value">100</span>
													    </div>
													  </div>
													  <input type="range" id="range1" tabindex="0" value="0" max="100" min="0" step="5" oninput="
													  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[1].style.width=value+'%';
													  children[5].style.left=value+'%';
													  children[7].style.left=value+'%';children[11].style.left=value+'%';
													  children[11].childNodes[1].innerHTML=this.value;" />
													
													  <input type="range" tabindex="0" value="100" max="100" min="0" step="5" oninput="
													  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[3].style.width=(100-value)+'%';
													  children[5].style.right=(100-value)+'%';
													  children[9].style.left=value+'%';children[13].style.left=value+'%';
													  children[13].childNodes[1].innerHTML=this.value;" />
													</div>
												</div>
						        				<div>
					        						<fieldset>
														<label class="mx-1">
													    	<input type="radio" name="data" value="전체" checked />
													    	<span class="px-2">전체</span>
														</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="100GB 이상" />
													    	<span class="px-2">100GB 이상</span>
													  	</label>
													
													 	<label class="mx-1">
													    	<input type="radio" name="data" value="50~100GB" />
													    	<span class="px-2">50~100GB</span>
													  	</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="10~50GB" />
													    	<span class="px-2">10~50GB</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="5~10GB" />
													    	<span class="px-2">5~10GB</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="data" value="5GB 이하" />
													    	<span class="px-2">5GB 이하</span>
													  	</label>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="planVoice">
					        				<div>
						        				<p class="my-2">통화량</p>
						        				<div class="range-div my-2 mb-3">
						        					<div class="text-center">
						        						<label class="range2-label" for="range2">전체</label>
						        					</div>
						        			
							        				<div slider id="slider-distance">
													  <div>
													    <div inverse-left style="width:70%;"></div>
													    <div inverse-right style="width:70%;"></div>
													    <div range style="left:0%;right:0%;"></div>
													    <span thumb style="left:0%;"></span>
													    <span thumb style="left:100%;"></span>
													    <div sign style="left:0%;">
													      <span id="value">0</span>
													    </div>
													    <div sign style="left:100%;">
													      <span id="value">300</span>
													    </div>
													  </div>
													  <input type="range" id="range2" tabindex="0" value="0" max="300" min="0" step="10" oninput="
													  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[1].style.width=value+'%';
													  children[5].style.left=value+'%';
													  children[7].style.left=value+'%';children[11].style.left=value+'%';
													  children[11].childNodes[1].innerHTML=this.value;" />
													
													  <input type="range" tabindex="0" value="300" max="300" min="0" step="10" oninput="
													  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[3].style.width=(100-value)+'%';
													  children[5].style.right=(100-value)+'%';
													  children[9].style.left=value+'%';children[13].style.left=value+'%';
													  children[13].childNodes[1].innerHTML=this.value;" />
													</div>
												</div>
						        				<div>
					        						<fieldset>
														<label class="mx-1">
													    	<input type="radio" name="voice" value="전체" checked />
													    	<span class="px-2">전체</span>
														</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="기본제공" />
													    	<span class="px-2">기본제공</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="300분 이상" />
													    	<span class="px-2">300분 이상</span>
													  	</label>
													
													 	<label class="mx-1">
													    	<input type="radio" name="voice" value="180~300분" />
													    	<span class="px-2">180~300분</span>
													  	</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="60~180분" />
													    	<span class="px-2">60~180분</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="60분 이하" />
													    	<span class="px-2">60분 이하</span>
													  	</label>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="planMessage">
					        				<div>
						        				<p class="my-2">문자량</p>
						        				<div class="range-div my-2 mb-3">
						        					<div class="text-center">
						        						<label class="range3-label" for="range3">전체</label>
						        					</div>
						        			
							        				<div slider id="slider-distance">
													  <div>
													    <div inverse-left style="width:70%;"></div>
													    <div inverse-right style="width:70%;"></div>
													    <div range style="left:0%;right:0%;"></div>
													    <span thumb style="left:0%;"></span>
													    <span thumb style="left:100%;"></span>
													    <div sign style="left:0%;">
													      <span id="value">0</span>
													    </div>
													    <div sign style="left:100%;">
													      <span id="value">300</span>
													    </div>
													  </div>
													  <input type="range" id="range3" tabindex="0" value="0" max="300" min="0" step="10" oninput="
													  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[1].style.width=value+'%';
													  children[5].style.left=value+'%';
													  children[7].style.left=value+'%';children[11].style.left=value+'%';
													  children[11].childNodes[1].innerHTML=this.value;" />
													
													  <input type="range" tabindex="0" value="300" max="300" min="0" step="10" oninput="
													  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
													  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
													  var children = this.parentNode.childNodes[1].childNodes;
													  children[3].style.width=(100-value)+'%';
													  children[5].style.right=(100-value)+'%';
													  children[9].style.left=value+'%';children[13].style.left=value+'%';
													  children[13].childNodes[1].innerHTML=this.value;" />
													</div>
												</div>
						        				<div>
					        						<fieldset>
														<label class="mx-1">
													    	<input type="radio" name="voice" value="전체" checked />
													    	<span class="px-2">전체</span>
														</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="기본제공" />
													    	<span class="px-2">기본제공</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="300건 이상" />
													    	<span class="px-2">300건 이상</span>
													  	</label>
													
													 	<label class="mx-1">
													    	<input type="radio" name="voice" value="100~300건" />
													    	<span class="px-2">100~300건</span>
													  	</label>
													
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="50~100건" />
													    	<span class="px-2">50~100건</span>
													  	</label>
													  	
													  	<label class="mx-1">
													    	<input type="radio" name="voice" value="50건 이하" />
													    	<span class="px-2">50건 이하</span>
													  	</label>
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="planPrice">
					        				<div>
						        				<p class="my-2">가격</p>
						        				<div>
					        						<fieldset>
					        							<div class="row">
					        								<div class="col-3">
																<label class="mx-1">
															    	<input type="radio" name="voice" value="전체" checked />
															    	<span class="px-2">전체</span>
																</label>
															
															  	<label class="mx-1">
															    	<input type="radio" name="voice" value="3만원 이상" />
															    	<span class="px-2">3만원 이상</span>
															  	</label>
															  	
															  	<label class="mx-1">
															    	<input type="radio" name="voice" value="2~3만원" />
															    	<span class="px-2">2~3만원</span>
															  	</label>
					        								</div>
					        								<div class="col-3">
															 	<label class="mx-1">
															    	<input type="radio" name="voice" value="1~2만원" />
															    	<span class="px-2">1~2만원</span>
															  	</label>
															
															  	<label class="mx-1">
															    	<input type="radio" name="voice" value="5천~1만원" />
															    	<span class="px-2">5천~1만원</span>
															  	</label>
															  	
															  	<label class="mx-1">
															    	<input type="radio" name="voice" value="5천원 이하" />
															    	<span class="px-2">5천원 이하</span>
															  	</label>
														  	</div>
					        							</div>
													
													</fieldset>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="netInfo">
					        				<div>
						        				<p class="my-2">통신정보</p>
						        				<div class="row info-div">
						        					<div class="col">
							        					<p class="my-1">통신망</p>
						        						<fieldset>
															<label class="mx-1">
														    	<input type="radio" name="voice" value="KT" checked />
														    	<span class="px-2">KT</span>
															</label>
														
														  	<label class="mx-1">
														    	<input type="radio" name="voice" value="SKT" />
														    	<span class="px-2">SKT</span>
														  	</label>
														  	
														  	<label class="mx-1">
														    	<input type="radio" name="voice" value="LGU+" />
														    	<span class="px-2">LGU+</span>
														  	</label>
														</fieldset>
						        					</div>
						        					<div class="col">
							        					<p class="my-1">통신기술</p>
						        						<fieldset>
															<label class="mx-1">
														    	<input type="radio" name="voice" value="KT" checked />
														    	<span class="px-2">5G</span>
															</label>
														
														  	<label class="mx-1">
														    	<input type="radio" name="voice" value="SKT" />
														    	<span class="px-2">LTE</span>
														  	</label>
														  	
														  	<label class="mx-1">
														    	<input type="radio" name="voice" value="LGU+" />
														    	<span class="px-2">3G</span>
														  	</label>
														</fieldset>
						        					</div>
						        				</div>
					        				</div>
					        			</div>
					        			<div id="bizName">
					        				<p class="mt-2">통신사</p>
					        			</div>
					        		</div>
					      		</div>
					      		<div class="modal-footer">
					        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        		<button type="button" class="btn btn-primary">확인</button>
					      		</div>
				    		</div>
					  	</div>
					</div>
				</div>
			</div>
	    </div>
	    <div class="container-fluid d-flex justify-content-center mt-3">
	    	<div class="row list-par-div">
	    		<div class="col-8">
	    			<div>
	    				<p class="ms-3">총 ${cnt}개</p>
	    			</div>
	    			<c:forEach var="list" items="${planList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<p>${list.bizName}</p>
	    					<p>${list.planName}</p>
	    					<p>
	    					<c:if test="${list.planData lt 1000}">
	    					${list.planData}MB 
	    					</c:if>
	    					<c:if test="${list.planData gt 1000}">
	    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${list.planData / 1000}" />
	    					${data}G
	    					</c:if>
	    					+ ${list.planVoice}분 + ${list.planMessage}건</p>
	    				</div>
	    				<div class="col-4 text-end">
	    					<p>${list.planPrice}원</p>
	    					<button type="button" class="btn btn-primary btn-sm">자세히 보기</button>
	    				</div>
	    			</div>
	    			</c:forEach>
	    		</div>
	    		<div class="col-4">
	    			<div class="input-div">
	    				<input type="text" class="form-control" placeholder="검색어">
	    				<span class="material-symbols-outlined search-icon">search</span>
	    			</div>
	    			<div class="row my-4">
        				<div class="col">
	        				최근 본 요금제
        				</div>
        				<div class="col text-end">
	        				더보기
        				</div>
        			</div>
        			<div class="mt-3 recent-list">
	    				<div>
	    					<p>요금제 이름</p>
	    					<p>요금제 가격</p>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</section>

	
	<jsp:include page="../../footer.jsp"/>
	
  <!-- Scripts -->
  <script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/user/plans.js"></script>
  
  
</body>
</html>