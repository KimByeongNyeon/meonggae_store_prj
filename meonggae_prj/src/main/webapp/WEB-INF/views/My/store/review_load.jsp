<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${not empty listReview}">
		
		<c:forEach var="i" items="${listReview}">
		
		
		
			<div class="reviewerName">${i.writer}</div>
			<span class="stars">★</span><span class="scoreFont">${ i.starScore }점</span>
			<div class="reviewContent">${i.content}</div>
		<hr>
		
		
		
		</c:forEach>
		
	</c:when>
	<c:otherwise>
		<hr>
		<div class="noMoreReview">
		마지막 리뷰입니다.
		</div>
		
	</c:otherwise>
</c:choose>