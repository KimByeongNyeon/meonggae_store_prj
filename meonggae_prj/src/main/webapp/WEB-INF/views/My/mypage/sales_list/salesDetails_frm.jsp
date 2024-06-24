<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="거래내역_판매중"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="http://localhost/meonggae_prj/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_mypage.css">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "salesDetails";
		String lowPageName = "sales";
		pageContext.setAttribute("pageName", pageName);
		pageContext.setAttribute("lowPageName", lowPageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
			<!-- 하위 메뉴바 -->
		<br/>
		<div id="lowMenu" class="lowMenu">
		<%@ include file="lowMenu.jsp" %>
		</div>
		<hr>
		<!-- 메뉴목록 -->
	</div>
	
	<div class="row">
		<div class="tab-content">
			<div class="tab-pane active" id="trending">
				<c:forEach begin="1" end="2" varStatus="i">
				<div class="col-md-3 col-sm-4">
					<div class="single-product">
						<div class="product-block">
							<img src="../../../products-img/product-${ i.index }.jpg" class="thumbnail">
							<div class="product-description text-left">
								<p class="title">여성의류</p>
								<div style="overflow: hidden;">
								<p class="price" style="float: left;">0원</p>
								<p class="time-ago" style="float: right;">0일전</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
		
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>