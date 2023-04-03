<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>
<style>
select {
	border: 1px lightgray dashed;
	appearance: none;
	text-align: center;
}
.form-select-sm{
	padding-left: 0.3rem;
	padding-right: 0.3rem;
}
table{
float:left;
}
</style>
<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link active" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
				<a class="nav-item nav-link" href="javascript:void(0)">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a>
			&nbsp;/&nbsp;<a href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
		</h5>

	</div>

	<div class="card-body ">
		<input type="hidden" id="sbjNum" value="${sbjNum}" />
		<!-- Complex Headers -->
		<div class="card">
			<!-- Vertical & Horizontal Scrollbars -->
<!-- 		    <h5 class="card-header col-3"> -->
<!-- 		        <div class="input-group"> -->
<!-- 		          <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">선택</button> -->
<!-- 		          <ul class="dropdown-menu"> -->
<!-- 		            <li><a class="dropdown-item" href="javascript:void(0);">학번</a></li> -->
<!-- 		            <li><a class="dropdown-item" href="javascript:void(0);">학생명</a></li> -->
<!-- 		          </ul> -->
<!-- 		          <input type="text" class="form-control" aria-label="Text input with dropdown button"> -->
<!-- 		        </div> -->
<!-- 		    </h5> -->

			<div class="col-12">
			  <div class="card overflow-hidden" style="height: 700px;">
			    <div class="card-body" id="both-scrollbars-example">

				  <div class="card-datatable text-nowrap" id="stuList" style="height:600px;">
				  	<div class="row" style="float:left; width: 1330px;">
				  	<div class="divTb" style="width:630px; float: left;">
				    <table class="dt-complex-header table table-bordered cell-fit" style="height: 100%;">
				      <thead class="table-light" style="height: 43px; vertical-align: center;">
				        <tr>
				          <th rowspan="2">번호</th>
				          <th rowspan="2">이름</th>
				          <th rowspan="2">학번</th>
				          <th rowspan="2">학과</th>
				          <th rowspan="2">출석</th>
				          <th rowspan="2">지각</th>
				          <th rowspan="2">결석</th>
				        </tr>
				      </thead>
				      <tbody id="tbody">
				      	<c:forEach var="atVO" items="${atList}" varStatus="stat">
					      <tr class="atList1">
						      <td>${stat.count}</td>
					          <td>${atVO.stuNmKor}</td>
					          <td>${atVO.stuNum}</td>
					          <td>${atVO.deptNm}</td>
					          <td>${atVO.attend}</td>
					          <td>${atVO.late}</td>
					          <td>${atVO.absent}</td>
				          </tr>
					    </c:forEach>
				      </tbody>
				    </table>
				    </div>
				    <div class="tbDiv" style="width:695px;  overflow:hidden; float: left; margin-left: -10px;" id="horizontal-example">
				    	<!-- 출석테이블 -->
					    <table class="dt-complex-header table table-bordered cell-fit" style="height: 100%;">
					      <thead class="table-light" style="height:15px; line-height: 3%;">

					        <tr class="week">
					         <c:forEach begin="1" end="15" varStatus="stat">
					          <th colspan="${count}">${stat.count}주차</th>  <!-- colspan="2" -->
					         </c:forEach>
					        </tr>
					        <!-- COL COUNT 시작 -->
					        <tr>
					        <c:forEach begin="1" end="15" varStatus="stat">
								<c:forEach var="dayMap" items="${dayList}" varStatus="stat">
				          		  <th style="font-size: 0.7em; height: 10px;">${dayMap.get("TIME_TCODE")}</th>
				          		</c:forEach>
					        </c:forEach>
					        </tr>
					        <!-- COL COUNT 끝 -->
					      </thead>
					      <!-- 출석 SELECT BOX 시작 -->
					      <tbody>
					      	<c:forEach var="atList" items="${atList}" varStatus="stat">
					      	  <!-- tr 시작 -->
						      <tr class="test1">
						      <!-- td 시작 -->

<%-- 						       <c:forEach begin="1" end="15" varStatus="stat"> --%>

<%-- 						         <c:forEach begin="1" end="${count}" varStatus="stat"> --%>


