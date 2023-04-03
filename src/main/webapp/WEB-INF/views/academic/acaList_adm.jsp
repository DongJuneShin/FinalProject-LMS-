<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
td{
	font-size: 1rem;
}
</style>
<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="s">학적변동 신청내역</a>
		</h5>

<%-- 		acaList : ${acaList} --%>
<%-- 		dmList : ${dmList} --%>
<%-- 		trList : ${trList} --%>

	</div>
	<div class="card-body">

		<div class="card">
			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-2 mb-3">
<!-- 	              <label for="smallSelect" class="form-label">Small select</label> -->
				  <select id="searchSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">학생명</option>
				    <option value="2">학과명</option>
<!-- 				    <option value="3">조기졸업</option> -->
				  </select>
	          </div>
	          <div class="col-md-2 mb-3">
	          	<input id="ipKeyword" value="" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	          <div class="col-md-2 mb-3">
	          	<button type="button" id="btnSearch" class="btn rounded-pill btn-secondary" style="float: left;">검색</button>
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-500" style="overflow:auto;" id="">
					<table id="acaTable" class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>학적변동 신청내역 &#91; ${acGpCnt} 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청사항</th>
								<th>신청사유</th>
<!-- 								<th>첨부파일</th> -->
								<th></th>
							</tr>
						</thead>
						<tbody id="acTbody">
						  <c:forEach var="acaMap" items="${acaList}" varStatus="stat">
							<tr id="acTr">
								<td>${stat.count}</td>
								<td><span class="badge rounded-pill bg-label-info">${acaMap.CHG_CHECK}</span></td>
								<td>${acaMap.STU_NUM}</td>
								<td>${acaMap.DEPT_NM}</td>
								<td>${acaMap.STU_NM_KOR}</td>
								<td id="tdCont">${acaMap.CONT}</td>
								<td>${acaMap.REASON}</td>
