<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">
.categoryBar{
	color: gray;
}
.si_target{
	width: 60%;
	text-align: center;
}
thead{
	text-align: center;
}
.btnWrite{
	width: auto;
}
.div-header{
	margin: 5px;
}
.card-btn{
	display: inline;
	float: right;
}
</style>

<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
				<a class="nav-item nav-link" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link" href="/course/attendTea?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">출석</a>
				<a class="nav-item nav-link active" href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
				<a class="nav-item nav-link" href="javascript:void(0)">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

<h5 class="title">
	<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
</h5>

<%
	//UserVO userVO = (UserVO) session.getAttribute("userVO");
	//int teaNum = userVO.getUsername();
	//pageContext.setAttribute("teaNum", teaNum);
%>
<%-- <c:out value="${teaNum}" /> --%>

<form action="/course/createAssignment?${_csrf.parameterName}=${_csrf.token}" method="post">
<input type="hidden" name="sbjTitle" value="${sbjTitle}">
<input type="hidden" name="sbjNum" value="${sbjNum}">
<%-- <input type="hidden" name="spNum" value="${siList.spNum}"> --%>
<%-- <input type="hidden" name="teaNum" value="${teaNum}"> --%>

<div class="card">
	<div class="card-header">
		<div class="mb-3 col-1">
          <label for="siNum" class="form-label">주차</label>
          <select class="form-select col-1" id="siNum" name="siNum" aria-label="Default select example" required>
            <option id="op" value="">주차선택</option>
<!--             <option>주차선택</option> -->
            <c:forEach var="siListVO" items="${siList}" varStatus="stat">
            <option value="${siListVO.siNum}">${siListVO.siNum}</option>
            </c:forEach>
          </select>
            <input type="hidden" name="spNum" value="${siList[0].spNum}">
        </div>

		<h3 class="card-title">
			<div class="mt-2 mb-3 col-6">
				<label for="title" class="form-label">제목</label>
				<input id="title" name="asTitle" class="form-control form-control-lg" type="text"
					placeholder="제목을 입력하세요." required />
			</div>
		</h3>

		<div class="row">
			<div class="col-3">
				<input class="form-control" type="date" name="asSdt" id="html5-date-input" value="2023-03-17"/>
<!-- 			<input class="form-control" type="datetime-local" name="asSdt" value="2023-03-08T12:30:00" id="html5-datetime-local-input"> -->
			</div>
			<div class="col-3">
				<input class="form-control" type="date" name="asEdt" id="html5-date-input" value="2023-03-18"/>
<!-- 			<input class="form-control" type="datetime-local" name="asEdt" value="2023-03-08T12:30:00" id="html5-datetime-local-input"> -->
			</div>
		</div>


<!-- 		<p>작성자 : 이수영</p> -->
<!-- 		<p>작성일 : 2022.12.04</p> -->
<!-- 		<p>조회수 : 30</p> -->
<!-- 		<input class="form-control" name="uploadFile" type="file" id="formFile"> -->
	</div>


	<div class="card-body">
		<textarea id="editor" name="asContent" cols="50" rows="20" required></textarea> <br />
			<div class="card-btn">
				<button type="button" id="btnAuto" class="btn btn-label-primary">자동채우기</button>
				<button type="submit" class="btn btn-label-primary">저장</button>
				<a href="/course/assignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">취소</button></a>
			</div>
	</div>
</div>
</form>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('asContent');
CKEDITOR.instances.editor.setData('<p></p>');

$(document).on("click", "#btnAuto", function(){
// 	console.log("두유");

	let title = document.querySelector("#title");
	title.setAttribute("value","과목 과제 글쓰기 테스트입니다.");
	console.log("title : " + title);

// 	let siNum = document.querySelector("#siNum option:eq(1)");
	let siNum = $("#siNum option:eq(1)");
	siNum.prop("selected", true);

// 	let editor = document.querySelector("#editor");
// 	editor.setAttribute("value", "내용테스트");
	CKEDITOR.instances.editor.setData('<p>과목 과제 글쓰기 내용입니다.</p>');


});

</script>