<%-- 						         	<c:forEach var="atList" items="${atList}" varStatus="stat"> --%>
						         		<c:forEach begin="1" end="${count}" varStatus="stat">


										<c:forEach var="atListVO" items="${atList.atList}" varStatus="stat">
										  <c:choose>
											<c:when test="${atListVO.atCheck==1}">
<%-- 												<td>${stat.count}</td> --%>
<%-- 												<td>atList.atList(atListVO) : ${atList.atList}</td><br /> --%>
<%-- 												<td>atListVO.atCheck : ${atListVO.atCheck}</td><br /> --%>

<%-- 										</c:forEach> --%>
<!-- 										<br /> -->




									           <td class="week11 1">
												<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
<!-- 													<option></option> -->
													<option value="" disabled hidden></option>
													<option selected>○</option>
									            	<option>△</option>
									            	<option>X</option>
												</select>
											   </td>

											</c:when>

										    <c:when test="${atListVO.atCheck==0.67}">
										  	  <td class="week11 2">
											    <select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
<!-- 												  <option></option> -->
												  <option value="" disabled hidden></option>
												  <option>○</option>
								            	  <option selected>△</option>
								            	  <option>X</option>
											  </select>
									   		 </td>
										   </c:when>
										   <c:when test="${atListVO.atCheck==0}">
											 <td class="week11 3">
											   <select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
<!-- 												  <option></option> -->
												  <option value="" disabled hidden></option>
												  <option>○</option>
								            	  <option>△</option>
								            	  <option selected>X</option>
											  </select>
										    </td>
										   </c:when>
										   <c:when test="${atListVO.atCheck==2}">
											<td class="week11 4">
											<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
<!-- 												<option></option> -->
												<option value="" selected disabled hidden></option>
												<option>○</option>
								            	<option>△</option>
								            	<option>X</option>
											</select>
										   </td>
										   </c:when>
										   <c:otherwise>
										     <td class="week11 5">
											   <select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
<!-- 												  <option></option> -->
												  <option value="" selected disabled hidden></option>
												  <option>○</option>
								            	  <option>△</option>
								            	  <option>X</option>
											  </select>
										    </td>
										  </c:otherwise>
										</c:choose>

									</c:forEach>

									<c:forEach begin="${atList.atList.size()}" end="14">
										<td class="week11 6">
										<select id="att1" class="form-select-sm search-sel" aria-label="Default select example">
											<option></option>
											<option>○</option>
							            	<option>△</option>
							            	<option>X</option>
										</select>
									   </td>
									</c:forEach>

								</c:forEach>

<%-- 						        </c:forEach> --%>
						        <!-- td 끝 -->
					          </tr>
					          <!-- tr 끝 -->
					        </c:forEach>
					      </tbody>
					      <!-- 출석 SELECT BOX 끝 -->
					    </table>
					    <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div>
				    </div>
				    </div>

				  </div>
			    </div>
			  </div>
			</div>
  			<!--/ Vertical & Horizontal Scrollbars -->
		</div>
		<!--/ Complex Headers -->


	</div>
</div>

