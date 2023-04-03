<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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
	margin-top: 0px;
	padding-top: 0px;
}
</style>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link active" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
				<a class="nav-item nav-link" href="/course/reportCard?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

<h5 class="title">
	<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
</h5>

<div class="card">
<!-- 	<div class="card-header"> -->
<!-- 		<select class="form-select search-sel" aria-label="Default select example"> -->
<!-- 			<option value="학번" selected>학번</option> -->
<!-- 			<option value="학생명">학생명</option> -->
<!-- 		</select> -->

<!-- 		<input type="text" class="form-control search-inp" placeholder="Search..." aria-label="Search..." aria-describedby="basic-addon-search31"> -->
<!-- 		<button class="input-group-text search-btn"><i class="bx bx-search"></i></button> -->
<!-- 	</div> -->
	<div class="card-body">
	<table class="table table-hover">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>번호</th>
				<th>학번</th>
				<th>학과</th>
				<th>학생명</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="map" items="${data}" varStatus="stat">
			<tr>
				<th scope="row">${stat.count}</th>
				<td><a href="#" id="stuNum" data-bs-toggle="modal" data-bs-target="#modalCenter">${map.get("STU_NUM") }</a></td>
				<td>${map.get("DEPT_NM") }</td>
				<td>${map.get("STU_NM_KOR") }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">학생 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuNum" class="col-form-label col text-center">학번</label>
				   <input type="text" id="ip_stuNum" class="form-control col mb-0 form-control-sm" value="" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuDept" class="col-form-label col text-center">학과</label>
				   <input type="text" id="ip_stuDept" class="form-control col md-3 form-control-sm" value="" readonly>
			   </div>
		   </div>
		 </div>
		 <br />
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuGrade" class="col-form-label col text-center">학년</label>
				   <input type="text" id="ip_stuGrade" class="form-control col mb-0 form-control-sm" value="" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_stuName" class="col-form-label col text-center">이름</label>
				   <input type="text" id="ip_stuName" class="form-control col md-3 form-control-sm" value="" readonly>
			   </div>
		   </div>
		 </div>
		 <br />
		<div class="row g-2 w-px-500">
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_email" class="col-form-label col text-center">이메일</label>
				   <input type="text" id="ip_email" class="form-control col mb-0 form-control-sm" value="" readonly>
			   </div>
		   </div>
		   <div class="col mb-0">
			   <div class="row g-1">
				   <label for="ip_contact" class="col-form-label col text-center">연락처</label>
				   <input type="text" id="ip_contact" class="form-control col md-3 form-control-sm" value="" readonly>
			   </div>
		   </div>
		 </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<script>
$(function(){


	$(".table-hover").DataTable();
});

// 	$("#stuNum").on("click", function(e){
	$(document).on("click","#stuNum",function(){

// 		console.log("두유");


		let sbjNum = '${sbjNum}';
// 		console.log("sbjNum : " + sbjNum);
		let stuNum = $(this).parent("td").text();
// 		console.log("stuNum : " + stuNum);
		data = {
				"sbjNum" : sbjNum,
				"stuNum" : stuNum
				};

		$.ajax({



			url : "/course/getStuInfo",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			beforeSend : function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data){

				let IstuNum = data.STU_NUM;
				let Idept = data.DEPT_NM;
				let Isemester = data.STU_SEMESTER;

				if(Isemester== 1 || Isemester <= 2){
					Isemester = "1학년"
				}else if(Isemester== 3 || Isemester == 4){
					Isemester = "2학년"
				}else if(Isemester== 5 || Isemester == 6){
					Isemester = "3학년"
				}else if(Isemester== 7 || Isemester == 8){
					Isemester = "4학년"
				}

// 				console.log("(After)Isemester : " + Isemester)



				let IstuNm = data.STU_NM_KOR;
				let IstuEmail = data.STU_EMAIL;
				let IstuPn = data.STU_PN;

// 				console.log("IstuNum : " + IstuNum);
// 				console.log("result : " + JSON.stringify(data));
// 				$("#stuNum").attr("value", IstuNum);
// 				$("#stuNum").val(IstuNum);
// 				$('input[name=stuNum]').value = IstuNum;
				document.querySelector('#ip_stuNum').value = IstuNum;
				document.querySelector('#ip_stuDept').value = Idept;
				document.querySelector('#ip_stuGrade').value = Isemester;
				document.querySelector('#ip_stuName').value = IstuNm;
				document.querySelector('#ip_email').value = IstuEmail;
				document.querySelector('#ip_contact').value = IstuPn;





			},
			error : function(){

// 				alert("학생 정보가 존재하지 않습니다.");

				Swal.fire({
			    	  html: '학생정보가 존재하지 않습니다.',
			    	  icon: 'warning',

			    	  confirmButtonText: '확인'

			      }).then(result => {
// 			    	  location.href = "/course/studentList";
			    	  return false;
			      	});




			}

		});
	});

</script>