<!-- 								<td><i class='bx bxs-file-blank'></i></td> -->
								<td>
									<p style="display: none;">${acaMap.NUM}</p>
									<button type="button" id="btnGpApp" class="btn btn-info btn-sm">승인</button>
									<button type="button" id="btnGpRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>

				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>
		<br /><br /><br />
		<!-- 두번째 -->
		<div class="card">
			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-2 mb-3">
				  <select id="dmSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">학생명</option>
				    <option value="2">학과명</option>
				  </select>
	          </div>
	          <div class="col-md-2 mb-3">
	          	<input id="ipDmSearch" value="" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	          <div class="col-md-2 mb-3">
	          	<button type="button" id="btnDmSearch" class="btn rounded-pill btn-secondary" style="float: left;">검색</button>
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-500" style="overflow:auto;" id="">

					<table id="dmTable" class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>복수전공/부전공 신청내역 &#91; ${dmCnt} 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청사항</th>
								<th>신청학과</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="dmTbody">
						  <c:forEach var="dmMap" items="${dmList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td><span class="badge rounded-pill bg-label-info">${dmMap.DM_CHECK}</span></td>
								<td>${dmMap.STU_NUM}</td>
								<td>${dmMap.MAJOR_DEPT_NM}</td>
								<td>${dmMap.STU_NM_KOR}</td>
								<td id="tdCont">${dmMap.DM_DIVISION}</td>
								<td>${dmMap.APP_DEPT_NM}</td>
								<td>
									<p style="display: none;">${dmMap.DM_NUM}</p>
									<span style="display: none;">${dmMap.APP_DEPT_NUM}</span>
									<button type="button" id="btnDmApp" class="btn btn-info btn-sm">승인</button>
									<button type="button" id="btnDmRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>

					<br /><br /><br />

				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>
		<br /><br /><br />
		<!-- 세번째 -->
		<div class="card">
			<div class="card-body overflow-hidden ps ps--active-y">
			<div class="row">
			  <!-- 신청사항 select -->
	          <div class="col-md-2 mb-3">
				  <select id="tdSelect" class="form-select form-select-sm">
				    <option>선택</option>
				    <option value="1">학생명</option>
				    <option value="2">학과명</option>
				  </select>
	          </div>
	          <div class="col-md-2 mb-3">
	          	<input id="ipTdSearch" class="form-control form-control-sm" type="text" placeholder="검색어" />
	          </div>
	          <div class="col-md-2 mb-3">
	          	<button type="button" id="btnTdSearch" class="btn rounded-pill btn-secondary" style="float: left;">검색</button>
	          </div>
	         </div>
				<div class="table-responsive text-nowrap h-px-800" style="overflow:auto;" id="">

					<table id="tdTable" class="table" style="padding:20px; text-align:center;" >
						<caption align="top"><i class='bx bxs-square'></i>전과 신청내역 &#91; ${tdCnt} 건 &#93;</caption>
						<thead class="table-active">
							<tr class="text-nowrap">
								<th>번호</th>
								<th>상태</th>
								<th>학번</th>
								<th>학과</th>
								<th>이름</th>
								<th>신청학과</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="tdTbody">
						  <c:forEach var="trMap" items="${trList}" varStatus="stat">
							<tr id="acaTr">
								<td>${stat.count}</td>
								<td><span class="badge rounded-pill bg-label-info">${trMap.TD_CHECK}</span></td>
								<td>${trMap.STU_NUM}</td>
								<td>${trMap.MAJOR_DEPT_NM}</td>
								<td>${trMap.STU_NM_KOR}</td>
								<td>${trMap.APP_DEPT_NM}</td>
								<td>
									<p style="display: none;">${trMap.TD_NUM}</p>
									<span style="display: none;">${trMap.APP_DEPT_NUM}</span>
									<button type="button" id="btnTdApp" class="btn btn-info btn-sm">승인</button>
									<button type="button" id="btnTdRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>

					<br /><br /><br />

				</div>
			</div>

			<div class="card-footer">
			</div>
		</div>

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">반려 사유 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="emailSlideTop" class="col-form-label col text-center">학번</label>
				   <input type="text" id="ipStuNum" class="form-control col mb-0 form-control-sm" value="201901010" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="dobSlideTop" class="col-form-label col text-center">이름</label>
				   <input type="text" id="ipStuNm" class="form-control col md-3 form-control-sm" value="홍길동" readonly>
			   </div>
		   </div>
		 </div>
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="emailSlideTop" class="col-form-label col text-center">신청사항</label>
				   <input type="text" id="ipCont" class="form-control col mb-0 form-control-sm" value="휴학" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="dobSlideTop" class="col-form-label col text-center">신청사유</label>
				   <input type="text" id="ipReason" class="form-control col md-3 form-control-sm" value="개인사정" readonly>
			   </div>
		   </div>
		 </div>
        <hr/>
        <div class="row">
          <div class="col mb-3">
            <label for="nameWithTitle" class="form-label">반려 사유</label>
            <input type="text" id="rjReason" class="form-control" placeholder="반려사유" required />
          </div>
        </div>
      </div>
      <div class="modal-footer">
<!--       	<p id="hiddenP" style="display:"></p> -->
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="btnMdRj" class="btn btn-dark">반려</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
// 	$("#select2Primary").select2();
// new PerfectScrollbar(document.getElementById('vertical-example'), {
// 	  wheelPropagation: false
// 	});
</script>

