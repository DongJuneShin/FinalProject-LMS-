<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Vendors CSS -->
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/typeahead-js/typeahead.css" />
<link rel="stylesheet" href="/resources/sneat/assets/vendor/libs/dropzone/dropzone.css" />

<script src="/resources/sneat/assets/vendor/libs/jquery/jquery.js"></script>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">주차</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link" href="/course/attendStu?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link active" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
			</div>
		</div>
	</div>
</nav>
<br />
<div class="card">
<div class="card-header">
	<h5 class="title">
	<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	if(userVO.getAuth().equals("ROLE_STU")){
	%>
	<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
	<%
	}else{
	%>
	<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
	<%
	}
	%>
	</h5>
</div>

<div class="card-body">
	<div class="row">
	<!-- Vertical Scrollbar -->
		<div class="col-md-12 col-sm-12">
	    	<div class="card overflow-hidden mb-4" style="height: 500px;">
				<h5 class="card-header">${data.asTitle}</h5>
				<div class="card-body" id="vertical-example">
			        <p>
			          ${data.asContent}
			        </p>
			        
      			</div>
			</div>
		</div>
		<!--/ Vertical Scrollbar -->
		
		<%
		if(userVO.getAuth().equals("ROLE_TEA")) {
		%>
		<div>
<%-- 		<a href="/course/deleteAssignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${data.asNum}"><button type="button" class="btn btn-secondary">삭제</button></a> --%>
		<button type="button" id="btnDelete" class="btn btn-secondary">삭제</button>
		<a href="/course/assignmentModify?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${data.asNum}"><button type="button" class="btn btn-primary">수정</button></a>
		<a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-info">리스트</button></a>
		</div>
		<%
		}
		%>		
	</div>
	<%
	if(userVO.getAuth().equals("ROLE_STU")) {
	%>
	<hr style="border-top: 1px dashed #bbb;"/>
	<div class="row">
	  <div class="col-xl">
	    <div class="card mb-4">
	      <div class="card-header d-flex justify-content-between align-items-center">
	        <h5 class="mb-0">과제 제출</h5> 
<!-- 	        <small class="text-muted float-end">Default label</small> -->
	      </div>
	      <div class="card-body">
	        <form action="/course/submitAssignment" method="post" enctype="multipart/form-data">
<%-- 	        <c:if test="${submitData == null or submitData == '' }"> --%>
<!-- 	        	<input type="hidden" name="sbmAnum" value=""> -->
<%-- 	        </c:if> --%>
	        <c:if test="${submitData != null}">
	        	<input type="hidden" name="sbmNum" value="${submitData.sbmNum}">
	        	<input type="hidden" name="sbmAnum" value="${submitData.sbmAnum}">
	        </c:if>
	        <c:if test="${submitData == null }">
	        	<input type="hidden" name="sbmNum" value="${sbmNum}">
	        	<input type="hidden" name="sbmAnum" value="${data.asNum}">
	        </c:if>
	        <input type="hidden" name="sbjTitle" value="${sbjTitle}">
			<input type="hidden" name="sbjNum" value="${sbjNum}">
			<input type="hidden" name="stuNum" value="<%=userVO.getUsername()%>">
			
	          <div class="mb-3">
	            <label class="form-label" for="basic-default-message">내용</label>
	            <textarea id="basic-default-message" name="sbmContent" class="form-control" placeholder="과제 내용을 입력하세요" style="height: 6.25em; resize: none;">${submitData.sbmContent}</textarea>
	          </div>
	          
				<div class="mb-3">
				  <label for="formFileMultiple" class="form-label">파일 업로드</label>
				  <c:if test="${submitData != null}">
<%-- 				  	<input type="text" name="fileName" value="${submitData.sbmFilename}" style="width: 300px;"> --%>
				  	<input class="form-control" type="file" id="formFileMultiple" name="uploadFile" required /> <br />
<%-- 				  	업로드된 파일 : <input type="text" value="${submitData.sbmFilename}" /> --%>
				  	업로드한 파일 : ${fn}
				  </c:if>
				  <c:if test="${submitData == null}">
<!-- 				  	<input type="text" name="fileName"> -->
				  	<input class="form-control" type="file" id="formFileMultiple" name="uploadFile" required />
				  </c:if>
				  
				</div>

	          <button type="submit" class="btn btn-primary">저장</button>
	          <a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-info">리스트</button></a>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<%
	}
	%>
	
</div>
<!-- card-body end -->

<script src="/resources/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/sneat/assets/js/extended-ui-perfect-scrollbar.js"></script>
<!-- Vendors JS -->
<script src="/resources/sneat/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/resources/sneat/assets/js/forms-file-upload.js"></script>
<!-- Page JS -->

<script>
$("#btnDelete").on("click",function(){
	Swal.fire({
// 		   title: '삭제하시겠습니까?',
		   text: '삭제하시겠습니까?',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result => {
			
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		   
		      Swal.fire({
		    	  text: '삭제되었습니다.',
		    	  icon: 'success',
		    	  
		    	  confirmButtonText: '확인'
		    	  
		      }).then(result => {
		    	  location.href = "/course/deleteAssignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${data.asNum}";
		      	});
			}
		});
});
</script>