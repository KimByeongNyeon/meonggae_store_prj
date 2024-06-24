jQuery(document).ready(function($) {
	
	//찜 클릭 버튼
	$("#wishlist-btn").click(function() {
		if(checkLogin()){//로그인여부 확인
			if ($(this).hasClass("wished")) {
				$(this).removeClass("wished");
				$(this).html('<i class="fa fa-heart-o"></i> 찜 0');
			}else{
				$(this).addClass("wished");
				$(this).html('<i class="fa fa-heart"></i> 찜 1');
			}
		}//end if
	});//click
	
	//신고하기
	$(".open-report-modal").click(function(){
		if(checkLogin()){//로그인여부 확인
			$("#reportModal").modal("show");
		}
	});
	$("#reportModal").on('hidden.bs.modal',function(e){
		$(this).find('form')[0].reset();
	});
	
	//멍게톡 클릭 버튼
	$("#meonggaeTalk-btn").click(function(){
		if(checkLogin()){//로그인여부 확인
			
		}
	});
});//ready

//select 카테고리로 검색 - 부모
function selectedParent(){
	//선택된 부모 카테고리 가져오기
	var selParent = $("#proCate-parent").val();
	location.href="http://localhost/meonggae_prj/main_page/search_contents.do?cn="+selParent+"&isP=T"
}//selectedParent

//select 카테고리로 검색 - 자식
function selectedSub(){
	//선택된 자식 카테고리 가져오기
	var selSub = $("#proCate-child").val();
	location.href="http://localhost/meonggae_prj/main_page/search_contents.do?cn="+selSub+"&isP=F"
}//selectedSub

//로그인했는지 확인
function checkLogin(){
	var user = sessionStorage.getItem('user');
	if ( user == null ){
		alert("로그인이 필요한 서비스입니다.");
		return false; // 로그인하지 않은 경우 false 반환
    }//end if
    return true;// 로그인한 경우 true 반환
}//checkLogin