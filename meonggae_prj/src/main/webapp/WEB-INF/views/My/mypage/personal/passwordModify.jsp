<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			
			//이창은 닫아버리기
			location.href="http://localhost/meonggae_prj/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_pw.css">
<!-- CSS -->

<style type="text/css">
</style>
<script type="text/javascript">
	$(function(){
		/* 취소 */
		$("#addMenuBtn").click(function(){
			alert("추가");
		});
		
		/* 추가 */
		$("#cancleBtn").click(function(){
			self.close();
		});
	});//ready
</script>
</head>
<body>
<form>
	<div id="back">
		<div id="title">비밀번호 변경</div>
		<div id="subTitle">안전한 비밀번호로 내 정보를 보호하세요</div>
		<input type="password" id="pw" name="pw" placeholder="새 비밀번호" maxlength="50"><br/>
		<input type="password" id="pw" name="pw" placeholder="새 비밀번호 확인" maxlength="50">
		<div id="blank"> </div>
		<div id="btnWrap">
		<input type="button" value="변경" id="addMenuBtn" class="btn btn-primary btn-sm"/>　
		<input type="button" value="취소" id="cancleBtn" class="btn btn-secondary btn-sm"/>
		</div>
	</div>
</form>
</body>
</html>

	</c:otherwise>
</c:choose>