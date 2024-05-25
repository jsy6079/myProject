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
            <button class="btn btn-outline-light me-2" type="button" onclick="location.href='/user/login'" >로그인</button>
            <button class="btn btn-outline-light" type="button" onclick="location.href='/user/joinMember'">회원가입</button>
        </div>
	  </div>
	</nav>
 <!-- Nav -->
 
 <form action="/free/freeBoardEditSubmit/${freeBoardNo}" method="post" onsubmit="showConfirm()">
	<div class="container" style="border: 1px solid #ccc; margin-top: 50px; padding: 20px;">	
	 <p>제목</p>
	 <input class="form-control" type="text" name="freeBoardTitle" value="${board.freeBoardTitle}" aria-label="Disabled input example" required>
	 
        <div style="display: flex; justify-content: flex-end;">
             <span style="margin-right: 15px;">글쓴이 : ${board.freeBoardWriter}</span>
            <span>작성일: <fmt:formatDate value='${board.freeBoardDate}' pattern='yyyy.M.d HH:mm' /></span>
        </div>
        <div style="display: flex; justify-content: flex-end;">
        	<span> 👁 ${board.freeBoardView}</span>
        </div>
	 
	 <p style="margin-top: 10px;" >내용 
	  <textarea class="form-control" name="freeBoardContent" id="floatingTextarea2Disabled" style="height: 500px" required>${board.freeBoardContent}</textarea>
	  
	  <!-- Hidden inputs to retain existing values -->
	  <input type="hidden" name="freeBoardDate" value='${board.freeBoardDate}'/>
	  <input type="hidden" name="freeBoardView" value="${board.freeBoardView}" />
	  <input type="hidden" name="freeBoardWriter" value="${board.freeBoardWriter}" />
	  
        <div class="d-flex justify-content-end" style="margin-top: 10px;">
            <button type="submit" class="btn btn-primary">등록</button>
        </div>
     </div>
</form>

	<footer class = "py-3 my-4">
		<ul class ="nav justify-content-center border-bottom pb-3 mb-3">
		<li class="">
			<a href="/main" class="nav-link px-2 text-muted">메인</a>
		</li>
		<li class="">
			<a href="/main" class="nav-link px-2 text-muted">자유게시판</a>
		</li>
		<li class="">
			<a href="#" class="nav-link px-2 text-muted">구매게시판</a>
		</li>
		<li class="">
			<a href="#" class="nav-link px-2 text-muted">판매게시판</a>
		</li>
		<li class="">
			<a href="#" class="nav-link px-2 text-muted">질문과답변</a>
		</li>
		</ul>
		<p class="text-center text-muted">@ 2024 Company, Inc</p>
	</footer>
	
	
	<script>
		function showConfirm(){
			alert('수정 완료!');
			return true;
		}
	</script>

</body>
</html>