<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="kr.or.ddit.vo.StudyVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	StudyVO studyVO = (StudyVO) session.getAttribute("studyVO");
	int sNum = studyVO.getsNum();
	int id = studyVO.getStuNum();
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	String name = userVO.getName();
%>

<style type="text/css">
.categoryBar{
	color: gray;
}
thead{
	text-align: center;
}
.card{
	overflow: auto;
}
.search-sel{
	width: 15%;
	display: inline;
}
.search-inp{
	width: 30%;
	display: inline;
}
.search-btn{
	display: inline;
}

.table-bordered{
	text-align: center;
}
.card-body{
	margin-top: 10px;
	padding-top: 0px;
}
textarea{
	resize: none;
	width: 100%;
	maxlength: 1000;
}

.scrolltbody {
    display: block;
    width: 700px;
    border-collapse: collapse;
}
.scrolltbody tbody {
    display: block;
    height: 400px;
    overflow: auto;
}
.dataTables_empty{
	width: 700px;
}

/* table.forJoin, table.forApp, table.forInvite{ */
/*  	width: 80% !important; */
/* } */
/* h5.tableHeader{ */
/* 	width: 80%; */
/* } */
thCenter table.dataTable thead th{
	text-align: center;
}

</style>

<br/>
<h4 class="title" id="dropdown-icon-demo">
	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAFtJREFUSEtjZKAxYKSx+QyjFhAM4QEJov9QZ8Esh/EJuhZNH5iLzQc0t4BYlxKlbkDigCiXEatoQOJgNJJRomdAUhHN44DmFhCbxIlSNyBxQJTLiFU06gOCIQUAArwMGUsaCXEAAAAASUVORK5CYII="
		style="position: relative; bottom: 2px; padding: 0px;" id="menuTab" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"/>
	&nbsp;&nbsp;<%=studyVO.getsNm() %>
	<ul class="dropdown-menu">
		<li><a href="/study/myStudyList" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>목록으로</a></li>
		<li><a href="/study/studyMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>메인</a></li>
		<li><a href="/study/scheduleMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스터디 일정</a></li>
		<li><a href="/study/timeTableMain" class="dropdown-item d-flex align-items-center"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스케줄 비교</a></li>
		<li>
			<hr class="dropdown-divider">
		</li>
		<li><a href="javascript:void(0);" id="btnExit" class="dropdown-item d-flex align-items-center" style="color: red;"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>스터디 나가기</a></li>
		<li>
			<a href="javascript:void(0);" class="dropdown-item d-flex align-items-center" style="color: red;"
				data-bs-toggle="modal" data-bs-target="#reportModal"><i class="bx bx-chevron-right scaleX-n1-rtl"></i>신고하고 나가기
			</a>
		</li>
	</ul>
</h4>

<div class="card">
	<div class="card-header"><h4>참여자</h4></div>
	
	<div class="card-body">
		<table class="table table-bordered forJoin thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>학번</th>
					<th>이름</th>
					<th class="forTheMaster" style="width: 20%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:set var="stuNum" value="<%=studyVO.getStuNum() %>"/>
				<c:forEach var="student" items="${data}">
					<c:if test="${student.S_GRADE le 1}">
						<tr>
							<td>${student.STU_NUM }</td>
							<td>${student.STU_NM_KOR }<c:if test="${student.S_GRADE == 1 }">(방장)</c:if></td>
							<td class="forTheMaster noSort">
								<c:if test="${student.STU_NUM != stuNum}">
									<button type="button" id="${student.STU_NUM}" class="btn btn-primary btn-sm btnKick">내보내기</button>
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<br/>
		
<div class="card">
	<div class="card-header">
		<h4 style="display: inline-block;">초대 목록</h4>
		<button type="button" class="btn btn-primary btn-md" style="float: right;" id="btnInviteModal"
			data-bs-toggle="modal" data-bs-target="#inviteModal">초대하기</button>
	</div>

	<div class="card-body">
		<table class="table table-bordered forInvite thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>학번</th>
					<th>이름</th>
					<th class="" style="width: 20%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${data}">
					<c:if test="${student.S_GRADE == 3}">
						<tr>
							<td>${student.STU_NUM }</td>
							<td>${student.STU_NM_KOR }</td>
							<td class="forTheMaster noSort">
								<button type="button" id="${student.STU_NUM}" class="btn btn-primary btn-sm btnDelete">초대취소</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<br/>

