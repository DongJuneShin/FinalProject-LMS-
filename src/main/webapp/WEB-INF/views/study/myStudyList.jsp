<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<style type="text/css">
.categoryBar{
	color: gray;
}
.card:hover{
   transition-duration: 0.4s;
   box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.buttonDiv{
	text-align: right;
}
</style>
	
	<h4 class="title">
		나의 스터디 리스트
		<a href="#" class="btn btn-info" id="openDiv" style="float: right;">스터디 찾아보기</a>
	</h4>
	<br/>
	
	<h5>참여중인 스터디</h5>
	<div class="row mb-5 endterdDiv">
		<c:forEach var="studyVO" items="${studyVOList}" varStatus="stat">
			<c:if test="${studyVO.sGrade lt 2}">
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<h5 class="card-title">${studyVO.sNm}</h5>
							
							<p class="card-text">현재 참여자 ${studyVO.stuCount }명</p>
							<div class="buttonDiv">
								<c:choose>
									<c:when test="${studyVO.sGrade lt 0}">
										<span style="color: red;">정지된 스터디</span>
									</c:when>
									<c:otherwise>
										<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnEnter">입장</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
	<h5>신청한 스터디</h5>
	<div class="row mb-5">
		<c:forEach var="studyVO" items="${studyVOList}" varStatus="stat">
			<c:if test="${studyVO.sGrade == 2}">
				<div class="col-md-6 col-lg-4 mb-3 studyDiv">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<h5 class="card-title">${studyVO.sNm}</h5>
							
							<p class="card-text">현재 참여자 ${studyVO.stuCount }명</p>
							<div class="buttonDiv">
								<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnDelete">취소</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
	<h5>초대받은 스터디</h5>
	<div class="row mb-5">
		<c:forEach var="studyVO" items="${studyVOList}" varStatus="stat">
			<c:if test="${studyVO.sGrade == 3}">
				<div class="col-md-6 col-lg-4 mb-3 studyDiv">
					<div class="card h-100 sub-card">
						<div class="card-body">
							<h5 class="card-title">${studyVO.sNm}</h5>
							
							<p class="card-text">현재 참여자 ${studyVO.stuCount }명</p>
							<div class="buttonDiv">
								<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnUpdate">수락</button>
								<button type="button" id="${studyVO.sNum}" class="btn btn-outline-primary btnDelete">거절</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>


<script>
function cancelCheck(sNm) {
	return confirm("\"" + sNm + "\"에 대한 신청을 취소하시겠습니까?");
}

$(".btnEnter").on("click", function() {
	let sNum = $(this).attr("id");
	$.ajax({
		url: "/study/setSNum",
		data: {"sNum" : sNum},
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
		success: function(result) {
			if(result == 1){
				location.href = "/study/studyMain";
			}
		}
	});
});

$(".btnUpdate").on("click", function() {
	let sNum = $(this).attr("id");
	
	let data = {"sNum" : sNum, 
				"stuNum" : "${studyVOList[0].stuNum}",
				"sGrade" : 0};
	
	ajaxFunction(data)
});

$(".btnDelete").on("click", function() {
	let sNum = $(this).attr("id");
	console.log("sNum", sNum);
	
	let data = {"sNum" : sNum, 
				"stuNum" : parseInt("${studyVOList[0].stuNum}"),
				"sGrade" : -1};

	ajaxFunction(data);
});

function ajaxFunction(data) {
	$.ajax({
		url: "/study/modiStudyGrade",
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
		success: function(result) {
			if(result == 1){
				location.href = "/study/myStudyList";
			}
		}
	});
}

$("#openDiv").on("click", function () {
	window.open("/study/wholeStudyList?stuNum=${studyVOList[0].stuNum}", "스터디 찾아보기", "width = 1000, height = 1000, left = 33%, top = 12%");
});
</script>