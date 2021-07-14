<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애완동물 회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cancel").on("click", function(){		
		location.href = "/";	
	})	
		    
		$("#submit").on("click", function(){
			if($("#petname").val()==""){
				alert("이름을 입력해주세요.");
				$("petname").focus();
				return false;
			}
			
			if($("#petage").val()==""){
				alert("나이를 입력해주세요.");
				$("#petage").focus();
				return false;
			}
			if($("#pettype").val()=="select"){
				alert("품종을 입력해주세요.");
				$("#pettype").focus();
				return false;
			}

			var id = $("#personId").val();
			
			return true;
		});
})

function categoryChange(e) {
	var type_dog = ["선택", "슈나우저", "비글", "말티즈", "비숑", "기타"];
	var type_cat = ["선택", "러시안블루", "먼치킨", "숏헤어", "기타"];
	var type_etc = ["선택", "앵무새", "물고기", "기타"];
	var target = document.getElementById("pettype");

	if(e.value == "dog") var d = type_dog;
	else if(e.value == "cat") var d = type_cat;
	else if(e.value == "etc") var d = type_etc;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}
</script>
</head>
<body>
   <form action="/pet/join" method="get" onsubmit="return true;" >
      <table>
         <thead>
            <tr>
               <th colspan="2">
                  <label class="header">
                     <span>애완동물 정보 입력</span>
                  </label>
               </th>
            </tr>
         </thead>
         <tbody>
         	<tr>
               <td>
                  <label>사진</label>
               </td>
            </tr>
            <tr>
               <td>
                  <label>이름</label>
               </td>
               <td>
                  <input type="text" id="petname" name="petname">
               </td>
            </tr>
            <tr>
               <td>
                  <label>나이</label>
               </td>
               <td>
                  <input type="number" id="petage" name="petage">
               </td>
            </tr>
            <tr>
               <td>
                  <label>성별</label>
               </td>
               <td>
                  <label>수컷</label><input type="radio" name="petgender" value="male" checked="checked">
                  <label>암컷</label><input type="radio" name="petgender" value="female">
               </td>
            </tr>
            <tr>
               <td>
                  <label>품종</label>
               </td>
               <td><select onchange="categoryChange(this)" id="type"><option value = "select">선택</option><option value = "dog">강아지</option><option value = "cat" >고양이</option><option value = "etc">기타</option></select>
               <select id = "pettype" name="pettype"><option>선택</option></select></td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="2">
               	  <input type="hidden" id="personId" name="id" value=${personId }>
                  <input type="submit" id="submit" value="가입">
                  <button id="cancel" type="button">다음에 입력하기</button>
               </td>
            </tr>
         </tfoot>
      </table>
   </form>
</body>
</html>