<div class="card">
	<div class="card-header"><h4>신청 목록</h4></div>

	<div class="card-body">
		<table class="table table-bordered forApp thCenter">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>학번</th>
					<th>이름</th>
					<th class="forTheMaster" style="width: 20%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${data}">
					<c:if test="${student.S_GRADE == 2}">
						<tr>
							<td>${student.STU_NUM }</td>
							<td>${student.STU_NM_KOR }</td>
							<td class="forTheMaster noSort">
								<button type="button" id="${student.STU_NUM}" class="btn btn-primary btn-sm btnUpdate">수락</button>
								<button type="button" id="${student.STU_NUM}" class="btn btn-primary btn-sm btnDelete">거절</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="modal fade" id="inviteModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close invite-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-2">초대</h4>
					</div>
					<table class="table table-bordered2 scrolltbody" id="modalTable">
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>학번</th>
								<th>이름</th>
								<th class="noSort"></th>
							</tr>
						</thead>
<!-- 						<tbody> -->
<!-- 						</tbody> -->
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reportModal" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-simple modal-add-new-cc">
		<div class="modal-content p-3 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close report-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div class="row g-3">
					<div class="col-md-12">
						<h4 class="col-md-2">신고</h4>
					</div>
					
					<span class="col-sm-10 col-form-label" id="comEmpty" style="color: red; display: none; padding: 0px; padding-left: 10px;">신고사유를 작성해주세요</span>
					
					<div class="col-sm-12">
						<textarea class="form-control" id="reason" name="reason" rows="3" cols="" placeholder="신고 사유를 작성해주세요." ></textarea>
					</div>
					
					<br/>
					<div class="col-md-12 text-center formButtons">
						<button type="button" id="btnReport" class="btn btn-primary me-sm-3 me-1">제출</button>
						<button type="reset" class="btn btn-label-secondary report-close" data-bs-dismiss="modal" aria-label="Close">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 채팅 -->
<jsp:include page="/WEB-INF/views/study/studyChat.jsp" />
<!-- 채팅 -->

<script>
$(function () {
	// 테이블 세팅
	joinTable = $(".forJoin").DataTable({
		searching: false
		<%
		if (studyVO.getsGrade() != 1) {
		%>
			,columnDefs: [
				{ targets: 2, visible: false },
			]
		<%
		}
		%>
		,order: [ [ 2, "asc" ] ]
	});
	inviteTable = $(".forInvite").DataTable({
		searching: false
	});
	appTable = $(".forApp").DataTable({
		searching: false
		<%
		if(studyVO.getsGrade() != 1){
			%>
			,columnDefs: [
				{ targets: 2, visible: false },
			]
			<%
		}
		%>
	});
	modalTable = $("#modalTable");
	modalTable.DataTable({
		info: false,
		paging: false
	});
	settingDatatables();
});

// 나가기 버튼
$("#btnExit").on("click", function() {
	if(!confirm("정말 \"<%=studyVO.getsNm() %>\"에서 나가시겠습니까?")){
		return;
	}
	location.href = "/study/exitStudy";
});

// 신고하고 나가기 버튼
$("#btnReport").on("click", function() {
	let target = $("#reason");
	
	if(target.val() == "" || target.val() == null){
		target.focus();
		$("#comEmpty").css("display", "inline-block");
		return;
	}
	
	if(!confirm("정말" + isEndWithConsonant("<%=studyVO.getsNm() %>") + " 신고하고 나가시겠습니까?")){
		return;
	}
	
	location.href = "/study/reportStudy?srlReason=" + target.val();
});

// 내보내기 버튼
$(document).on("click", ".btnKick", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");
	
	let p_tr = $_this.closest("tr");
	let stuNm = p_tr.children().eq(1).text();
	
	if(!confirm(stuNm + "(" + stuNum + ")님을 스터디에서 내보내시겠습니까?")){
		return;
	}
	
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"), 
				"stuNum" : stuNum,
				"sGrade" : -1};
	

	ajaxFunction(data, function() {
		joinTable.row($_this.parents("tr")).remove().draw();
		settingDatatables();
	});
});

// 초대 취소, 신청 거절
$(document).on("click", ".btnDelete", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");
	
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"), 
				"stuNum" : stuNum,
				"sGrade" : -1};

	let table = $_this.closest("table");
	
	ajaxFunction(data, function() {
		if(table.hasClass("forInvite")){
			inviteTable.row($_this.parents("tr")).remove().draw();
		}
		
		if(table.hasClass("forApp")){
			appTable.row($_this.parents("tr")).remove().draw();
		}
		
		settingDatatables()
	});
});

