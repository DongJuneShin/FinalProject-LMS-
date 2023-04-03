<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
td{
	text-align: center;
	font-size: 0.9rem;
}
</style>

<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="s">학적변동 신청내역</a>
		</h5>
<%-- 	stuInfoMap : ${stuInfo}	 --%>
<%-- LHVOList : ${LHVOList} <br /> --%>
<%-- LHVOList[0] : ${LHVOList[0]}   --%>


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
		<!-- tab -->

			  <div class="nav-align-top mb-4">
			    <ul class="nav nav-tabs nav-fill" role="tablist">
			      <li class="nav-item" role="presentation">
			        <button type="button" id="btnNavLV" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="false" tabindex="-1">
			        	<i class='bx bx-leaf'></i> 휴학
			        </button>
			      </li>
			      <li class="nav-item" role="presentation">
<!-- 			        <button type="button" id="btnNavRT" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="true"> -->
			        <button type="button" id="btnNavRT" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="true">
			        	<i class='bx bxs-leaf' ></i> 복학
			        </button>
			      </li>
			    </ul>
			    <div class="tab-content">
					<div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
						<!-- 휴학 신청양식 -->
				        <form action="">
				        	<input type="hidden" value="" />
					        <div class="mb-3 row">
						      <label for="html5-text-input" class="col-md-2 col-form-label">휴학 시작학기</label>
						      <div class="col-md-10">

						      	<c:set var="ymd" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
<%-- 								yy : ${yyyy} <br /> --%>
								<fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
<%-- 								ymd : ${mm} <br /> --%>
								<fmt:parseNumber value="${mm}" var="num" />

<%-- 								num : ${num} --%>
								<c:if test="${num < 9}">
							        <input class="form-control" type="text" value="${yyyy}-1학기" id="acSdt" readonly />
								</c:if>
								<c:if test="${num >= 9}">
							        <input class="form-control" type="text" value="${yyyy}-2학기" id="acSdt" readonly />
								</c:if>

						      </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="selectpickerBasic" class="col-md-2 col-form-label">사유</label>
						      	<div class="col-md-10">
							      	<select id="leaveSel" class="selectpicker w-100" data-style="btn-default">
							      	<option>개인사정</option>
										<option>군휴학</option>
										<option>건강악화</option>
						            </select>
					            </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="html5-month-input" class="col-md-2 col-form-label">휴학기수</label>
						      <div class="col-md-4" id="seldiv1">
						        <select id="selectLV" class="selectpicker w-100" data-style="btn-default">
						        	<option selected="selected">1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
					            </select>
						      </div>
						      <label for="html5-search-input" class="col-md-2 col-form-label">복학 학기</label>
						      <div class="col-md-4">
						        <input class="form-control" type="search" value="2023-2학기" id="ip_return" readonly />
						      </div>
						    </div>
						    <div class="mb-3 row">
						    </div>
				          <button type="button" id="btnLeave" class="btn btn-primary col-2" style="float: right;" >신청하기</button>
				        </form>
				    </div>
					<!-- /휴학신청 끝 -->

			      <!-- 복학신청 시작 -->
			      <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
						<form>
				        	<input type="hidden" value="" />
					        <div class="mb-3 row">
						      <label for="html5-text-input" class="col-md-2 col-form-label" style="text-align: center;">휴학 시작학기</label>
						      <div class="col-md-10">
						        <input class="form-control" type="text" value='<c:if test="${LHVOList!= null}">${LHVOList[0].acSdt}학기</c:if>'
						        	id="html5-text-input" style="width: 300px; text-align: center;" readonly />
						      </div>
						    </div>
<!-- 						    <div class="mb-3 row"> -->
<!-- 						      <label for="" class="col-md-2 col-form-label">사유</label> -->
<!-- 						      <div class="col-md-10"> -->
<%-- 						        <input class="form-control" type="text" value='<c:if test="${LHVOList!= null}">${LHVOList[0].acReason}</c:if>' id=""  readonly /> --%>
<!-- 						      </div>  -->
<!-- 						      	<div class="col-md-10"> -->
<!-- 							      	<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
<!-- 							      	<option>개인사정</option> -->
<!-- 										<option>군휴학</option> -->
<!-- 										<option>건강악화</option> -->
<!-- 						            </select> -->
<!-- 					            </div> -->
<!-- 						    </div> -->
						    <div class="mb-3 row">
