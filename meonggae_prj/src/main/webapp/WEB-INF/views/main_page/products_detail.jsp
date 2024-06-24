<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title>
<link rel="icon" href="../common/tamcatIcon.ico"/>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
<!-- Theme Stylesheet -->

<script src ="http://localhost/meonggae_prj/common/JS/script.js"></script>
<script src ="http://localhost/meonggae_prj/common/JS/product_detail.js"></script>
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/responsive.css">
</head>
<body>
<!-- header 시작 -->
<jsp:include page="../header/header.jsp" />
<!-- header 끝 -->
<input type="hidden" name="user_memNum" value="${user.memNum}">
<input type="hidden" name="checkMemSteam" value="${checkMemSteam}">
<div class="container">
	<div class="row">
		<div class="products_categoryNavigation">
			<span>전체</span> 
			<span> > </span>
			<!-- 대분류(부모)에 속한 상품인 경우 -->
			<c:if test="${empty subCateList}">
			<select id="proCate-parent" name="proCate-parent" onchange="selectedParent()">
				<c:forEach var="list" items="${parentCateList}">
     				<option value="${list.categoryNum}" ${list.categoryNum eq spd.categoryNum ? 'selected="selected"' : ''}>${list.name}</option>
    			</c:forEach>
			</select> 
			</c:if>
			<!-- 소분류(자식)에 속한 상품인 경우 -->
			<c:if test="${not empty subCateList}">
			<select id="proCate-parent" name="proCate-parent" onchange="selectedParent()">
				<c:forEach var="list" items="${parentCateList}">
     				<option value="${list.categoryNum}" ${list.categoryNum eq spd.parentCategoryNum ? 'selected="selected"' : ''}>${list.name}</option>
    			</c:forEach>
			</select> 
			<span> > </span> 
			<select id="proCate-child" name="proCate-child" onchange="selectedSub()">
				<c:forEach var="list" items="${subCateList}">
     				<option value="${list.categoryNum}" ${list.categoryNum eq spd.categoryNum ? 'selected="selected"' : ''}>${list.name}</option>
    			</c:forEach>
			</select>
			</c:if>
		</div>
	</div>
	<div class="short-description">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                    <div class="product-thumbnail">

                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="thumb-main-image"><a href=""><img src="http://localhost/meonggae_prj/products-img/${ spd.imgName }" alt=""></a></div>

                        </div>

                    </div>

                </div>

                <div class="col-md-6">

                    <h1 class="product-title">${ spd.goodsName }</h1>


                    <div class="price">

                        <span>${spd.priceFm}원</span>

                    </div>
                    
                <div class="col-md-9 col-sm-9">
                    <ul class="product-info-btn">
                        <li><a><i class="fa fa-heart-o"></i> ${ spd.countSteam }</a></li>

                        <li><a><i class="fa fa-eye"></i> ${spd.cnt}</a></li>

                        <li><a><i class="fa fa-clock-o"></i> ${spd.timeAgo}</a></li>
                    </ul>
				</div>
                <div class="col-md-3 col-sm-3 bullhorn">
                	<a class="open-report-modal"><i class="fa fa-bullhorn"></i> 신고하기</a>
				</div>
				<div class="product-info-status">
				<ul>
                    <li>상품상태 : <span class="strong-text">${spd.qualityCodeStr}</span></li>

                    <li>배송비 : <span class="strong-text">${spd.deliveryFee}</span></li>
                    
                    <li>직거래지역 : <span class="strong-text">${spd.locationStr}</span></li>
				</ul>
				</div>
				<div class="wish-talk-btn">
					<button id="wishlist-btn" class="wishlist-btn">
						<i class="fa fa-heart-o"></i> 찜 0
					</button>
					<button id="meonggaeTalk-btn" class="meonggaeTalk-btn">
						<i class="fa fa-comments" aria-hidden="true"></i>멍게톡
					</button>
				</div>	

                </div>

            </div>

        </div>

    </div>

<div class="container">

	<div class="row">
		<div class="row-before">
			<div class="col-md-7">
				<div class="product-desc">

					<h3>상품정보</h3>
					<p>
						${spd.detail}
					</p>
				</div>

			</div>
			<div class="col-md-5 border">
				<div class="product-desc ">
					<h3>상점정보</h3>
				</div>
				<div class="product-sellerStyle">
					<button class="store-btn">
						<div class="profile">
							<img class="profile-pic" src="../common/images/kimyear.png" alt="판매하기 이미지">
						</div>
							없는거빼고다있어샵
					</button>
					<div class="seller-other-products">
					<c:forEach begin="1" end="6" varStatus="i">
						<div class="other-product">
							<a href="#void">
								<img src="../products-img/product-${ i.index }.jpg" alt="" class="other-product-thumbnail">
								<span class="other-product-price">1${ i.index },000원</span>
							</a>
						</div>
					</c:forEach>
					</div>
					<div class="other-products-more">
						<a href="#void">판매자의 상품 더보기	></a>
					</div>
				</div>
						
				<div class="product-desc">
					<h3>상점후기</h3>
				</div>
				<div class="product-reviewStyle">
				<c:forEach begin="1" end="3" varStatus="i">
					<div class="one-review">
						<button class="buyer-btn">
							<div class="buyer-profile">
								<img class="buyer-pic" src="../common/images/default.png" alt="판매하기 이미지">
							</div>
								댕큰구매하러옴
						</button>
						<div class="ratings">
							<i class="fa fa-star"></i> 
							<i class="fa fa-star"></i> 
							<i class="fa fa-star"></i> 
							<i class="fa fa-star"></i> 
							<i class="fa fa-star-o"></i>
						<p class="review-time-ago" style="float: right;">${ i.index }일전</p>
						</div>
						<p>${ 4 - i.index }번째 거래입니다. 좋은 거래 감사합니다.</p>
					</div>
				</c:forEach>
					<div class="review-more">
						<a href="#void">상점후기 더보기	></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 신고하기 modal 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" id="reportModal" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><strong>신고하기</strong></h3>
      </div>
      <div class="modal-body">
        <form action="reportFrm" id="reportFrm" name="reportFrm">
			<select id="report-title" name="report-title">
				<option value="" selected="selected">---- 신고 유형 선택 ----</option>
				<option value="광고성 콘텐츠(상점)예요.">광고성 콘텐츠(상점)예요.</option>
				<option value="상품정보가 부정확해요.">상품정보가 부정확해요.</option>
				<option value="거래금지 품목으로 판단돼요.">거래금지 품목으로 판단돼요.</option>
				<option value="사기가 의심돼요.(외부 채널 유도)">사기가 의심돼요.(외부 채널 유도)</option>
				<option value="기타">기타</option>
			</select><br>
			<textarea></textarea><br>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-report" name="btn-report">신고하기</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- 신고하기 modal 끝 -->
<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
<!-- footer 끝 -->