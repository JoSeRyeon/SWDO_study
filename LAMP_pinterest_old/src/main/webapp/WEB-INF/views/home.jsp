<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Home</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/681b98a464.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="/resources/css/basic.css">
<link rel="stylesheet" href="/resources/css/modal.css">
<link rel="stylesheet" href="/resources/css/modal_and_pin_style.css">
</head>

<script type="text/javascript">

(function() {
	
    console.log('함수 호출'); // "함수 호출" 출력
	console.log("db값 가져오기");

	  $.ajax({
			url : "/galleryDB",
			type : "post",
			data : { id: "dd"
				},
			dataType : "json",
			success : function(data){
			console.log(data);
			console.log("db 가져오기 성공");
			create_pin(data);
			



function create_pin(data) {

	for(var i = 0; i < data.length; i++){

	

	const pin_details = data[i];

    console.log(pin_details.pin_size);
    const new_pin = document.createElement('DIV');
    const new_image = new Image();
   
    new_image.src = pin_details.upload_img;
    new_pin.style.opacity = 0;

    console.log(new_image);
    console.log(new_pin);

	
    new_image.onload = function () {

        for(var i = 0; i < data.length; i++){
			console.log("출력");
        }
    	
        new_pin.classList.add('card');
        
        new_pin.classList.add('card_' + pin_details.pin_size);
       
        new_image.classList.add('pin_max_width');

		console.log(new_image);
		console.log(new_pin);
		console.log(new_pin.classList);
	

        new_pin.innerHTML = `<div class="pin_title">${pin_details.title}</div>
<div class="pin_modal">
    <div class="modal_head">
       
    </div>
    <div class="modal_foot">
        
    </div>
</div>
<div class="pin_image">
</div>`;

        document.querySelector('.pin_container').appendChild(new_pin);
        new_pin.children[2].appendChild(new_image);

        if (
            new_image.getBoundingClientRect().width < new_image.parentElement.getBoundingClientRect().width ||
            new_image.getBoundingClientRect().height < new_image.parentElement.getBoundingClientRect().height
        ) {
            new_image.classList.remove('pin_max_width');
            new_image.classList.add('pin_max_height');
        }

        new_pin.style.opacity = 1;
    }
    

	}
}


			
			
			
			
			/* 끝 */

			

			

			




		    

			},
			error : function(e){
			console.log(e);
			}
		});
		
}());



</script>

<body>

	<!-- 로그인, 회원가입, 로그아웃 -->
	<div style="text-align:right; color:#D9418C;">
		<a style="color:#D9418C" href="/member/logout">Logout</a>	
	</div>
	
	<!-- 로고 -->
	<header>
		<div style="text-align:center; color:#FF9500;">
			<h1><i class="fas fa-dog"></i> LAMP</h1>
		</div>
	</header>
	
	<!-- nav -->
	<nav>
		<ul>
			<li><b><a href="/home">갤러리존</a></b><li>
			<li><b><a href="/board">커뮤니티</a></b><li>
			<li><b><a href="/member/myPage">마이페이지</a></b><li>
		</ul>
	</nav>	
	
	<!-- 갤러리존 -->

	
	<div class="add">
        <div class="pint_mock_icon_container add_pin">
            <img src="/resources/images/add.png" alt="add_pin" class="pint_mock_icon">
        </div>
    </div>


    <div class="pin_container">
  
    </div>

    <div class="add_pin_modal">
        <div class="add_pin_container">
            <div class="side" id="left_side">
                <div class="section1">
                    <div class="pint_mock_icon_container">
                        <img src="/resources/images/ellipse.png" alt="edit" class="pint_mock_icon">
                    </div>
                </div>

                <div class="section2">
                    <label for="upload_img" id="upload_img_label">
                        <div class="upload_img_container">
                            <div id="dotted_border">
                                <div class="pint_mock_icon_container">
                                    <img src="/resources/images/uparrow.png" alt="upload_img" class="pint_mock_icon">
                                </div>
                                <div>사진업로드</div>
                            </div>
                        </div>
                        <input type="file" name="upload_img" id="upload_img">
                    </label>

                    <div class="modals_pin">
                        <div class="pin_image">
                            <!-- <img src="" alt="pin_image"> -->
                        </div>
                    </div>
                </div>

                <div class="section3">
                    <div class="save_from_site"></div>
                </div>
            </div>

            <div class="side" id="right_side">
                <div class="section1">
                    <div class="select_size">
                        <select name="pin_size" id="pin_size" name="pin_size">
                            <option value="" disabled selected>Select</option>
                            <option value="small">small</option>
                            <option value="medium">medium</option>
                            <option value="large">large</option>
                        </select>
                        <div class="save_pin">올리기</div>
                    </div>
                </div>

                <div class="section2">
                    <input placeholder="제목을 입력하세요" type="text" class="new_pin_input" id="pin_title" name="pin_title">
                    <input placeholder="내용을 입력하세요" type="text" class="new_pin_input" id="pin_description" name="pin_description">
                </div>
            </div>
        </div>
    </div>

	<script src="/resources/js/modal_and_pin.js"></script>
    <script src="/resources/js/modal_script.js"></script>
</body>
</html>