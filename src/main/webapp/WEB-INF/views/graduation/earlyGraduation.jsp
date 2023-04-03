<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

input {
	text-align: center;
}

#btnRJ {
	font-size: 13px;
	padding: 0px;
	width: 60px;
	height: 30px;
}

.badge {
	text-align: center;
	padding-top: 10px;
	font-size: 13px;
	width: 60px;
	height: 30px;
}


</style>
<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="s">조기졸업 신청</a>
		</h5>

<%-- 		stuInfo : ${stuInfo} --%>
<%-- 		appEGList : ${appEGList} --%>

	</div>
	<div class="card-body mx-auto">
		<p><i class='bx bx-badge'></i>조기졸업 신청</p>
		<hr/>
		<br />
		<div class="container text-center">
			<div class="row" style="align-items: center;">
				<label class="col-md-1">학번</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.STU_NUM}" id="html5-search-input" readonly />
				</div>
				<label class="col-md-1 ">이름</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.STU_NM_KOR}" id="ipStuNm" readonly />
				</div>

			</div>
			<br/>
			<div class="row" style="align-items: center;">
				<label class="col-md-1">단과대학</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.COLL_NM}" id="html5-search-input" readonly />
				</div>
				<label class="col-md-1 ">학과</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.DEPT_NM}" id="html5-search-input" readonly />
				</div>

				<label class="col-md-2">학년</label>
				<div class="col-md-2">
					<c:choose>
						<c:when test="${stuInfo.STU_SEMESTER== 1 || stuInfo.STU_SEMESTER == 2}">
							<input class="form-control" type="search" value="1학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 3 || stuInfo.STU_SEMESTER == 4}">
							<input class="form-control" type="search" value="2학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 5 || stuInfo.STU_SEMESTER == 6}">
							<input class="form-control" type="search" value="3학년" id="html5-search-input" readonly />
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER== 7 || stuInfo.STU_SEMESTER == 8}">
							<input class="form-control" type="search" value="4학년" id="html5-search-input" readonly />
						</c:when>
					</c:choose>
				</div>


			</div>
			<br/>
			<div class="row" style="align-items: center;">
				<label class="col-md-1">복수전공</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.DMAJOR_NM}" id="ipDmajor" readonly />
				</div>
				<label class="col-md-1 ">부전공</label>
				<div class="col-md-3">
					<input class="form-control" type="search" value="${stuInfo.MINOR_NM}" id="ipMinor" readonly />
				</div>
				<label class="col-md-2">학적상태</label>
				<div class="col-md-2" id="divStatus">
				  <c:choose>
					<c:when test="${stuInfo.STU_STATUS == 0 }"><input class="form-control" type="search" value="재학" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 1 }"><input class="form-control" type="search" value="휴학" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 2 }"><input class="form-control" type="search" value="자퇴" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 3 }"><input class="form-control" type="search" value="졸업" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 4 }"><input class="form-control" type="search" value="제적" id="html5-search-input" readonly /></c:when>
					<c:when test="${stuInfo.STU_STATUS == 4 }"><input class="form-control" type="search" value="졸업유예" id="html5-search-input" readonly /></c:when>
					<c:otherwise>정보없음</c:otherwise>
				  </c:choose>
				</div>
			</div>

			<hr/>
			<br/>
			<form>
				<div class="row " style="align-items: center;">
					<label for="ipEgReason" class="col-md-2 text-center">신청 사유</label>
					<div class="col-md-9">
<!-- 						<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
<!-- 			              <option>Rocky</option> -->
<!-- 			              <option>Pulp Fiction</option> -->
<!-- 			              <option>The Godfather</option> -->
<!-- 			            </select> -->
						<input class="form-control" type="text" value="" id="ipEgReason" placeholder="조기졸업 신청사유를 입력하세요." />
					</div>
				</div>
				<br/>
				<button type="button" id="btnAppEg" class="btn btn-primary col-2" style="float: right; padding-right: -10px;" >신청하기</button>
			</form>
		</div>
		<!-- /container -->
	</div>
