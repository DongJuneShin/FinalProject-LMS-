<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	UserVO userVO = (UserVO) session.getAttribute("userVO");
	int myNum = userVO.getUsername();
%>

<style>
.thCenter th{
	text-align: center;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
</style>

<br/>
<h4 class="title">상담 내역</h4>

<div class="card" style="min-height: 97%;">
	
	<div class="card-body">
		<table class="table table-bordered thCenter" id="consultTable">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th style="width: 5%;">번호</th>
					<th style="width: 7%;">상담 학생 학번</th>
					<th style="width: 10%;">상담 학생 명</th>
					<th style="width: 10%;">상담 일자</th>
					<th style="width: 10%;">상담 시간</th>
					<th>상담 사유</th>
					<th style="width: 7%;">상담 유형</th>
					<th style="width: 10%;"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="consultMap" items="${consultMapList}" varStatus="stat">
					<tr>
						<td>${stat.count }</td>
						<td>${consultMap.STU_NUM }</td>
						<td>${consultMap.STU_NM_KOR }</td>
						<td><fmt:formatDate value="${consultMap.CR_DT }" pattern="yyyy/MM/dd"/></td>
						<td>${consultMap.TIME }</td>
						<td>${consultMap.CR_REASON }</td>
						<c:choose>
							<c:when test="${consultMap.CR_TYPE == 0 }">
								<td>대면</td>
							</c:when>
							<c:otherwise>
								<td>비대면</td>
							</c:otherwise>
						</c:choose>
						<c:if test="${consultMap.CR_CHECK == 1 }">
							<td>
								승인
								<c:if test="${consultMap.CR_TYPE == 1 }">
									<button type="button" class="btn btn-sm btn-primary btnVideo" id="${consultMap.STU_NUM }">
										<i class='bx bx-video'></i>
									</button>
								</c:if>
							</td>
						</c:if>
						<c:if test="${consultMap.CR_CHECK == 2 }">
							<td>반려</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>


<script>
$(function() {
	consultTable = $("#consultTable").DataTable({
		info: false
	});
});

$(".btnVideo").on("click", function() {
	let tdTages = $(this).closest("tr").children();
	
	let date = tdTages.eq(3).text();
	let times = tdTages.eq(4).text();
	let stime = times.split("~")[0];
	let etime = times.split("~")[1];
	
	let beginTime = new Date(date + " " + stime);
	let endTime = new Date(date + " " + etime);
	let today = new Date();
	
	if(beginTime > today || endTime < today){
		Swal.fire({
			title: '상담시간이 아닙니다.<br/>상담 일자와 시간을 확인해주세요.',
			showClass: {
				popup: 'animate__animated animate__bounceIn'
			},
			icon: 'warning',
			customClass: {
				confirmButton: 'btn btn-primary'
			},
			buttonsStyling: false
		});
		return;
	}
	
	let teaNum = $(this).attr("id");
	window.open('/consult/index/tea?myNum=<%=myNum %>&yourNum=' + teaNum, '', 'width=1220, height=690, resizeable=no');
});
</script>