<!-- 						      <label for="html5-month-input" class="col-md-2 col-form-label">휴학기수</label> -->
<!-- 						      <div class="col-md-4"> -->
<!-- 						        <select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
<!-- 						        <option>1</option> -->
<!-- 									<option>2</option> -->
<!-- 					            </select> -->
<!-- 						      </div> -->
						      <label for="html5-search-input" class="col-md-2 col-form-label" style="text-align: center;">복학 예정학기</label>
						      <div class="col-md-4">
						        <input class="form-control" type="search" value='<c:if test="${LHVOList!= null}">${LHVOList[0].acEdt}학기</c:if>'
						        	id="html5-search-input" style="width: 300px; text-align: center;" readonly />
						      </div>
						      <label for="html5-search-input" class="col-md-2 col-form-label" style="text-align: center;">복학 신청학기</label>
						      <div class="col-md-4">
<!-- 						        <input class="form-control" type="search" value="" id="html5-search-input" /> -->
								<c:set var="ymd" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${ymd}" pattern="yyyy" var="yyyy" />
<%-- 								yy : ${yyyy} <br /> --%>
								<fmt:formatDate value="${ymd}" pattern="MM" var="mm" />
<%-- 								ymd : ${mm} <br /> --%>
								<fmt:parseNumber value="${mm}" var="num" />

<%-- 								num : ${num} --%>
								<c:if test="${num < 9}">
							        <input class="form-control" type="text" value="${yyyy}-1학기"
							        	id="sdt" style="width: 300px; text-align: center;" readonly />
								</c:if>
								<c:if test="${num >= 9}">
							        <input class="form-control" type="text" value="${yyyy}-2학기"
							        	id="sdt" style="width: 300px; text-align: center;" readonly />
								</c:if>

						      </div>
						    </div>
						    <div class="mb-3 row">
						    </div>
				          <button type="button" id="btnRt" class="btn btn-primary col-2" style="float: right;" >신청하기</button>
				        </form>
			      </div>
			      <!-- /복학신청 끝 -->
			  </div>
			    <!-- /"tab-content" -->

		<!-- /tab -->
	</div>
</div>