// 신청 수락
$(".btnUpdate").on("click", function() {
	let $_this = $(this);
	let stuNum = $_this.attr("id");
	
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"), 
				"stuNum" : stuNum,
				"sGrade" : 0};

	ajaxFunction(data, function() {
		let p_tr = $_this.closest("tr");
		let p_tbody = p_tr.closest("tbody");
		let stuNmKor = p_tr.children().eq(1).text();
		
		appTable.row($_this.parents("tr")).remove().draw();
		
		joinTable.row.add([stuNum, stuNmKor, '<button type="button" id="' + stuNum + '" class="btn btn-primary btn-sm btnKick">내보내기</button>']).draw();
		settingDatatables();
	});
});

// 초대
$(document).on("click", ".btnInvite", function() {
	let target = $(this).parent();
	target.html("<span style='color: red;'>초대중</span>");
	
	let stuNum = target.prev().prev().text();
	let stuNmKor = target.prev().text();
	let data = {"sNum" : parseInt("<%=studyVO.getsNum()%>"),
				"stuNum" : stuNum, 
				"sNm": "<%=studyVO.getsNm() %>",
				"sGrade" : 3};
	
	ajaxFunction(data, function() {
		let target = $(".forInvite").find("tbody");
		inviteTable.row.add([stuNum, stuNmKor, '<button type="button" id="' + stuNum + '" class="btn btn-primary btn-sm btnDelete">초대취소</button>']).draw();
		settingDatatables()
	});
});


function ajaxFunction(data, fn) {
	$.ajax({
		url: "/study/modiStudyGrade",
		data: data,
		type: "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			if(result == 1){ fn() }
		}
	});
}

// 초대 모달 오픈
$("#btnInviteModal").on("click", function() {
	modalTable.DataTable().destroy();
	modalTable.DataTable({
		ajax: {
			url: "/study/inviteList",
			type: "get",
			async: false
		},
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		columns: [
			{data : "STU_NUM"},
			{data : "STU_NM_KOR"},
			{data: "button"}
		],
		info: false,
		paging: false
	});
	
	let thead = modalTable.find("thead");
	thead.find("tr").children().css("width", "315px");
	thead.find("tr").children().eq(2).css("width", "70px");
	thead.find("tr").children().eq(2).removeClass("sorting");
	
	let tbody = thead.next().children();
	for(var i = 0; i < tbody.length; i++){
		tbody.eq(i).children().css("width", "315px");
		tbody.eq(i).children().eq(2).css("width", "70px");
	}
});

$(".invite-close").on("click", function() {
	$("#modalTable_filter").find("input[type='search']").val("");
});

$(".report-close").on("click", function() {
	$("#reason").val("");
});

function settingDatatables(){
	$("#DataTables_Table_0_length").css("display", "none");
	$("#DataTables_Table_1_length").css("display", "none");
	$("#DataTables_Table_2_length").css("display", "none");
	$("select[name='DataTables_Table_0_length']").append("<option value='5' selected>5</option>")
	$("select[name='DataTables_Table_0_length']").val("5").trigger("change");
	$("select[name='DataTables_Table_1_length']").append("<option value='5' selected>5</option>")
	$("select[name='DataTables_Table_1_length']").val("5").trigger("change");
	$("select[name='DataTables_Table_2_length']").append("<option value='5' selected>5</option>")
	$("select[name='DataTables_Table_2_length']").val("5").trigger("change");
// 	$("#DataTables_Table_0_filter > label").css("display", "none");
// 	$("#DataTables_Table_1_filter > label").css("display", "none");
// 	$("#DataTables_Table_2_filter > label").css("display", "none");
	$("#DataTables_Table_0_info").parent().remove();
	$("#DataTables_Table_1_info").parent().remove();
	$("#DataTables_Table_2_info").parent().remove();
	$(".noSort").removeClass("sorting");
}

//맨 마지막 글자에 받침이 있는지 찾아서 있다면 true, 없다면 false 를 반환
function isEndWithConsonant(korStr) {
    const finalChrCode = korStr.charCodeAt(korStr.length - 1)
    // 0 = 받침 없음, 그 외 = 받침 있음
    const finalConsonantCode = (finalChrCode - 44032) % 28
    return "\"" + korStr + "\"" + (finalConsonantCode !== 0)? '을':'를';
}
</script>

<!-- <script type="text/javascript" src="/resources/js/studyChat.js"></script> -->