</div>
<br/>
<div class="card">
	<div class="div-header">
	</div>
	<div class="card-body">
	<table class="table">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th>구분</th>
				<th>신청학기</th>
				<th>신청사유</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach var="AcademicVO" items="${appEGList}" varStatus="stat">
			<tr>
				<th scope="row">${stat.count}</th>

				<c:if test="${AcademicVO.acList eq 3}">
					<td>조기졸업</td>
				</c:if>
				<c:if test="${AcademicVO.acList ne 3}">
					<td></td>
				</c:if>

				<td>${AcademicVO.acSdt}학기</td>
				<td>${AcademicVO.acReason}</td>

				<c:choose>
				  <c:when test="${AcademicVO.acCheck eq 0}">
				  	<td colspan="2"><span class="badge rounded-pill bg-label-success">대기</span></td>
				  </c:when>
				  <c:when test="${AcademicVO.acCheck eq 1}">
				  	<td colspan="2"><span class="badge rounded-pill bg-label-info" style="width: 100px; height: 100px;">승인</span></td>
				  </c:when>
				  <c:when test="${AcademicVO.acCheck eq 2}">
				  	<td colspan="2" style="width: 50px;">
				  		<p id="pAcNum" style="display: none;">${AcademicVO.acNum}</p>
				  		<button type="button" id="btnRJ" class="btn rounded-pill btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalToggle">반려</button>
				  	</td>
				  </c:when>
				  <c:otherwise>
				  	<td><span class="badge rounded-pill bg-label-success">대기</span></td>
				  </c:otherwise>
				</c:choose>

<!-- 						<span class="badge rounded-pill bg-label-dark" ><button type="button" id="btnOk" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalToggle">반려</button></span> -->
<!-- 					<td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalToggle">반려</button></td> -->
<!-- 						<button type="button" class="btn rounded-pill btn-secondary">Secondary</button> -->
			</tr>

		  </c:forEach>
		  <div id="divInfo" style="float: right;"><span>* '반려' 문구 클릭 시 반려사유 확인가능</span></div>
		</tbody>
	</table>
	</div>

</div>

<!-- Modal 1-->
          <div class="modal fade" id="modalToggle" aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="modalToggleLabel">반려사유</h5>
<!--                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div id="divModal" class="modal-body">
                  Show a second modal and hide this one with the button below.
                </div>
                <div class="modal-footer">
<!--                   <button class="btn btn-primary" data-bs-target="#modalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Open second modal</button> -->
                  <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>