<script type="text/javascript">
// $(function(){
$(document).ready(function(){

	$("#seldiv1").on("click", function(){
		let opt0 = $("#seldiv1").find("option").eq(0).text();
		//console.log(opt0);
		let opt1 = $("#seldiv1").find("option").eq(1).text();
		//console.log(opt1);


	});

	$("#selectLV").on("change", function(){
		let idx = $(this).parent().find("#selectLV option").index($(this).parent().find("#selectLV option:selected"));
// 		console.log("idx : " + idx);

		if(idx == 1){
			$("#ip_return").val("2024-1학기");
		}else if(idx == 0){
			$("#ip_return").val("2023-2학기");
		}else if(idx == 2){
			$("#ip_return").val("2024-2학기");
		}else if(idx == 3){
			$("#ip_return").val("2025-1학기");
		}else{
			$("#ip_return").val("2023-2학기");
		}
	});

	$("#btnLeave").on("click", function(){
		let v_acSdt = $("#acSdt").val();
		console.log(v_acSdt);
		let acSdt = v_acSdt.substr(0,6);
		console.log(acSdt);
		let v_acEdt = $("#ip_return").val();
		console.log(v_acEdt);
		let acEdt = v_acEdt.substr(0,6);
		console.log(acEdt);

		let acReason = $("#leaveSel").val();
		console.log("acReason : " + acReason);

		let data = {
					  "acReason":acReason,
					  "acSdt":acSdt,
					  "acEdt":acEdt,
					  "acList":1
					}

		$.ajax({
			url : "/academic/leaveStu",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
			 console.log("success 아래 result : " , result.result);

			 	if(result.stResult == -2){
			 		//alert("학적상태가 '재학'인 경우에만 휴학신청이 가능합니다.")
			 		Swal.fire({
				    	  html: "학적상태가 '재학'인 경우에만 휴학신청이 가능합니다.<br />학적상태를 확인하십시오.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'
				      });
			 	}else{

					if(result.result > 0){
						//console.log("성공 위 result : " , result.result);
						//alert("신청 성공. 신청목록 화면으로 이동합니다.");

						Swal.fire({
					    	  html: "휴학신청이 처리되었습니다.<br />신청목록 화면으로 이동합니다.",
					    	  icon: 'success',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});

					}else if(result.result < 0){
						//console.log("대기 위 result : " , result.result);
						//alert("대기중인 휴학신청 내역이 존재합니다.");

						Swal.fire({
					    	  html: "승인 대기 중인 휴학신청 내역이 존재합니다.<br /> 신청목록 화면으로 이동합니다.",
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'
					      }).then(result => {
					    	  location.href = "/academic/acaListStu";
					      	});
					}else{
						//console.log("실패 위 result : " , result.result);
						//alert("신청 실패. 재시도 하십시오.");

						Swal.fire({
					    	  html: "휴학신청 처리를 실패하였습니다.<br />관리자에게 문의하십시오.",
					    	  icon: 'error',

					    	  confirmButtonText: '확인'
					      });
					}
			 	}



			},
			error : function(){
				console.log("error아래 : ")
				alert("신청 실패. 재등록 요망");
			}
		});
	});


	$("#btnNavRT").on("click", function(){



		$.ajax({
			url : "/academic/searchLeave",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			//data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result > 0){
					$("#btnNavRT").attr("data-bs-target", "#navs-justified-profile");
				}else if(result < 0){
					//alert("학적상태가 '휴학'인 경우에만 접근 가능합니다.");
					Swal.fire({
				    	  text: "학적상태가 '휴학'인 경우에만 접근 가능합니다.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      });

					$("#btnNavLV").attr("class", "nav-link active");
					$("#btnNavRT").attr("class", "nav-link");
// 					$("#btnNavRT").atttr("data-bs-target", "#navs-justified-home");
// 					$("#btnNavRT").atttr("aria-controls", "navs-justified-home");
					$("#navs-justified-home").attr("class","tab-pane active show");
					$("#navs-justified-profile").attr("class","tab-pane fade");
				}
			},
			error : function(){
				//alert("접근할 수 없습니다.")
				Swal.fire({
			    	  text: "접근이 불가합니다.",
			    	  icon: 'error',

			    	  confirmButtonText: '확인'
			      });
			}
		});

	});

	$("#btnRt").on("click", function(){
		let v_sdt = $("#sdt").val();
		let sdt = v_sdt.substr(0,6);
		console.log("btnRT 클릭 시 sdt : " + sdt);

		let data = {"acSdt":sdt}

		$.ajax({
			url : "/academic/appReturn",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
				if(result > 0){
					//alert("복학신청 완료");

					Swal.fire({
				    	  html: "복학신청이 등록되었습니다.<br />학적변동 신청목록 화면으로 이동합니다.",
				    	  icon: 'success',

				    	  confirmButtonText: '확인'
				      }).then(result => {
				    	  location.href = "/academic/acaListStu";
				      	});
				}else if(result == -1){
					//alert("승인 대기 중인 복학신청 내역이 존재합니다.");
					Swal.fire({
				    	  text: "승인 대기 중인 복학신청 내역이 존재합니다.",
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'
				      });
				}else{
					//alert("복학신청 실패");
					Swal.fire({
				    	  html: "복학신청 처리를 실패하였습니다.<br />관리자에게 문의하십시오.",
				    	  icon: 'error',

				    	  confirmButtonText: '확인'
				      });
				}
			},
			error : function(){

			}
		});
	});



// });
});

</script>

