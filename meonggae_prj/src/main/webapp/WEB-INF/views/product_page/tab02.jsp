<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$("#change").click
</script>
	<form>
		<!-- <input type="search" placeholder="검색어를 입력하세요"> -->
		<table class="table table-hover" style="width: 100%;">
			<thead>
				<tr>
					<th style="width: 150px;">물품</th>
					<th style="width: 100px;">상태</th>
					<th style="width: 100px;">카테고리</th>
					<th style="width: 150px;">상품명</th>
					<th style="width: 100px;">가격</th>
					<th style="width: 150px;">물품 상태</th>
					<th style="width: 150px;">직거래 장소</th>
					<th style="width: 50px;">찜</th>
					<th style="width: 50px;">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${productList}">
					<tr>
						<td><img alt="상품 정보"
							src="http://localhost/meonggae_prj/products-img/${product.imgFileName}"></td>
						<td><select>
								<option value="판매중"
									<c:if test="${product.sell_status_code == 'N'}">selected</c:if>>판매중</option>
								<option value="판매완료"
									<c:if test="${product.sell_status_code == 'S'}">selected</c:if>>판매완료</option>
						</select></td>
						<td>${product.category}</td>
						<td>${product.name}</td>
						<td>${product.price}</td>
						<td><c:if test="${product.quality_code == '1'}">미개봉</c:if> <c:if
								test="${product.quality_code == '2'}">거의 새 것</c:if> <c:if
								test="${product.quality_code == '3'}">사용감 있음</c:if></td>
						<td>${product.location}</td>
						<td>${product.cnt}</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="수정" id ="change"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
