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

<nav class="navbar navbar-expand-lg bg-white">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbar-ex-6">
			<div class="navbar-nav me-auto">
				<a class="nav-item nav-link" href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">학생목록</a>
				<a class="nav-item nav-link active" href="/course/notice?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">공지</a>
				<a class="nav-item nav-link" href="javascript:void(0)">출석</a>
				<a class="nav-item nav-link" href="javascript:void(0)">과제</a>
				<a class="nav-item nav-link" href="/course/reference?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}">자료</a>
				<a class="nav-item nav-link" href="javascript:void(0)">성적</a>
			</div>
		</div>
	</div>
</nav>
<br />

<h5 class="title">
	<a href="#" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="#" class="categoryBar">${sbjTitle}</a>
</h5>

<form action="/course/noticeModify" method="post">

<input type="hidden" id="snNum" name="snNum" value="${data.snNum}">
<input type="hidden" id="sbjNum" name="sbjNum" value="${sbjNum}">
<input type="hidden" id="sbjTitle" name="sbjTitle" value="${sbjTitle}">

<div class="card">
	<div class="card-header">
		<h3 class="card-title">
			<div class="mt-2 mb-3">
				<label for="title" class="form-label">제목</label>
				<input id="title" class="form-control form-control-lg" type="text" 
					placeholder=".form-control-lg" name="snTitle" value="${data.snTitle}" />
			</div>
			<div class="card-btn">
				<button type="submit" class="btn btn-label-primary">저장</button>
				<a href="/course/goDetail?snNum=${data.snNum}&&sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary">취소</button></a>
			</div>
		</h3>
		<p>작성자 : ${data.teaNmKor}</p>
		<p>작성일 : <fmt:formatDate pattern="yyyy.MM.dd"
 			 value="${data.snDt}"/></p>
		<p>조회수 : ${data.snHit}</p>
		<input class="form-control" type="file" id="formFile">
	</div>
	
	
	<div class="card-body">
		<textarea id="editor" name="snContent" cols="50" rows="20">${data.snContent}</textarea>
		
	</div>
	
</div>
</form>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.replace('snContent');
// CKEDITOR.instances.editor.setData('<p></p>'); 
</script>