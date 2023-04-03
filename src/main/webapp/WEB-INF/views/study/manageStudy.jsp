<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<style type="text/css">
.categoryBar{
	color: gray;
}
.buttonDiv{
	text-align: right;
}
</style>

<br/>
<h4 class="title">
	스터디 리스트
</h4>
	
<div class="card">
	<div class="card-body">
		<table class="table table-bordered" id="studyTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>No.</th>
					<th>스터디명</th>
					<th>참여인원</th>
					<th>개설자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="study" items="${studyList}" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${study.S_NM }</td>
						<td>${study.COUNT }</td>
						<td>${study.STU_NM_KOR }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
$(function() {
	$("#studyTable").DataTable();
});
</script>