<script>
$(document).ready(function() {
	let cnt = ${count};
	console.log("cnt : " + cnt);

	$(".search-sel").on("click", function(){

		let dx = $(this).parent().index();
		//console.log(dx);

		let sv = $(this).parent().prev().find("select").val();
		//console.log("sv : " + sv);
		let ev = $(this).find("option").eq(1).val();
		//console.log(ev);
		if(dx != 0 && (sv == "" || sv == null)){
			alert("순서대로 채워주세요.")
		}
	});

	$(".search-sel").on("change", function(){
		let select = $(this).parent().find(".search-sel option").index( $(this).parent().find(".search-sel option:selected") );
		console.log("select된 값의 index : " + select);
		let atCheck = "";

		if(select == 1){
			atCheck = 1;
		}else if(select == 2){
			atCheck = 0.67;
		}else if(select == 3){
			atCheck = 0;
		}else{
			alert("○ / △ / X만 선택 가능합니다.");
		}
		console.log("atCheck : " + atCheck);

		let idx = $(this).parent().index(); //td의 인덱스
		console.log("idx : " + idx);

		if(cnt == 1) {	//강의요일(cnt)이 한 개인 경우

			let week = $(this).parents(".tbDiv").find("th").eq(idx).text();
			let word = week.split("주");
			console.log(word);

			let atWeek = word[0];

			console.log("atWeek : " + atWeek);

			let trIdx = $(this).closest("tr").index();
			let stuNum = $(".divTb").find(".atList1").eq(trIdx).find("td").eq(2).text();

			let trTxt = $(this).parents(".tbDiv").find("tr").next("tr").find("th").eq(idx).text();
			console.log("trTxt : " + trTxt);

			//console.log("select : " + select);
			//console.log("thIdx : " + week);	//클릭한 td의 인덱스와 일치하는 요소의 값 가져오기
			//console.log("stuNum : " + stuNum);	//클릭한 td의 학생학번(stuNum)

			//console.log("atWeek : " + atWeek);

			let sbjNum = $("#sbjNum").val();
			//console.log("sbjNum : " + sbjNum);

			let data = {
							"sbjNum":sbjNum,
							"timeTcode":trTxt,
							"atStuNum":stuNum,
							"atWeek":atWeek,
							"atCheck":atCheck
						};

			$.ajax({
				url : "/course/updateAttendance",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(data){
					console.log("result : " + JSON.stringify(data));

					$("#tbody").empty();

					$.each(data, function(index, item) { // 데이터 =item
						let idx2 = index + 1;
						console.log("idx2 : " + idx2);

						let html = "";
						html += "<tr class='atList1'>";
						html += "<td>"+idx2+"</td>";
						html += "<td>"+item.stuNmKor+"</td>";
						html += "<td>"+item.stuNum+"</td>";
						html += "<td>"+item.deptNm+"</td>";
						html += "<td>"+item.attend+"</td>";
						html += "<td>"+item.late+"</td>";
						html += "<td>"+item.absent+"</td>";
						html += "</tr>";

						$("#tbody").append(html);

					});
				},
				error : function(){
					alert("오류발생. 등록이 불가합니다.");
				}
			});

		}else {	//강의요일(cnt)이 두 개인 경우

			let atWeek = Math.floor((parseInt(idx) / 2)) + 1;
			console.log("atWeek : " + atWeek);

// 			let week = $(this).parents(".tbDiv").find("th").eq(idx).text();

// 			let word = week.split("주");
// 			console.log(word);

// 			let atWeek = word[0];

// 			console.log("atWeek : " + atWeek);

			let trIdx = $(this).closest("tr").index();
			let stuNum = $(".divTb").find(".atList1").eq(trIdx).find("td").eq(2).text();

			let trTxt = $(this).parents(".tbDiv").find("tr").next("tr").find("th").eq(idx).text();
			console.log("trTxt : " + trTxt);

			//console.log("select : " + select);
			//console.log("thIdx : " + week);	//클릭한 td의 인덱스와 일치하는 요소의 값 가져오기
			//console.log("stuNum : " + stuNum);	//클릭한 td의 학생학번(stuNum)

			//console.log("atWeek : " + atWeek);

			let sbjNum = $("#sbjNum").val();
			//console.log("sbjNum : " + sbjNum);

			let data = {
							"sbjNum":sbjNum,
							"timeTcode":trTxt,
							"atStuNum":stuNum,
							"atWeek":atWeek,
							"atCheck":atCheck
						};

			$.ajax({
				url : "/course/updateAttendance",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : "json",
				type : "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정				//=> security가 돌고 있기에 꼭 써줘야 함
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(data){
					console.log("result : " + JSON.stringify(data));

					$("#tbody").empty();

					$.each(data, function(index, item) { // 데이터 =item
						let idx2 = index + 1;
						console.log("idx2 : " + idx2);

						let html = "";
						html += "<tr class='atList1'>";
						html += "<td>"+idx2+"</td>";
						html += "<td>"+item.stuNmKor+"</td>";
						html += "<td>"+item.stuNum+"</td>";
						html += "<td>"+item.deptNm+"</td>";
						html += "<td>"+item.attend+"</td>";
						html += "<td>"+item.late+"</td>";
						html += "<td>"+item.absent+"</td>";
						html += "</tr>";

						$("#tbody").append(html);

					});
				},
				error : function(){
					alert("오류발생. 등록이 불가합니다.");
				}
			});

		}
	});
});
</script>
<script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
