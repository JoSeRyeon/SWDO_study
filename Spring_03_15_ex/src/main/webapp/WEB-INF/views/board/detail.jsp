<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 상세 내용 페이지 ]</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function boardDelete(board_no){
   location.href = "/board/delete?board_no="+board_no;
}
function boardUpdateForm(board_no){
   location.href = "/board/updateForm?board_no="+board_no;
}

$(function(){
   $("#replyBtn").on("click",function(){
      //가지고 와야하는 데이터는 2개
      // 1. 리플 내용
      var reply_context = $("#reply_context").val();
      // 2. 글 번호
      var board_no = $("#board_no").val();
      
      // 위의 2개의 데이터를 비동기 방식으로 서버에 전달한다.
      
      $.ajax({
         url : "/board/replyInsert",
         type : "post",
         data : {
            reply_context : reply_context,
            board_no : board_no
         },
         dataType: "json",
         success : function(data){
            console.log(data);
            
            var context = '<table border="1">';
            
            //1 첫번째 리플 입니다. 21-04-07 user1 [삭제][수정]
            $.each(data.replyList, function(index,item){
               // data가 아니라 replyList를 반복을 돌려야 함 (컨트롤러에서부터 받아오는 데이터의 타입이 더 큰 상자로 바뀌었으므로 한단계 더 들어가서 데이터를 꺼내야 함)
               context += '<tr>';
               context += '<td>'+(index+1)+'</td><td>'+item.reply_context+'</td>'
               context += '<td>'+item.reply_indate+'</td><td>'+item.customer_id+'</td>';
               if(data.customer_id == item.customer_id){  /* 로그인한 사람의 아이디 == 리플을 단 사람의 아이디 */
                  /* 로그인한 사람과 리플 단 사람의 아이디가 같을 때만 수정, 삭제 버튼을 보여주겠다 */
                  context += '<td><input type="button" value="수정">';
                  context += '<input type="button" class="replyDelBtn" value="삭제">';
				  context += '<input type="hidden" class="reply_no" value = "' + item.reply_no + '">';
				  context += '<input type="hidden" class="reply_no" value = "' + item.board_no + '">';
				  context += '</td>';

                  }
               context += '</tr>';
            });

            context += '</table>';
            
            $("#replyDiv").html(context);
            $("#reply_context").val("");

			
			replyDelete();


            
         },
         error : function(e){
            console.log(e);
         }
      });
      
   });

   
   function replyDelete(){
	   $(".replyDelBtn").on("click", function(){
			var reply_no = $(this).nextAll(".reply_no").val();
			var board_no = $(this).nextAll(".board_no").val();

			$.ajax({

				url : "/board/replyDelete",
				type : "post",
				data : {
					reply_no : reply_no,
					board_no : board_no
					},
				dataType : "json",
				success : function(data){
					console.log(data);
					},
				error : function(e){
					console.log(e);
					
					}
			});


			

		});
	 }

   replyDelete();


   
});
</script>
</head>
<body>

   글 번호 : ${detail.BOARD_NO } <br>
   글 제목 : ${detail.BOARD_TITLE } <br>
   작성자 : ${detail.CUSTOMER_NM } <br>
   글 내용 : <textarea rows="10" cols="10">${detail.BOARD_CONTENT }</textarea> <br>
   조회수 : ${detail.BOARD_HITS } <br>
   작성일 : ${detail.BOARD_INDATE } <br>
   첨부파일 : <a href="/board/download?board_no=${detail.BOARD_NO }">${detail.BOARD_ORIGINAL }</a> <br>
   
   <c:if test="${sessionScope.loginVO.customer_id == detail.CUSTOMER_ID }">
      <input type="button" value="수정" onclick="boardUpdateForm(${detail.BOARD_NO })">
      <input type="button" value="삭제" onclick="boardDelete(${detail.BOARD_NO })">
   </c:if>
   
   <div>
      댓글 : <textarea rows="3" cols="50" id="reply_context"></textarea> <input type="button" id="replyBtn" value="댓글저장">
      <input type="hidden" id="board_no" value="${detail.BOARD_NO }">
   </div>

   <div id="replyDiv">
   <table border="1">
                         
      <c:forEach var="reply" items="${map.replyList}" varStatus="status">
         <tr>
            <td>${status.count }</td>
            <td>${reply.reply_context}</td>
            <td>${reply.reply_indate }</td>
            <td>${reply.customer_id }</td>
            <c:if test="${sessionScope.loginVO.customer_id == reply.customer_id  }">
            <td>
               <input type="button" value="수정">
               <input type="button" class="replyDelBtn" value="삭제">
               <input type="hidden" class="reply_no" value = "${reply.reply_no }">
               <input type="hidden" class="board_no" value = "${reply.board_no }">
            </td>
            </c:if>
         </tr>
      </c:forEach>
      </table>
   </div>
</body>
</html>