<script>
$(document).ready(function(){
	let status = $("#divStatus input").val();
// 	console.log("학적상태 : " + stst);


	$(".table").DataTable({
		dom: '<"top">lrt<"bottom"p><"clear">',
		});

	$("#btnAppEg").on("click", function(){
		let egReason = $("#ipEgReason").val();
// 		console.log("egReason : " + egReason);

		if(egReason == null || egReason == ''){
// 			console.log("널! : " + egReason);

			Swal.fire({
		    	  html: "신청사유를 입력하세요.",
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'
		      });

		}else if(status == '졸업'){

			Swal.fire({
		    	  html: "학적상태가 '졸업'인 경우에는 신청이 불가합니다.",
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'
			});

		}else{


			//학생명
			let stuNm = $("#ipStuNm").val();
			console.log("stuNm : " + stuNm);

			//복수전공, 부전공 조회
			let v_dMajor = $("#ipDmajor").val();
			let dMajor = v_dMajor.trim();
			console.log("dMajor : " + dMajor);
			let v_minor = $("#ipMinor").val();
			let minor = v_minor.trim();
			console.log("minor : " + minor);

			//학생학기
			let strSemester = ${stuInfo.STU_SEMESTER};
			let semester = parseInt(strSemester, 10)
			console.log("semester : " + semester);

			//전공 이수학점, 교양 이수학점 조회
			//전공 이수학점
			let strMajorRecode = ${stuInfo.MAJOR_RECODE};
			let majorRecode = parseInt(strMajorRecode, 10);
			console.log("majorRecode : " + majorRecode);

			//교양 이수학점
			let strElectiveRecode = ${stuInfo.ELECTIVE_RECODE};
			let electiveRecode = parseInt(strElectiveRecode, 10);
			console.log("electiveRecode : " + electiveRecode);

			//총 이수학점
			let sumRecode = majorRecode + electiveRecode;
			console.log("sumRecode : " + sumRecode);

			if(dMajor != ''){
	// 			alert("조기졸업은 단일전공인 경우에만 신청 가능합니다.");

				Swal.fire({
			    	  html: "복수전공자는 조기졸업 신청이 불가합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(minor != ''){
				Swal.fire({
			    	  html: "부전공자는 조기졸업 신청이 신청이 불가합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(semester < 6){
	// 			alert("6학기 이상 이수 시 신청 가능합니다.");

				Swal.fire({
			    	  html: "6학기 이상 이수 시 신청 가능합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(majorRecode < 60){
	// 			alert("전공 이수학점이 60학점 이상인 경우에만 신청 가능합니다.");

				Swal.fire({
			    	  html: "전공과목 60학점 이상 이수 시 신청 가능합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else if(sumRecode < 130){
	// 			alert("130학점 이상 이수 시에만 신청 가능합니다.");

				Swal.fire({
			    	  html: "130학점 이상 이수 시에만 신청 가능합니다.",
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'
			      });

			}else {	//평균평점 4.0이상, F학점 없을 시 조기졸업 신청 등록

				$.ajax({
					url : "/grad/earlyGraduation",
					contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
					//data : JSON.stringify(data),		//=> 보내는 데이터(?)
					dataType : "json",										//=> dataType은 '응답타입'
					type : "post",
					beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
						let avgFscore = result.avgFscore;
	// 					alert("다녀옴!");
						if(result.result == 'lowScore'){
	// 						alert(stuNm + " 학생의 평균평점 : " + avgFscore + "평균평점이 4.0 이상인 경우에만 신청 가능합니다.");

							Swal.fire({
						    	  html: stuNm + " 학생의 평균평점 : " + avgFscore + "<br />평균평점이 4.0 이상인 경우에만 신청 가능합니다.",
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'
						      });

						}else if(result.result == 'fExist'){
	// 						alert("F학점이 취득 이력이 존재합니다. 조기졸업 신청이 불가합니다.");

							Swal.fire({
						    	  html: "F학점이 취득 이력이 존재합니다. 조기졸업 신청이 불가합니다.",
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'
						      });

						}else if(result.result == 'success'){
	// 						alert("조기졸업 신청이 정상적으로 처리되었습니다.");

							Swal.fire({
						    	  html: "조기졸업 신청이 정상적으로 처리되었습니다.",
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'
						      });

						}else{
	// 						alert("조기졸업 신청이 정상적으로 처리되지 않았습니다.");

							Swal.fire({
						    	  html: "조기졸업 신청이 정상적으로 처리되지 않았습니다.",
						    	  icon: 'error',

						    	  confirmButtonText: '확인'
						      });
						}
					},
					error : function(){
	// 					alert("조기졸업 신청이 정상적으로 처리되지 않았습니다. 관리자에게 문의하십시오.");

						Swal.fire({
					    	  html: "조기졸업 신청이 정상적으로 처리되지 않았습니다. 관리자에게 문의하십시오.",
					    	  icon: 'error',

					    	  confirmButtonText: '확인'
					      });
						}
					});
				}
			}
	});

	$(document).on("click", "#btnRJ", function(){
		console.log("두유0327");

		let stuNum = ${stuInfo.STU_NUM};
		console.log("stuNum : " + stuNum);

// 		let acNum= $(this).parents('tbody').find('p').text();
		let acNum= $(this).prev('p').text();
		console.log(acNum);

		let data = {
						"stuNum":stuNum,
						"acNum":acNum
					};

		$.ajax({
			url : "/grad/getSingleAppEG",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				alert("다녀옴!");
// 				alert("result.result : " + result.result);
				let acComre = result.result.acComre;
				console.log("acComre : " + acComre);

// 				alert(acComre);
				$("#divModal").html(acComre);

			},
			error : function(){
				Swal.fire({
			    	  html: "오류발생. 다시 시도하십시오.",
			    	  icon: 'error',

			    	  confirmButtonText: '확인'
			      });
			}

		});

	});

});
</script>










