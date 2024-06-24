$(function () {
	$("#add").click(function(){
		var ext = $("#image").val();
		
		if(ext == "'){
		alert("파일을 선택해주세요.")
		return;
		}
		
		if(ext.substring(ext.lastIndexOf(".")+1).toUpperCase() == "JSP") {
		alert("업로드 불가능한 형식의 파일입니다.");
		return;
		}
	})
}

function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function() {
                const output = document.getElementById('image-preview');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }