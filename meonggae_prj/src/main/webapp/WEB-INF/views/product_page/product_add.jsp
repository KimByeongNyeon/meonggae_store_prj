<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title>
<link rel="icon" href="../common/tamcatIcon.ico" />

<!-- jQuery CDN -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
    integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
    crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
    integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
    crossorigin="anonymous"></script>
<!-- Google Font -->
<link
    href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
    rel='stylesheet' type='text/css'>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
    type="text/css">
<!-- Theme Stylesheet -->
<script src="../common/JS/script.js"></script>
<script src="../common/JS/tab.js"></script>
<script src="../common/JS/product_add.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	const options = [
        "여성의류", "남성의류", "가방/지갑", "악세서리", "디지털", "스타굿즈", "도서/문구", "뷰티/미용", "상의",
        "바지", "치마", "원피스", "언더웨어/홈웨어", "아우터", "상의", "하의", "여성가방", "남성가방",
        "여행용가방", "귀걸이", "목걸이", "반지", "노트북", "무선이어폰", "스마트폰", "포스터", "포토카드",
        "피규어", "도서", "문구", "티켓", "스킨케어", "색조메이크업", "남성화장품"
    ];
	
	console.log(options[1]);
	
    let optionTags = "";
    for (let i = 0; i < options.length; i++) {
    	 optionTags += '<option value="' + i+1 + '">' + options[i] + '</option>\n';
    }

    console.log("Final optionTags:", optionTags);  // 최종 optionTags를 로그로 출력

    document.getElementById('category_num').innerHTML = optionTags;
});
$(function () {
	
	$("#add").click(function(){
		var ext=$("#img").val();
		
		if(ext == ""){
			alert("파일을 선택해주세요.")
			return;
		}
		
		if(ext.substring(ext.lastIndexOf(".")+1).toUpperCase() == "JSP"){
			alert("업로드 불가능한 파일입니다.");
			return;
		}//end if
		$("#newProduct").submit();
	})
});
function previewImage(event) {
    const reader = new FileReader();
    reader.onload = function() {
        const output = document.getElementById('image-preview');
        output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
}
</script>
<link rel="stylesheet"
    href="http://localhost/meonggae_prj/common/CSS/style.css?v=1.0">
<link rel="stylesheet"
    href="http://localhost/meonggae_prj/common/CSS/tab.css?v=1.0">
<link rel="stylesheet"
    href="http://localhost/meonggae_prj/common/CSS/product_add.css?v=1.0">
</head>

<body>
    <!-- header 시작 -->
    <jsp:include page="../header/header.jsp" />
    <!-- header 끝 -->
    <div class="container" style="height: 100%">
        <div class="tab">
            <ul class="tabnav">
                <li><a href="#tab01">상품등록</a></li>
                <li><a href="#tab02">판매상태</a></li>
            </ul>
            <div class="tabcontent">
                <div id="tab01">
                    <form name="newProduct" id="newProduct" action="${pageContext.request.contextPath}/product_page/product_add.do" class="form-horizontal" method="post" enctype="multipart/form-data">
                        <div class="form-section">
                            <div class="form-group">
                                <label for="image">상품이미지</label>
                                <img id="image-preview" class="image-preview" src="">
                                <input type="file" id="img" name="img" accept="image/*" onchange="previewImage(event)">
                            </div>
                            <div class="form-group">
                                <label for="name">상품명</label>
                                <input type="text" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="category_num">카테고리</label>
                                <select id="category_num" name="category_num" required>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">가격</label>
                                <input type="text" id="price" name="price" required>
                            </div>
                        </div>
                        <div class="form-section">
                            <div class="form-group">
                                <label>물품 상태</label>
                                <div class="radio-group">
                                    <label><input type="radio" name="quality_code" value="1" required>새상품(미사용)</label>
                                    <label><input type="radio" name="quality_code" value="2" required>사용감없음</label>
                                    <label><input type="radio" name="quality_code" value="3" required> 사용감적음</label>
                                    <label><input type="radio" name="quality_code" value="4" required> 사용감많음</label>
                                    <label><input type="radio" name="quality_code" value="5" required> 고장/파손 상품</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="location">직거래 장소</label>
                            <input type="text" id="location" name="location" required>
                        </div>
                        <div class="form-section">
                            <div class="form-group">
                                <label for="detail">설명</label>
                                <textarea id="detail" name="detail" rows="5" required></textarea>
                            </div>
                        </div>
                        <div class="form-section">
                            <div class="form-group">
                                <label>거래 방식</label>
                                <div class="radio-group">
                                    <label><input type="radio" name="trade_method_code" value="B" required>택배/직거래</label>
                                    <label><input type="radio" name="trade_method_code" value="P" required>택배</label>
                                    <label><input type="radio" name="trade_method_code" value="D" required>직거래</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" id = "add" class="btn btn-success">등록하기</button>
                            <button type="button" class="btn btn-secondary">임시저장</button>
                        </div>
                    </form>
                </div>
                <div id="tab02">
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
                                        <td><img alt="상품 정보" src="http://localhost/meonggae_prj/products-img/${product.imgFileName}"></td>
                                        <td>
                                            <select>
                                                <option value="판매중" <c:if test="${product.sell_status_code == 'N'}">selected</c:if>>판매중</option>
                                                <option value="판매완료" <c:if test="${product.sell_status_code == 'S'}">selected</c:if>>판매완료</option>
                                            </select>
                                        </td>
                                        <td>${product.category}</td>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                        <td>
                                        <c:if test="${product.quality_code == '1'}">미개봉</c:if>
                                        <c:if test="${product.quality_code == '2'}">거의 새 것</c:if>
                                        <c:if test="${product.quality_code == '3'}">사용감 있음</c:if>
                                        </td>
                                        <td>${product.location}</td>
                                        <td>${product.cnt}</td>
                                        <td><input type="button" class="btn btn-success btn-sm" value="수정"></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <!--tab-->
    </div>
    <!-- footer 시작 -->
    <jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
</body>
</html>
