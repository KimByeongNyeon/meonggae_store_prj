<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="나의 상점_리뷰"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${not empty user}">
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_store.css?after">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		
	});//ready
</script>

<%
String nick = request.getParameter("nick");
%>
<!-- 내용 시작 -->
<div class="container">
	<div id="storeBanner" class="storeBanner">
		<div id="profileImg" class="profileImg">
		<img src="http://localhost/meonggae_prj/profile-img/${ profile }" class="img-circle" style="width: 100px; height: 100px"/>
		</div>
		<div id="userInfo" class="userInfo">
			<div id="nick" class="nick"><%= nick %>님의 상점</div>
			<a href="#void" id="userDeclaration"><i class="fa fa-exclamation"></i> 신고</a>
		</div>
	</div>
	<div id="storeMenu" class="storeMenu">
		<a href="http://localhost/meonggae_prj/My/store/store_frm.do?nick=${user.nick}" id="unSelected">상품</a> | 
		<a href="http://localhost/meonggae_prj/My/store/store_review_frm.do?nick=${user.nick}" id="selected">후기</a>
	</div>
	
	<%
	double score = 3.3;
	double score2 = (double)score/5;
	int width = (int)(score2*100);
	
	double tempScore = 4.5;
	double temp = tempScore%1;
	System.out.println(temp);
	%>
	<div class="totalStarScore">
		<%= score %><br/>
		<div class="wrap-star">
		    <div class="star-rating">
		        <span style ="width:<%=width%>%;"></span>
		    </div>
		</div>
	</div>
	
	
	
	<hr style="color: #606060;">
	<div class="review">
		<div class="reviewerName">집에가고싶은사람</div>
		<div class="stars">★★★★☆</div>
		<div class="reviewContent">너무졸려요!!</div>
	</div>
	<hr>
	<div class="moreReviewWrap">
	<input type="button" value="더보기" class="moreReviewBtn"/>
	</div>
</div>

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="http://localhost/meonggae_prj/index.do";
		</script>
	</c:otherwise>
</c:choose>