<script>
$(document).ready(function(){

	$(".firstTable").DataTable({
		aaSorting : []
	});

	//학적변동 + 졸업유예 신청 처리내용 시작
	//승인버튼 클릭 시
	$(document).on("click", "#btnGpApp", function(){
		let cont = $(this).parent().siblings("td:eq(5)").text();
		let stuNum = $(this).parent().siblings("td:eq(2)").text();
		let num = $(this).parent().find('p').text();

		console.log("cont : " + cont);
		console.log("stuNum : " + stuNum);
		console.log("num : " + num);



		if(cont == '졸업유예'){
// 			alert("졸업유예!");
			let data = {
							"stuNum":stuNum
						  , "gpNum":num

						};

			$.ajax({
				url : "/academic/processGp",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					console.log("result : " + JSON.stringify(result));
					if(result > 0){
// 						alert("졸업유예 승인 완료!");

						Swal.fire({
					    	  html: '승인 완료',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
// 					    	  return false;
					      	});
					}
					else{
// 						alert("졸업유예 승인처리 실패");

						Swal.fire({
					    	  html: '승인 실패',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
// 					    	  return false;
					      	});
					}
				},
				error : function(){
// 					alert("졸업유예 승인처리 실패!");

					Swal.fire({
				    	  html: '승인 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
// 				    	  return false;
				      	});
				}
			});
		}else {
// 			alert("학적변동!");

			let data = {
					"stuNum":stuNum
				  , "acChgNum":num
				  , "cont":cont

				};

			$.ajax({
				url : "/academic/processAcChg",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
// 					alert("다녀옴!");
					console.log("학적변동 result : " + result);
					if(result > 0){	//학적변동 승인처리 성공 시
						Swal.fire({
					    	  html: '승인 완료',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
//					    	  return false;
					      	});
					}else{

						Swal.fire({
					    	  html: '승인 실패',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
	//				    	  return false;
					      	});
					}
				},
				error : function(){
					Swal.fire({
				    	  html: '승인 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
//				    	  return false;
				      	});
				}

				});
		}

	});

	//반려버튼 클릭 시
	$(document).on("click", "#btnGpRj", function(){
		let cont = $(this).parent().siblings("td:eq(5)").text();
		let num = $(this).parent().find('p').text();
// 		console.log("cont : " + cont);
		console.log("num : " + num);


		let data = {	"num":num
					  , "cont":cont
					};

			//반려 모달창에 들어갈 학생정보 요청
			$.ajax({
				url : "/academic/getSingleGp",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
// 					alert("다녀옴!");
					let stuNum = result.STU_NUM;
					let stuNm = result.STU_NM_KOR;
					let cont = result.CONT;
// 					console.log("stuNm : " + stuNm);
// 					let deptNm = result.DEPT_NM;
					let reason = result.REASON;
// 					console.log("reason : " + reason);
					let num = result.NUM;
					console.log("num : " + num);

					$("#ipStuNum").val(stuNum);
					$("#ipStuNm").val(stuNm);
					$("#ipCont").val(cont);
					$("#ipReason").val(reason);

// 					let hdNum = result.NUM;
// 					console.log("hdNum : " + hdNum);

// 					$("#hiddenP").text(hdNum);

				},
				error : function(){

					Swal.fire({
				    	  html: '반려처리 불가합니다. 관리자에게 문의하세요.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

				}
			});




		//반려 모달창 내 반려버튼 클릭 시
		$(document).on("click", "#btnMdRj", function(){
	// 		alert("테스트!");
			let cont = $("#ipCont").val();
			console.log("반려의 cont : " + cont);


			let rjReason = $("#rjReason").val().trim();
			console.log("rjReason : " + rjReason);

			if(rjReason == "" || rjReason == null ){
				Swal.fire({
			    	  html: '반려사유를 입력해주세요',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  return false;
			      	});
			}

			if(cont == '졸업유예'){	//졸업유예 반려처리
				let data = {
								"gpComre":rjReason
							  , "gpNum":num
							};

				$.ajax({
					url : "/academic/rejectGp",
					contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
					data : JSON.stringify(data),		//=> 보내는 데이터(?)
					dataType : "json",										//=> dataType은 '응답타입'
					type : "post",
					beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
// 						alert("반려처리 다녀옴!");
						Swal.fire({
					    	  html: '반려 완료. 신청목록으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
//					    	  return false;
					      	});

					},
					error : function(){
						Swal.fire({
					    	  html: '반려처리 불가합니다. 관리자에게 문의하세요.',
					    	  icon: 'warning',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
					}
				});

			}else{	//학적변동 반려처리

					let data = {
							"acComre":rjReason
						  , "acNum":num
						};

					$.ajax({
						url : "/academic/rejectAcChg",
						contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
						data : JSON.stringify(data),		//=> 보내는 데이터(?)
						dataType : "json",										//=> dataType은 '응답타입'
						type : "post",
						beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(result){
							if(result > 0){

								Swal.fire({
							    	  html: '반려 완료. 신청목록으로 이동합니다.',
							    	  icon: 'success',

							    	  confirmButtonText: '확인'

							      }).then(result => {
							    	  location.href = "/academic/acaListAdm";
							      	});
							}else{
								Swal.fire({
							    	  html: '반려처리 불가합니다. 관리자에게 문의바랍니다.',
							    	  icon: 'warning',

							    	  confirmButtonText: '확인'

							      }).then(result => {
							    	  location.href = "/academic/acaListAdm";
							      	});
							}
						},
						error : function(){
							Swal.fire({
						    	  html: '에러발생. 반려처리 불가합니다. 관리자에게 문의바랍니다.',
						    	  icon: 'warning',

						    	  confirmButtonText: '확인'

						      }).then(result => {
						    	  location.href = "/academic/acaListAdm";
						      	});
					}
				});

			}

		});
	});

	//학적변동 + 졸업유예 신청 처리내용 끝

	//복수전공 + 부전공 신청 처리내용 시작
	//승인버튼 클릭 시
	$(document).on("click", "#btnDmApp", function(){
		//신청번호
		let dmNum = $(this).parent().find('p').text();
		console.log("dmNum : " + dmNum);
		//학번
		let stuNum = $(this).parent().siblings("td:eq(2)").text();
		console.log("stuNum : " + stuNum);
		//신청학과번호
		let appDeptNum = $(this).parent().find('span').text();
		console.log("appDeptNum : " + appDeptNum);

		let data = {
						"dmNum":dmNum
					  , "stuNum":stuNum
					  , "stuDmajor":appDeptNum
					};

		//신청승인 요청
		$.ajax({
			url : "/academic/approveDM",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				alert("다녀옴!");
				if(result > 0){	//승인처리 성공 시

					Swal.fire({
				    	  html: '승인 완료',
				    	  icon: 'success',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});
				}else{

					Swal.fire({
				    	  html: '승인 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

				}

			},
			error : function(){

				Swal.fire({
			    	  html: '승인 실패',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});

			}
		});

	});

	//반려버튼 클릭 시
	$(document).on("click", "#btnDmRj", function(){
		let dmNum = $(this).parent().find('p').text();
		console.log("dmNum : " + dmNum);

		let data = {
						"dmNum":dmNum
					};

		//반려 모달창에 들어갈 학생정보 요청
		$.ajax({
			url : "/academic/getSingleDMHistory",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				alert("getSingleDMHistory 다녀옴!");
				console.log("result : " + JSON.stringify(result));

				let stuNum = result.STU_NUM;
				console.log("stuNum : " + stuNum);
				let stuNm = result.STU_NM_KOR;
				console.log("stuNm : " + stuNm);
				let division = result.DM_DIVISION;
				console.log("division : " + division);
				let reason = result.REASON;
				console.log("reason : " + reason);

				$("#ipStuNum").val(stuNum);
				$("#ipStuNm").val(stuNm);
				$("#ipCont").val(division);
				$("#ipReason").val(reason);

			},
			error : function(){
				Swal.fire({
			    	  html: '반려처리 불가합니다. 관리자에게 문의하세요.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});

			}
		});

		//반려 모달창 내 반려버튼 클릭 시
		$(document).on("click", "#btnMdRj", function(){
			let rjReason = $("#rjReason").val().trim();
			console.log("rjReason : " + rjReason);

			let data = {
							"dmNum":dmNum
						  , "rjReason":rjReason
						};

			$.ajax({
				url : "/academic/rejectDM",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
					if(result > 0){
						Swal.fire({
					    	  html: '반려 완료. 신청목록으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
						return false;
					}

					Swal.fire({
				    	  html: '반려처리 실패',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;

				},
				error : function(){
					Swal.fire({
				    	  html: '반려처리 불가합니다. 관리자에게 문의바랍니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;
				}
			});
		});
	});
	//복수전공 + 부전공 신청 처리내용 끝

	//전과 신청 처리내용 시작
	//승인버튼 클릭 시
	$(document).on("click", "#btnTdApp", function(){
		//tdNum, deptNum, stuNum
		//신청번호
		let tdNum = $(this).parent().find('p').text();
		console.log("tdNum : " + tdNum);

		//신청 학과번호
		let appDeptNum = $(this).parent().find('span').text();
		console.log("appDeptNum : " + appDeptNum);

		//학번
		let stuNum = $(this).parent().siblings("td:eq(2)").text();
		console.log("stuNum : " + stuNum);

		let data = {
						"tdNum":tdNum
					  , "appDeptNum":appDeptNum
					  , "stuNum":stuNum
					};

		$.ajax({
			url : "/academic/approveTD",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				console.log("result : " + result);
				if(result > 0){


					Swal.fire({
				    	  html: '승인 완료',
				    	  icon: 'success',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});
					return false;
				}

				Swal.fire({
			    	  html: '승인 실패',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});
				return false;

			},
			error : function(){
				Swal.fire({
			    	  html: '승인 실패. 관리자에게 문의바랍니다.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
			    	  location.href = "/academic/acaListAdm";
			      	});
				return false;
			}
		});
	});

	//반려버튼 클릭 시
	$(document).on("click", "#btnTdRj", function(){
// 		alert("반려버튼 클릭 확인");
		let tdNum = $(this).parent().find('p').text();
// 		console.log("tdNum : " + tdNum);

		let data = {
						"tdNum":tdNum
					};

		//반려 모달창에 들어갈 학생정보 요청
		$.ajax({
			url : "/academic/getSingleTDHistory",
			contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
			data : JSON.stringify(data),		//=> 보내는 데이터(?)
			dataType : "json",										//=> dataType은 '응답타입'
			type : "post",
			beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result){
// 				alert("다녀옴!");
// 				console.log("result : " + JSON.stringify(result));

				let stuNum = result.STU_NUM;
				let stuNm = result.STU_NM_KOR;
				let cont = result.CONT;
				let reason = result.REASON;

				$("#ipStuNum").val(stuNum);
				$("#ipStuNm").val(stuNm);
				$("#ipCont").val(cont);
				$("#ipReason").val(reason);
			},
			error : function(){

			}
		});


		$(document).on("click", "#btnMdRj", function(){
			let rjReason = $("#rjReason").val().trim();
			console.log("rjReason : " + rjReason);

			let data = {
							"tdNum":tdNum
						  , "tdComre":rjReason
						};

			$.ajax({
				url : "/academic/rejectTD",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
// 					alert("다녀옴!");
// 					console.log("result : " + result);
					if(result > 0){	//반려처리 성공 시
						Swal.fire({
					    	  html: '반려 완료. 신청목록으로 이동합니다.',
					    	  icon: 'success',

					    	  confirmButtonText: '확인'

					      }).then(result => {
					    	  location.href = "/academic/acaListAdm";
					      	});
						return false;
					}

					Swal.fire({
				    	  html: '반려처리 실패. 신청목록으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;

				},
				error : function(){

					Swal.fire({
				    	  html: '반려처리 실패. 신청목록으로 이동합니다.',
				    	  icon: 'warning',

				    	  confirmButtonText: '확인'

				      }).then(result => {
				    	  location.href = "/academic/acaListAdm";
				      	});

						return false;
				}
			});
		});


	});

	//전과 신청 처리내용 끝



	//검색포함 학적변동 + 졸업유예 신청목록 조회 시작
	$(document).on("click", "#btnSearch", function(){

		let searchVal = $("#searchSelect").val();	//	searchVal: 1인 경우에는 학생명, 2인 경우에는 학과명
		console.log("searchVal : " + searchVal);


		let ipKeyword = $("#ipKeyword").val();
		console.log("ipKeyword : " + ipKeyword);


		if(ipKeyword == null || ipKeyword == ''){

			Swal.fire({
		    	  html: '검색어를 입력해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(searchVal == 1){	//searchVal: 1인 경우(학생명으로 검색한 경우)
// 			alert("searchVal의 값 : 1");
			let data = { "keyStuNmKor":ipKeyword };

			$.ajax({
				url : "/academic/getAcGpListIncSearchStuNum",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result){
	// 				alert("다녀옴~!");

					if(result.cnt == 0){	//검색결과가 존재하지 않는 경우
						alert("검색결과가 존재하지 않습니다.");
						location.href = "/academic/acaListAdm";
						return false;
					}

					let str = "";

					$.each(result.gpListIncSearch, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += "<td>"+idx2+"</td>";
						str += '<td><span class="badge rounded-pill bg-label-info">'+item.CHG_CHECK+'</span></td>';
						str += "<td>"+item.STU_NUM+"</td>";
						str += "<td>"+item.DEPT_NM+"</td>";
						str += "<td>"+item.STU_NM_KOR+"</td>";
						str += "<td>"+item.CONT+"</td>";
						str += "<td>"+item.REASON+"</td>";
						str += '<td style="font-size: font-size: 1rem;">';
						str +=	'<p style="display: none;">'+item.NUM+'</p>';
						str +=	'<button type="button" id="btnGpApp" class="btn btn-info btn-sm">승인</button>'
						str +=	'<button type="button" id="btnGpRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>'
						str += '</td>';
						str += '</tr>';


	// 					$("#acTbody").empty();

					});
						$("#acTbody").html(str);

					let cnt = result.cnt;
					console.log("cnt : " + cnt);


					let captionSon = $("#acaTable").find("caption").text();
					console.log("captionSon : " + captionSon);

					let captionStr = "<i class='bx bxs-square'></i>학적변동 신청내역 &#91; "+ cnt +"건 &#93;"
					$("#acaTable").find("caption").html(captionStr);
				},
				error : function(){

				}
			});

		}else if(searchVal == 2){	//searchVal: 2인 경우(학과명으로 검색한 경우)
// 			alert("학과명으로 검색!");
			let data = { "keyDeptNm":ipKeyword };

			$.ajax({
				url : "/academic/getAcGpListIncSearchDept",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
// 					alert("다녀옴!");

					let str = "";

					$.each(result.AcGppListIncSearchDept, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += "<td>"+idx2+"</td>";
						str += '<td><span class="badge rounded-pill bg-label-info">'+item.CHG_CHECK+'</span></td>';
						str += "<td>"+item.STU_NUM+"</td>";
						str += "<td>"+item.DEPT_NM+"</td>";
						str += "<td>"+item.STU_NM_KOR+"</td>";
						str += "<td>"+item.CONT+"</td>";
						str += "<td>"+item.REASON+"</td>";
						str += '<td>';
						str +=	'<p style="display: none;">'+item.NUM+'</p>';
						str +=	'<button type="button" id="btnGpApp" class="btn btn-info btn-sm">승인</button>'
						str +=	'<button type="button" id="btnGpRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>'
						str += '</td>';
						str += '</tr>';
					});
						$("#acTbody").html(str);

					let cnt = result.cnt;
					console.log("cnt : " + cnt);

					let captionSon = $("#acaTable").find("caption").text();
					console.log("captionSon : " + captionSon);

					let captionStr = "<i class='bx bxs-square'></i>학적변동 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#acaTable").find("caption").html(captionStr);




				},
				error : function(){

				}
			});
		}
	});
	//검색포함 학적변동 + 졸업유예 신청목록 조회 끝

	//검색포함 부전공/복수전공 신청목록 조회 시작
	$(document).on("click", "#btnDmSearch", function(){
// 		alert("클릭!");
		let ipDmSearch = $("#ipDmSearch").val();
		console.log("ipDmSearch : " + ipDmSearch);

		let dmSelectVal = $("#dmSelect").val();
		console.log("dmSelectVal : " + dmSelectVal);

		if(ipDmSearch == null || ipDmSearch == ''){

			Swal.fire({
		    	  html: '검색어를 입력해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(dmSelectVal == 1) {	//학생명으로 검색한 경우
			let data = { "keyStuNmKor":ipDmSearch };

			$.ajax({
				url : "/academic/getDMListIncSearch",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
// 					alert("다녀옴~");
					let str = "";

					$.each(result.dmListIncSearch, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						str += '<td><span class="badge rounded-pill bg-label-info">' + item.DM_CHECK + '</span></td>';
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td id="tdCont">' + item.DM_DIVISION + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.DM_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						str += '<button type="button" id="btnDmApp" class="btn btn-info btn-sm">승인</button>';
						str += '<button type="button" id="btnDmRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						str += '</td>';
						str += '</tr>';
					});
						$("#dmTbody").html(str);

					let cnt = result.cnt;
					console.log("cnt : " + cnt);

					let captionSon = $("#dmTable").find("caption").text();
					console.log("captionSon : " + captionSon);

					let captionStr = "<i class='bx bxs-square'></i>복수전공/부전공 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#dmTable").find("caption").html(captionStr);

				},
				error : function(){

				}
			});

		}else if(dmSelectVal == 2){	//학과명으로 검색한 경우
			let data = { "deptNm":ipDmSearch };

			$.ajax({
				url : "/academic/getDMListIncSearchDept",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					console.log("result.dmListIncSearchDept : " + JSON.stringify(result.dmListIncSearchDept));

					let str = "";
					$.each(result.dmListIncSearchDept, function(index, item) {
						let idx2 = index + 1;

						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						str += '<td><span class="badge rounded-pill bg-label-info">' + item.DM_CHECK + '</span></td>';
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td id="tdCont">' + item.DM_DIVISION + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.DM_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						str += '<button type="button" id="btnDmApp" class="btn btn-info btn-sm">승인</button>';
						str += '<button type="button" id="btnDmRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						str += '</td>';
						str += '</tr>';
					});
						$("#dmTbody").html(str);

					let cnt = result.cnt;
					console.log("cnt : " + cnt);

					let captionSon = $("#dmTable").find("caption").text();
					console.log("captionSon : " + captionSon);

					let captionStr = "<i class='bx bxs-square'></i>복수전공/부전공 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#dmTable").find("caption").html(captionStr);

				},
				error : function(){

				}
			});

		}

	});
	//검색포함 부전공/복수전공 신청목록 조회 끝


	//검색포함 전과 신청목록 조회 시작
	$(document).on("click", "#btnTdSearch", function(){
// 		alert("클릭확인");

		let ipTdSearch = $("#ipTdSearch").val();
		console.log("ipTdSearch : " + ipTdSearch);

		let tdSelectVal = $("#tdSelect").val();
		console.log("tdSelectVal : " + tdSelectVal);

		if(ipTdSearch == null || ipTdSearch == ''){

			Swal.fire({
		    	  html: '검색어를 입력해주세요.',
		    	  icon: 'warning',

		    	  confirmButtonText: '확인'

		      });
		      return false;
		}

		if(tdSelectVal == 1){	//학생명으로 검색 시
// 			alert("학생명!");
			let data = { "keyStuNmKor":ipTdSearch };

			$.ajax({
				url : "/academic/getTDListIncSearch",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
// 					alert("다녀옴!");
					let str = "";
					$.each(result.tdListIncSearch, function(index, item) {
						let idx2 = index + 1;
						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						str += '<td><span class="badge rounded-pill bg-label-info">' + item.TD_CHECK + '</span></td>';
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.TD_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						str += '<button type="button" id="btnTdApp" class="btn btn-info btn-sm">승인</button>';
						str += '<button type="button" id="btnTdRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						str += '</td>';
						str += '</tr>';
					});
						$("#tdTbody").html(str);

					let cnt = result.cnt;
					console.log("cnt : " + cnt);

					let captionSon = $("#tdTable").find("caption").text();
					console.log("captionSon : " + captionSon);

					let captionStr = "<i class='bx bxs-square'></i>전과 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#tdTable").find("caption").html(captionStr);
				},
				error : function(){

				}
			});

		}else if(tdSelectVal == 2) {	//학과명으로 검색 시
			let data = { "deptNm":ipTdSearch };

			$.ajax({
				url : "/academic/getTDListIncSearchDept",
				contentType : "application/json;charset=utf-8",			//=> contentType은 '보내는 타입'
				data : JSON.stringify(data),		//=> 보내는 데이터(?)
				dataType : "json",										//=> dataType은 '응답타입'
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
// 					alert("다녀옴ㅁ!");
					let str = "";
					$.each(result.tdListIncSearchDept, function(index, item) {
						let idx2 = index + 1;
						str += '<tr>';
						str += '<td>' + idx2 + '</td>';
						str += '<td><span class="badge rounded-pill bg-label-info">' + item.TD_CHECK + '</span></td>';
						str += '<td>' + item.STU_NUM + '</td>';
						str += '<td>' + item.MAJOR_DEPT_NM + '</td>';
						str += '<td>' + item.STU_NM_KOR + '</td>';
						str += '<td>' + item.APP_DEPT_NM + '</td>';
						str += '<td>';
						str += '<p style="display: none;">' + item.TD_NUM + '</p>';
						str += '<span style="display: none;">' + item.APP_DEPT_NUM + '</span>';
						str += '<button type="button" id="btnTdApp" class="btn btn-info btn-sm">승인</button>';
						str += '<button type="button" id="btnTdRj" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCenter">반려</button>';
						str += '</td>';
						str += '</tr>';
					});
						$("#tdTbody").html(str);

					let cnt = result.cnt;
					console.log("cnt : " + cnt);

					let captionSon = $("#tdTable").find("caption").text();
					console.log("captionSon : " + captionSon);

					let captionStr = "<i class='bx bxs-square'></i>전과 신청내역 &#91; " + cnt + " 건 &#93;"
					$("#tdTable").find("caption").html(captionStr);

				},
				error : function(){

				}
			});
		}


	});



});
</script>