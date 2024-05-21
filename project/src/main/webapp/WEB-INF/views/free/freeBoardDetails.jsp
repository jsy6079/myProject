<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>상세 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

 <!-- Nav -->
	 <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
	  <div class="container-fluid">

		    <div class="navbar-brand" href="#">
		      <span>&#x1F340;</span>LoA Community<span>&#x1F340;</span>
		    </div>

	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/main">자유 게시판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">구매 게시판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">판매 게시판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">질문과 답변</a>
	        </li>
	      </ul>
	    </div>
	    <!-- 로그인 및 회원가입 버튼 -->
        <div class="ml-auto">
            <button class="btn btn-outline-light me-2" type="button">로그인</button>
            <button class="btn btn-outline-light" type="button">회원가입</button>
        </div>
	  </div>
	</nav>
 <!-- Nav -->
 
	<div class="container" style="border: 1px solid #ccc; margin-top: 50px; padding: 20px;">	
	 <p>제목</p>
	 <input class="form-control" type="text" value="${board.freeBoardTitle}" aria-label="Disabled input example" disabled readonly>
	 
        <div style="display: flex; justify-content: flex-end;">
             <span style="margin-right: 15px;">글쓴이 : ${board.freeBoardWriter}</span>
            <span>작성일: <fmt:formatDate value='${board.freeBoardDate}' pattern='yyyy.M.d HH:mm' /></span>
        </div>
        <div style="display: flex; justify-content: flex-end;">
        	<span> 👁 ${board.freeBoardView}</span>
        </div>
	 
	 <p style="margin-top: 10px;" >내용 <button type="button" class=" btn btn-primary" style="margin-left: 1100px;" onclick="location.href='/free/freeBoardEdit/${board.freeBoardNo}'">수정</button><button type="button" class=" btn btn-danger" style="margin-left: 10px;" onclick="confirmDelete(${board.freeBoardNo})">삭제</button></p>
	  <textarea class="form-control" id="floatingTextarea2Disabled" style="height: 500px" disabled>${board.freeBoardContent}</textarea>
	 </div>
	 
<div class="container" style="margin-top: 50px;">
    <h5>댓글 추가</h5>

    <form id="commentForm" class="mt-4">
        <div class="form-group">
            <label for="commentId">작성자</label>
            <input type="text" class="form-control" id="commentId" name="commentId" required>
        </div>
        <div class="form-group">
            <label for="commentContent">내용</label>
            <textarea class="form-control" id="commentContent" name="commentContent" rows="3" required placeholder="이쁜 댓글만 써주세요! 🙋‍"></textarea>
        </div>
        <button type="submit" class="btn btn-primary" style="margin-top : 10px; margin-left : 1200px">등록하기</button>
    </form>

    <hr>

    <ul class="list-group" id="commentsList">
        <!-- 댓글이 여기에 동적으로 추가됩니다 -->
    </ul>
</div>
	 
	 <script>
    function confirmDelete(freeBoardNo) {
        // 삭제하기 전에 확인 메시지를 표시
        var result = confirm("정말로 이 글을 삭제하시겠습니까?");
        
        // 사용자가 확인을 누를 경우, 삭제 페이지로 이동
        if (result) {
            location.href = '/free/freeBoardDelete/' + freeBoardNo;
        }
    }
    
    
    
    const freeBoardNo = ${freeBoardNo};
    
    
    // 댓글 조회
    
    function loadComments() {
        $.ajax({
            url: `/api/comment/freeboard/${freeBoardNo}`,
            type: 'GET',
            success: function(comments) {
                const commentsList = $('#commentsList');
                
                commentsList.empty();

                comments.forEach(comment => {
          
                    const commentItem = $('<li>').addClass('list-group-item border-0');

                    // 댓글 삭제 버튼 구현 
/*                     const deleteButton = $('<button>').addClass('btn-close btn-sm').attr({
                        type: 'button',
                        'aria-label': 'Close',
                        'num':comment.freeBoardCommentNo
                    }).click(function() {
                    	 confirmDeleteComment(comment.freeBoardCommentNo);
                    	
                    }); */
                    // 여기까지
                    
                     // 댓글 삭제 버튼 구현 
                   const deleteButton = $('<button>').addClass('btn-close btn-sm').attr({
                        type: 'button',
                        'aria-label': 'Close',
                        'num':comment.freeBoardCommentNo,
                    }).click(function(e) {
                    	 let num = $(e.target).attr('num');
                    	 confirmDeleteComment(num);
                    	
                    }); 
                    // 여기까지
                    

                    const commentId = $('<div>').addClass('form-group d-flex justify-content-between align-items-center').append(
                        $('<label>').addClass('m-0').text('📌'+comment.commentId),
                        deleteButton
                    );
                    
                    

                    const commentContent = $('<div>').addClass('form-group').append(
/*                         $('<label>').text('내용'), */
                        $('<textarea>').addClass('form-control').attr({
                            rows: '3',
                            disabled: true
                        }).text(comment.commentContent)
                    );

                    const commentDateISO = comment.commentDate;
                    const formattedCommentDate = new Date(commentDateISO).toLocaleDateString('ko-KR', {
                        year: '2-digit',
                        month: '2-digit',
                        day: '2-digit',
                        hour: '2-digit',
                        minute: '2-digit'
                    });
                    const commentDateElement = $('<small>').addClass('text-muted').text(formattedCommentDate);

                    commentItem.append(commentId, commentContent, commentDateElement);

                    commentsList.append(commentItem);
                });
            }
        });
    }

    $(document).ready(function() {
        loadComments();
        
        
     // 댓글 등록
        
        $('#commentForm').on('submit', function(event) {
            event.preventDefault();
            const commentData = {
                commentContent: $('#commentContent').val(),
                commentId: $('#commentId').val()
            };
            $.ajax({
                url: `/api/comment/freeboard/${freeBoardNo}`,
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(commentData),
                success: function(newComment) {
                	alert('댓글 등록이 완료되었습니다!');
                    loadComments(); // 댓글 목록 새로고침
                    $('#commentContent').val(''); // 입력 필드 비우기
                    $('#commentId').val(''); // 입력 필드 비우기
                    
                }
            });
        });
    });

    // 페이지 로드 시 댓글 불러오기
    $(document).ready(function() {
        loadComments();
    });
    
    
    // 댓글 삭제
    
   function confirmDeleteComment(freeBoardCommentNo){
	   alert("num : "+freeBoardCommentNo);
    	if(confirm('정말로 이 댓글을 삭제하시겠습니까?')){
    		$.ajax({
    			url:`/api/comment/freeboard/${freeBoardCommentNo}`,
    			type:'DELETE',
    			success: function(result){
    				loadComments();
    				console.log('1111111111111');
    			},
    			error: function(){
    				console.log('댓글 삭제 에러!');
    				console.log(freeBoardCommentNo);

    			}
    		})
    	}
    }
    

</script>

</body>
</html>