<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/qnaDetail.css"/>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
<div class="pcoded-main-container">
	<div class="pcoded-wrapper container">
		<div class="pcoded-content">
			<div class="pcoded-inner-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<div class="page-header">
								<div class="page-block">
									<div class="row align-items-center">
										<div class="col-md-12">
											<div class="page-header-title">
												<h5 class="m-b-10">문의내역 상세</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>문의내역 상세</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qnadelete/${qnaDetail.aqNo}'" value="삭제">
										<input class="btn btn-primary right " type="button" onclick="location.href='<%=request.getContextPath()%>/admin/qna/list'" value="목록">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" value="${qnaDetail.aqTitle }" readonly>
	                                   			</div>
											</div>
												<div class="col-sm-12">
					                                    <div class="form-group row">
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" name="userId" value="${qnaDetail.userId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">작성일</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${qnaDetail.aqDate}" pattern="yyyy.MM.dd"/>">
					                                        </div>
				                                       		<label for="adminId" class="col-sm-2 col-form-label left">조회수</label>
					                                        <div class="col-sm-2">
					                                            <input type="text" readonly class="form-control-plaintext" id="aqViews" value="${qnaDetail.aqViews }">
					                                        </div>
					                                    </div>
				                                </div>
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" readonly>${qnaDetail.aqContent }</textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>
								<div class="card table-card review-card">
				                    <div class="card-header borderless">
				                        <div>
					                        <span id="answersCount">${qnaDetail.aqAnswers }</span>
					                        <span>개의 답변</span>				                        
						                    <div class="text-right">
										          <textarea class="form-control m-t-15 m-b-15" id="aaContent" rows="3" placeholder="댓글을 입력해보세요."></textarea>
										          <button type="button" class="btn btn-sm btn-primary" id="ans-btn">등록</button>			                                					                    
						                    </div>
					                    </div>
										<div class="card-body pb-0">
					                        <div class="review-block">
						                            <div class="row"   style="padding-bottom: 0px;">
						                                <div class="col">	
							                                <div id="qnaAnsList"></div>
						                                </div>
						                           </div>
					                        </div>
					                    </div>
				                    </div> 
				                </div>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
<script>

// 답변 리스트 ajax
 function getAnsList(){
 	var aqNo = "${aqNo}"
     $.ajax({
         type:'POST',
         url : '<%=request.getContextPath()%>/admin/qna/ansList',
         data: {aqNo: aqNo},
 		success : function(result) {
 				if (result != null) {
 					console.log(result);
 					displayAns(result);
 				}
 			},
 		error : function() {
 			alert("서버 요청 실패!")
 		}
         
     });
 }
 function displayAns(result){
 	var html = ''; 
 	for ( var i in result) {
 		
 		html += '<div class="qnaAns" id="no'+result[i].aaNo+'">';
 		html += '	<div class="border-bottom m-b-20 p-b-10">';
 		html += '		<h6 class="m-b-15">';
 		if(result[i].adminId) {
 			html += result[i].adminId;
	 		html += '  		<a class="m-l-5 text-info" onclick="qnaAnsUpdate(' +result[i].aaNo+ ',\''  +result[i].adminId+ '\',\'' +result[i].aaContent+'\',\'' +result[i].aaDate+ '\')">수정</a>'; // 답변 수정 폼 추가
	 		html += '  		<a class="m-l-5 text-info" onclick="qnaAnsDelete('+result[i].aaNo+')">삭제</a>';
 		} else if(result[i].userId) {
 			html += result[i].userId;
 		}
 		html += '		<span class="float-right f-13 text-muted">'+result[i].aaDate+'</span>';
 		html += '		</h6>';	                                    				                                
 		html += '		<p class="m-t-15 m-b-15 text-muted">'+result[i].aaContent+'</p> ';
 		html += '		<label class="badge badge-light-primary" onclick="qnaReplyList('+result[i].aaNo+')">답글</label>';
 		html += '	</div>';
 		html += '	<div class="qnaReplyList"></div>'; 
 		html += '</div>';
 	}
 	$("#qnaAnsList").html(html);
 }

// 답변 작성 ajax
$('#ans-btn').on("click", function() {
	var adminId = "${username}";
	var aqNo = "${aqNo}";
	var aaContent = $("#aaContent").val();
	$.ajax({
		url: '<%=request.getContextPath()%>/admin/qna/insertAns',
		data : {adminId: adminId, aqNo: aqNo, aaContent: aaContent},
		type : "post",
		success : function(result) {
			if (result == "success") {
			$('#aaContent').val('') 
			getAnsList(); 
			answerCount(aqNo);
			}
		},
		error : function() {
			alert("등록 실패")
		}
	})
})
		
// 답변 삭제 ajax
function qnaAnsDelete(aaNo) {
	var aqNo = "${aqNo}";
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			url: '<%=request.getContextPath()%>/admin/qna/deleteAns',
			data : {aaNo: aaNo},
			type : "post",
			success : function(result) {
				if (result == "success") {
					getAnsList();
					answerCount(aqNo);
				}
			},
			error : function() {
				alert("삭제 실패")
			}
		})
	}
}

// 답글 등록 ajax
function insertReply(aaNo) {
	var adminId = "${username}"
	var rplContent = $("#no" + aaNo + " [name='rplContent']").val();
	var aaNo = aaNo;
	
	$.ajax({
        url : '<%=request.getContextPath()%>/admin/qna/insertReply',
        data: {adminId: adminId, rplContent: rplContent, aaNo: aaNo},
		type : "post",
		success : function(result) {
				if (result != null) {
					console.log(result);
					qnaReplyList(aaNo);
				}
			},
		error : function() {
			alert("서버 요청 실패!")
		}
	});	
}

// 답글 삭제 ajax
function qnaReplyDelete(aaNo, rplNo) {
	var aaNo = aaNo;
	var rplNo = rplNo;
	
	$.ajax({
        url : '<%=request.getContextPath()%>/admin/qna/deleteReply',
        data: {rplNo: rplNo, aaNo: aaNo},
		type : "post",
		success : function(result) {
				if (result != null) {
					console.log(result);			
					qnaReplyList(aaNo);
				}
			},
		error : function() {
			alert("서버 요청 실패!")
		}
	});	
}

// 답변수 조회 ajax
function answerCount(aqNo) {
    var aqNo = aqNo;
    var html = '';

    $.ajax({
        url: '<%=request.getContextPath()%>/admin/qna/selectAnswerCount',
        data: {aqNo: aqNo},
        type: "POST",
        success: function(result) {
            html += result;
            $('#answersCount').text(html);
        },
        error: function() {
            alert("답변수 요청 실패!");
        }
    });	
}
</script>
</html>