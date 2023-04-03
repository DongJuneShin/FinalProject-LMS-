<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>
td{
	font-size: 0.9rem;
	text-align: center;
}

</style>
<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="s">학적변동 신청내역</a>
		</h5>

<%-- 		stuInfo : ${stuInfo} --%>

	</div>
	<div class="card-body">
		<div class="card divTb w-px-700 h-px-120 mx-auto">
			<table class="table table-bordered" style="height:100%; table-layout:fixed;">
					<tr>
						<th width="10%" style="background: #d2e8f1;">학번</th>
						<td width="14%">${stuInfo.get("STU_NUM")}</td>
						<th width="11%" style="background: #d2e8f1;">이름</th>
						<td width="13%">${stuInfo.get("STU_NM_KOR")}</td>
						<th width="7%" style="background: #d2e8f1;">학적상태</th>
						<td width="10%">
							<c:choose>
								<c:when test="${stuInfo.STU_STATUS == 0 }">재학</c:when>
								<c:when test="${stuInfo.STU_STATUS == 1 }">휴학</c:when>
								<c:when test="${stuInfo.STU_STATUS == 2 }">자퇴</c:when>
								<c:when test="${stuInfo.STU_STATUS == 3 }">졸업</c:when>
								<c:when test="${stuInfo.STU_STATUS == 4 }">제적</c:when>
								<c:when test="${stuInfo.STU_STATUS == 4 }">졸업유예</c:when>
								<c:otherwise>정보없음</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th style="background: #d2e8f1;">학과(전공)</th>
						<td>${stuInfo.get("DEPT_NM")}</td>
						<th style="background: #d2e8f1;">학년/학기</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${stuInfo.STU_SEMESTER== 1 || stuInfo.STU_SEMESTER == 2}">
									1<span>학년</span>
								</c:when>
								<c:when test="${stuInfo.STU_SEMESTER== 3 || stuInfo.STU_SEMESTER == 4}">
									2<span>학년</span>
								</c:when>
								<c:when test="${stuInfo.STU_SEMESTER== 5 || stuInfo.STU_SEMESTER == 6}">
									3<span>학년</span>
								</c:when>
								<c:when test="${stuInfo.STU_SEMESTER== 7 || stuInfo.STU_SEMESTER == 8}">
									4<span>학년</span>
								</c:when>
							</c:choose>
							<c:set var="ymd" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
							<fmt:parseNumber value="${mm}" var="num" />
							<c:if test="${stuInfo.STU_SEMESTER % 2 != 0}">
							1<span>학기</span>
							</c:if>
							<c:if test="${stuInfo.STU_SEMESTER % 2 == 0}">
							2<span>학기</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th style="background: #d2e8f1;">복수전공</th>
						<td>
						<c:if test="${stuInfo.STU_DMAJOR == 0 || stuInfo.STU_DMAJOR == '' }">없음</c:if>
						${stuInfo.DMAJOR_NM}
						</td>
						<th rowspan="2" style="background: #d2e8f1;">이수학점</th>
						<th style="background: #d2e8f1; text-align:center;">전공</th>
						<td colspan="2">${stuInfo.get("MAJOR_RECODE")}</td>
					</tr>
					<tr>
						<th style="background: #d2e8f1;">부전공</th>
						<td>
						<c:if test="${stuInfo.STU_MINOR == 0 || stuInfo.STU_MINOR == '' }">없음</c:if>
						${stuInfo.MINOR_NM}
						</td>
						<th style="background: #d2e8f1; text-align:center;">교양</th>
						<td colspan="2">${stuInfo.get("ELECTIVE_RECODE")}</td>
					</tr>
			</table>
		</div>
		<hr />
	  <form action="">
		<div class="card">
			<div class="card-body">
				<div class="mx-auto" >
					<div class="row text-end" style="">
						<label for="ip_tranYear" class="col-md-1 col-form-label">전과년도</label>
						<div class="col-md-2">
							<fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
							<input class="form-control" type="search" value="${yyyy}년도" id="ip_tranYear" readonly />
						</div>
						<label for="ip_semester" class="col-md-1 col-form-label">전과학기</label>
						<div class="col-md-3">
							<c:if test="${num < 9}">
								<input class="form-control" type="search" value="1학기" id="ip_semester" readonly />
							</c:if>
							<c:if test="${num >= 9}">
								<input class="form-control" type="search" value="1학기" id="html5-search-input" />
							</c:if>
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
						</div>
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">전과사유</label> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input class="form-control" type="search" id="ipClick" required /> -->
<!-- 						</div> -->
					</div>
					<br/>
					<div class="row text-end" style="">
						<label for="selecColl" class="col-md-1 col-form-label">전과 대학</label>
						<div class="col-md-2">
							<select id="selecColl" class="selectpicker w-100" data-style="btn-default">
								<c:forEach var="AcaColleageVO" items="${CNDList}" varStatus="stat">
							  	<c:if test="${cndMapList[0].COLL_NUM == AcaColleageVO.collNum}">
								<option value="${AcaColleageVO.collNum}" selected="selected">${AcaColleageVO.collNm}</option>
							  	</c:if>
								<c:if test="${cndMapList[0].COLL_NUM != AcaColleageVO.collNum}">
								<option value="${AcaColleageVO.collNum}">${AcaColleageVO.collNm}</option>
							  	</c:if>
							  </c:forEach>
				            </select>
						</div>
						<label for="selectDept" class="col-md-1 col-form-label">전과학과</label>
						<div class="col-md-3">
							<select id="selectDept" class="selectpicker w-100" data-style="btn-default">
								<c:forEach var="cndMap" items="${cndMapList}" varStatus="stat">
<%-- 								<option value="${cndMap.DEPT_NUMBER}">(${cndMap.COLL_NM})${cndMap.DEPT_NM}</option> --%>
								<option value="${cndMap.DEPT_NUM}" >${cndMap.DEPT_NM}</option>
							  </c:forEach>
				            </select>
						</div>
						<label for="ipAddFee" class="col-md-1 col-form-label">추가 등록금</label>
						<div class="col-md-4" id="divAddFee">
							<input class="form-control" type="search"
								value="" id="ipAddFee" readonly />

<%-- 							<fmt:formatNumber --%>
<%--  								value="<input class="form-control" type="search" --%>
<%--  											value="" id="ipAddFee" readonly />" --%>
<%--  								type="currency" currencySymbol="\"></fmt:formatNumber> --%>


						</div>
					</div>
					<br/>
					<div class="row text-end">
						<label for="html5-search-input" id="dateLabel" class="col-md-1 col-form-label">신청일</label>
						<div class="col-md-4">
							<fmt:formatDate value="${ymd}" pattern="yyyy.MM.dd" var="yyMMdd" />
							<input class="form-control" type="search" value="${yyMMdd}" id="html5-search-input" readonly />
						</div>
					</div>
					<button type="button" id="btnAppTR" class="btn btn-primary col-2" style="float: right; margin: 20px;" >신청하기</button>
				</div>
			</div>
			<div class="card-footer"></div>
		</div>
	  </form>
	</div>
</div>

<script>
$(document).ready(function(){
	//가장 상단의 과로 전과 시 발생하는 추가등록금
	let tranDeptNum = $("#selectDept").val();
	console.log("ready 시 tranDeptNum : " + tranDeptNum);
	let preDeptNum = ${stuInfo.DEPT_NUM};
	let data = {"preDeptNum":preDeptNum, "tranDeptNum":tranDeptNum};

	$.ajax({
		url : "/academic/addFee",
		contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
		data : JSON.stringify(data),		//=> 보내는 데이터(?)
		dataType : "json",										//=> dataType은 '응답타입'
		type : "post",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			let addFee = 0;
			if(result.ADDFEE < 0){
				addFee = 0;
			}
			else{
				addFee = result.ADDFEE;
				console.log("addFee : " + addFee);
			}

			let iAddFee = parseInt(addFee);
			console.log("iAddFee : " + iAddFee);

			$("#ipAddFee").val(str);


		},
		error : function(){

		}
	});

	$("#selecColl").on("change", function(){
// 		console.log("두유야");
// 		console.log("두유야..?")
// 		alert("두유");
		let collNum =  $(this).val();
		console.log("collNum : " + collNum);

		let data = { "collNum":collNum}

		location.href="/academic/acaTRStu?collNum="+collNum;
	});

	$("#selectDept").on("change", function(){
// 		alert("두유");
		let tranDeptNum = $(this).val();
		console.log("tranDeptNum : " + tranDeptNum);

		let preDeptNum = ${stuInfo.DEPT_NUM};
		console.log("preDeptNum : " + preDeptNum);

		let data = {"preDeptNum":preDeptNum, "tranDeptNum":tranDeptNum};

		$.ajax({
			url : "/academic/addFee",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				alert("다녀옴");
				let addFee = 0;
				if(result.ADDFEE < 0){
					addFee = 0;
				}
				else{
					addFee = result.ADDFEE;
				}

				$("#ipAddFee").val(addFee);

			},
			error : function(){
				alert("실패");
			}
		});
	});

	$("#btnAppTR").on("click", function(){
		let mRecode = ${stuInfo.get("MAJOR_RECODE")};
		console.log("mRecode : " + mRecode);
		let eRecode = ${stuInfo.get("ELECTIVE_RECODE")};
		console.log("eRecode : " + eRecode);
		let meSum = mRecode + eRecode;
		console.log("meSum : " + meSum);


		let stuNum = ${stuInfo.get("STU_NUM")};

		console.log("tranDeptNum : " + tranDeptNum);

		let data = {
						//"mRecode":mRecode,
						//"eRecode":eRecode,
						"tranDeptNum":tranDeptNum,
						"preDeptNum":preDeptNum,
						"stuNum":stuNum
					};

// 		let ipReason = $("#ipClick").val();
// 		if(ipReason == null || ipReason == ''){
// 			Swal.fire({
// 		    	  html: '전과사유를 입력해주세요.',
// 		    	  icon: 'warning',

// 		    	  confirmButtonText: '확인'
// 		      });

		if(meSum < 40){


			Swal.fire({
		    	  html: '40학점 이상 이수 시에만 전과신청이 가능합니다.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'
		      });

		}else {

			$.ajax({
				url : "/academic/appTR",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					//alert("다녀옴!");
					if(result.result == 'wait'){
						//alert("승인대기 상태인 전과신청 내역이 존재합니다.");
						Swal.fire({
					    	  html: '승인대기 상태인 전과신청 내역이 존재합니다.<br />학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else if(result.result == 'exist'){
						//alert("승인완료된 전과신청 내역이 존재합니다.");
						Swal.fire({
					    	  html: '승인완료된 전과신청 내역이 존재합니다.<br />학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else if(result.result == 'over'){
						//alert("전과 신청정원을 초과하였습니다. 전과신청이 불가합니다.")
						Swal.fire({
					    	  text: '전과 신청정원을 초과하였습니다. 전과신청이 불가합니다.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      });
					}else if(result.result == 'success'){
						//alert("성공");
						Swal.fire({
					    	  html: '전과신청이 등록되었습니다.<br />학적변동 신청목록 화면으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else{
						alert("전과신청이 처리되지 않았습니다. 다시 시도해주세요.")
					}

				},
				error : function(){
					alert("오류가 발생하였습니다. 관리자에게 문의해주세요.")
				}
			});
		}

	});
});
</script>
