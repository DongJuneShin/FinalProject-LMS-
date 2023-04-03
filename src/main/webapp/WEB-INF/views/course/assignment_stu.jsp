<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.categoryBar{
	color: gray;
}
table{
	text-align: center;
}
.btnWrite{
	float: right;
	width: auto;
}
.div-header{
	margin-right: 25px;
	padding-top: 10px;
}
.table{
	text-align: left;
}
.card-body{
	margin-top: 0px;
	padding-top: 0px;
}
</style>

<% 
	UserVO userVO = (UserVO) session.getAttribute("userVO"); 
	
	if(userVO.getAuth().equals("ROLE_STU")){
%>
<nav class="navbar navbar-expand-lg bg-white" id="nav_stu">
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
<%
	}else{
%>
<nav class="navbar navbar-expand-lg bg-white" id="nav_pro">
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
<%
	}
%>
<br />

<h5 class="title">
	<%
	if(userVO.getAuth().equals("ROLE_STU")){
	%>
	<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="/course/detail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
	<%
	}else{
	%>
	<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="/course/list_pro?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">강의목록</a>
	&nbsp;/&nbsp;<a href="/course/studentList?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}" class="categoryBar">${sbjTitle}</a>
	<%
	}
	%>
</h5>

<div class="card">
	<%
	if(userVO.getAuth().equals("ROLE_TEA")){
	%>
	<div class="div-header">
		<a href="/course/createAssignment?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}"><button type="button" class="btn btn-label-primary btnWrite">글쓰기</button></a>
	</div>
	<%
	}
	%>
	<div class="card-body">
	<table class="table">
		<thead class="table-active">
			<tr class="text-nowrap">
				<th>주차</th>
				<th class="si_target">제목</th>
				<th>제출기간</th>
			<% 
			if(userVO.getAuth().equals("ROLE_STU")){
			%>
				<th>제출여부</th>
			<% 
			}else{
			%>
				<th>제출여부 조회</th>
			<%
			}
			%>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="courseAssignmentVO" items="${data}" varStatus="stat">
			<tr>
				<th scope="row">${courseAssignmentVO.siNum}</th>
				<td><a href="/course/assignmentDetail?sbjNum=${sbjNum}&&sbjTitle=${sbjTitle}&&asNum=${courseAssignmentVO.asNum}">${courseAssignmentVO.asTitle}</a></td>
				<td><fmt:formatDate pattern="yyyy.MM.dd" value="${courseAssignmentVO.asSdt}"/> - <fmt:formatDate pattern="yyyy.MM.dd" value="${courseAssignmentVO.asEdt}"/></td>
				<% 
				if(userVO.getAuth().equals("ROLE_STU")){
				%>
				<c:if test="${courseAssignmentVO.sbmNum == 0 }">
				<td>X</td>
				</c:if>
				<c:if test="${courseAssignmentVO.sbmNum != 0 }">
				<td>O</td>
				</c:if>
				<% 
				}else{
				%>
				<td><button class="btn">조회하기</button></td>
				<%
				}
				%>
			</tr>
		</c:forEach>	
		</tbody>
	</table>
	</div>
	
<!-- 	<div class="card-footer"> -->
<!-- 		<div class="demo-inline-spacing"> -->
<!-- 			<nav class="paging" aria-label="Page navigation"> -->
<!-- 				<ul class="pagination justify-content-center"> -->
<!-- 					<li class="page-item active"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">1</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="javascript:void(0);">2</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
</div>

<script>
$(function(){
	$(".table").DataTable({
		aaSorting : []
	});
});
</script>