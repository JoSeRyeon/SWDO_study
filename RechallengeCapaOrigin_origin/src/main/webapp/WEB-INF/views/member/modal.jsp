<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>

<link href='/resources/css/modal.css' rel='stylesheet' />


</head>
<body>

<div id="root">
   
    <button type="button" id="modal_opne_btn">모달 창 열기</button>
       
</div>

<div id="modal" style="display:none">
    <div class="modal_content">
        <h2>모달 창</h2>
       
        <p>모달 창 입니다.</p>
       
        <button type="button" id="modal_close_btn">모달 창 닫기</button>
       
    </div>
   
    <div class="modal_layer"></div>
</div>


<script>
    document.getElementById("modal_opne_btn").onclick = function() {
        document.getElementById("modal").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }   
</script>

</body>
</html>