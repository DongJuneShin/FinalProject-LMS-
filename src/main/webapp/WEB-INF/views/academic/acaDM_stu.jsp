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
<%-- 		CNDList : ${CNDList}  --%>


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
	  <form action="" id="deptForm" >
		<div class="card">
			<div class="card-body">
				<div class="mx-auto" >
<!-- 					<div class="row text-end" style=""> -->
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">전과년도</label> -->
<!-- 						<div class="col-md-2"> -->
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
<!-- 						</div> -->
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">전과학기</label> -->
<!-- 						<div class="col-md-3"> -->
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
<!-- 						</div> -->
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">전과사유</label> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<br/>
<!-- 					<div class="row text-end" style="justify-content: center;">  -->
					<div class="row text-end" style="justify-content: center;">
						<label for="html5-search-input" class="col-md-1 col-form-label" style="text-align: center;" >구분 </label>
						<div class="col-md-2">
							<select id="selCate" class="selectpicker w-100" data-style="btn-default">
								<option>복수전공</option>
								<option>부전공</option>
				            </select>
						</div>

						<div class="col-md-3"></div>
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">전과학과</label> -->
<!-- 						<div class="col-md-3"> -->
<!-- 							<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
<!-- 								<option>1</option> -->
<!-- 								<option>2</option> -->
<!-- 				            </select> -->
<!-- 						</div> -->
					</div>
					<br/>
<!-- 					<div class="row text-end" style="justify-content: center;"> -->
					<div class="row text-end" style="justify-content: center;">
						<label for="selecColl" class="col-md-2 col-form-label" >대상 대학</label>
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
						<label for="selectDept" class="col-md-1 col-form-label" >대상 학과</label>
						<div class="col-md-3" id="selDiv">
							<select id="selectDept" class="selectpicker w-100" data-style="btn-default" >
							  <c:forEach var="cndMap" items="${cndMapList}" varStatus="stat">
<%-- 								<option value="${cndMap.DEPT_NUMBER}">(${cndMap.COLL_NM})${cndMap.DEPT_NM}</option> --%>
								<option value="${cndMap.DEPT_NUM}" >${cndMap.DEPT_NM}</option>
							  </c:forEach>
				            </select>
						</div>
<!-- 						<label for="html5-search-input" class="col-md-1 col-form-label">추가 등록금</label> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" /> -->
<!-- 						</div> -->
					</div>
					<br/>
					<div class="row text-end" style="justify-content: center;">
						<label for="html5-search-input" class="col-md-2 col-form-label" >신청일자</label>
						<div class="col-md-6">
							<c:set var="ymd" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" var="yyyy" />
							<input class="form-control" type="search" value="${yyyy}" id="html5-search-input" readonly />
						</div>
<!-- 						<div class="col-md-1"></div> -->
					</div>
					<button type="button" id="btnApp" class="btn btn-primary col-2" style="float: right; margin: 20px;" >신청하기</button>
				</div>
			</div>
			<div class="card-footer"></div>
		</div>
	  </form>
	</div>
</div>

<script>
$(document).ready(function(){
// 	let sv = $("#selecColl").val();
// 	console.log(sv);
// 	let sc = $("#selectDept").val();
// 	console.log(sc);

	$("#selecColl").on("change", function(){
// 		console.log("두유");
		let collNum =  $(this).val();
		console.log("collNum : " + collNum);

		let data = { "collNum":collNum}

		location.href="/academic/acaDMStu?collNum="+collNum;
	});

	$("#btnApp").on("click", function(){
		let v_sc = $("#selCate").val();
		console.log(v_sc);
		let dmDivision = 0;
		if(v_sc=='복수전공'){
			dmDivision = 0;
			console.log("dmDivision : " + dmDivision);
		}else if(v_sc == '부전공'){
			dmDivision = 1;
			console.log("dmDivision : " + dmDivision);
		}

		//let selcoll = $("#selecColl").val();
		//console.log("selcoll : " + selcoll);

		let selectDept = $("#selectDept").val();
		console.log("selectDept : " + selectDept);
		console.log("마지막 dmDivision : " + dmDivision);

		//학과번호, 복수/부전공 구분 넘겨야함.
		let data = {
					  "deptNo":selectDept,
					  "dmDivision":dmDivision
					};

		$.ajax({
			url : "/academic/appDM",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				alert("다녀옴!");
				console.log("result : " + JSON.stringify(result.result));

				//신청 조건을 불충족한 경우(이수학기, 평균평점, 전공이수학점 등)
				if(result.result == 'Dfail'){	//복수전공 조건을 불충족한 경우
					let semester = result.semester;
					console.log("semester : " + semester);
					let ar = result.ar;
					console.log("ar : " + ar);
					let sumMajor = result.sumMajor;
					console.log("sumMajor : " + sumMajor);

					Swal.fire({
				    	  html: '복수전공 신청 조건을 충족하지 않습니다.<br/> 이수학기: '+ semester +'<br/>평균평점: '+ ar + '<br />전공이수학점: '
				    	  		+ sumMajor +'<br />',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  //location.href = "/academic/acaListStu";
				    	  return false;
				      	});

				}else if(result.result == 'Mfail'){
					let semester = result.semester;
					let ar = result.ar;

					Swal.fire({
				    	  html: '부전공 신청 조건을 충족하지 않습니다.<br/> 이수학기: '+ semester +'<br/>평균평점: '+ ar + '<br />',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  //location.href = "/academic/acaListStu";
				    	  return false;
				      	});



				//승인 대기 중인 신청 이력이 있거나, 승인 완료된 복수전공/부전공 신청 이력이 있는 경우
				}else if(result.result == 1){
					Swal.fire({
				    	  html: '신청 완료.<br /> 학적변동 신청목록 화면으로 이동합니다.',
				    	  icon: 'success',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'de'){
					Swal.fire({
				    	  html: '승인대기 상태인 복수전공 신청내역이 존재합니다.<br /> 학적변동 신청목록 화면으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'me'){
					Swal.fire({
				    	  html: '승인대기 상태인 부전공 신청내역이 존재합니다.<br /> 학적변동 신청목록 화면으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'deOK'){
					Swal.fire({
				    	  html: '승인완료된 복수전공 신청내역이 존재합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result.result == 'meOK'){
					Swal.fire({
				    	  html: '승인완료된 부전공 신청내역이 존재합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else{
					Swal.fire({
				    	  html: '신청을 처리할 수 없습니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaDMStu";
				      	});
				}
			},
			error : function(){
				Swal.fire({
			    	  html: '처리 실패.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaDMStu";
			      	});
			}
		});

	});


});
</script>
