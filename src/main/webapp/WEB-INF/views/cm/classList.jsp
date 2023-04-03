<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="card">
	<h5 class="card-header">강의 목록</h5>
	<div class="card-body">
	<table class="table table-bordered table-hover cell-fit text-center">
		<thead class="table-active">
					<tr class="text-nowrap ">
						<th class="text-center">과목번호</th>
						<th class="text-center">학과</th>
						<th class="text-center">교수</th>
						<th class="text-center">이름</th>
						<th class="text-center">학년</th>
						<th class="text-center">학점</th>
						<th class="text-center">기준</th>
						<th class="text-center">정원</th>
						<th class="text-center">승인</th>
						<th class="text-center">개강</th>
						<th class="text-center">개강관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="data" items="${list}" varStatus="i">
						<tr>
							<td>${data.sbjNum}</td>
							<td>${data.deptNum}</td>
							<td>${data.teaNum}</td>
							<td>${data.sbjTitle}</td>
							<td>${data.sbjGrade}</td>
							<td>${data.sbjRecode}</td>
							<td>
								<c:if test="${data.sbjRs eq 1}">
									<span class="badge bg-label-primary">필수</span>
								</c:if>
								<c:if test="${data.sbjRs eq 2}">
									<span class="badge bg-label-secondary">선택</span>
								</c:if>
							</td>
							<td>${data.sbjPersonnel} 명</td>
							<td>
								<c:if test="${data.sbjYn eq 1}">
									<span class="badge badge-dot bg-success me-1"></span>승인
								</c:if>
								<c:if test="${data.sbjYn eq 0}">
									<span class="badge badge-dot bg-primary me-1"></span>대기
								</c:if>
								<c:if test="${data.sbjYn eq 2}">
									<span class="badge badge-dot bg-warning me-1"></span>반려
								</c:if>
							</td>
							<td>
								<c:if test="${data.sbjOc eq 1}">
									<span class="badge badge-center rounded-pill bg-success"><i class='bx bx-radio-circle'></i></span>
								</c:if>
								<c:if test="${data.sbjOc eq 0}">
									<span class="badge badge-center rounded-pill bg-danger"><i class='bx bx-x'></i></span>
								</c:if>
								<c:if test="${data.sbjOc eq 2}">
									<span class="badge badge-center bg-secondary">폐강</span>
								</c:if>
							</td>
							<td>
								<button type="button" class="btn btn-success btn-sm btnOK" onclick="">O</button>
								<button type="button" class="btn btn-danger btn-sm btnCom" onclick="">X</button>
								<button type="button" class="btn btn-dark btn-sm btnCom" onclick="">폐강</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
	</table>
	</div>
</div>



<script>
$(document).ready(function () {
    $('.table').DataTable();
});
</script>