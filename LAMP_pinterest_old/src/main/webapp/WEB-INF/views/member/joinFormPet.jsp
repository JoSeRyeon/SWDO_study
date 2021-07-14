<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>애완동물 정보 입력</title>
	<link rel="stylesheet" href="/resources/css/basic.css">
	<link rel="stylesheet" href="/resources/css/joinFormPet.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://kit.fontawesome.com/681b98a464.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#next").on("click", function(){		
				location.href = "/pet/join_x";
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
					
				if($("#pettype").val()=="선택"){
					alert("품종을 입력해주세요.");
					return false;
				}
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
		
		$(function(){
			$("#jobDirect").hide();
			$("#pettype").change(function(){
		
				if($("#pettype").val() == "기타"){
					$("#jobDirect").show();
					}else{
					$("#jobDirect").hide();
					}
				})	
		});
	</script>
</head>

<body>
	<form action="/pet/join" method="post">
		<table>
        	<thead>
            	<tr>
               		<th colspan="2">
                  		<label class="header">
                     		<span><i class="fas fa-dog"></i> LAMP</span>
                     		<br><br><br>
                     		<h2 style="color: #808080;">- 애완동물 정보 -</h2>
                 		</label>
                 		
               		</th>
            	</tr>
         	</thead>
			<tbody>
            	<tr>
               		<td>
                  		<label>이름</label>
               		</td>
               		<td>
                  		<input type="text" id="petname" name="petname" placeholder="Poppet Name">
               		</td>
            	</tr>
            	<tr>
               		<td>
                  		<label>나이</label>
               		</td>
	               	<td>
	                  	<input type="number" id="petage" name="petage" placeholder="Poppet Age">
	               	</td>
            	</tr>
            	<tr>
               		<td>
                  		<label>성별</label>
               		</td>
               		<td>
                 		<label>수컷 </label><input type="radio" name="petgender" value="male" checked="checked" style="margin-right: 100px;">
                  		<label>암컷 </label><input type="radio" name="petgender" value="female">
               		</td>
            	</tr>
            	<tr>
               		<td>
                  		<label>품종</label>
               		</td>
               		<td>
               			<select onchange="categoryChange(this)" id="type" style="width:100px; height:30px;">
               				<option value = "select">선택</option>
               				<option value = "dog">강아지</option>
               				<option value = "cat" >고양이</option>
               				<option value = "etc">기타</option>
               			</select>
               			<select id = "pettype" name="pettype" value="select" style="width:100px; height:30px;">
               				<option>선택</option>
               			</select>
               			<input type="text" id="jobDirect" name="pettype" style="width:100px; height:6px;">
               		</td>
            	</tr>
			</tbody>
			<tfoot>
            	<tr>
            		<td>
                  		<label></label>
               		</td>
               		<td>
                  		<input type="submit" id="submit" value="확인">
                  		<input type="button" id="next" value="다음에 입력하기">
                  		<input type="hidden" name="id" value="${member.id}">
               		</td>
            	</tr>
         	</tfoot>
		</table>
	</form>
</body>
</html>