<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>글 등록 페이지</title>
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
	 <form action="/freeBoardWrite" method="post">
	 <p>제목</p>
	 <input class="form-control" placeholder="제목을 입력해주세요." type="text" name="freeBoardTitle" id="freeBoardTitle" aria-label="Disabled input example" required maxlength="30">
	 
	 <!-- 작성자는 임의로 만든것! 로그인 구현하면 넘어오게 할거임 -->
	 <p>작성자</p>
	 <input class="form-control" placeholder="작성자를 입력해주세요." type="text" name="freeBoardWriter" id="freeBoardWriter" aria-label="Disabled input example" required>
	 
	 <p>내용</p>
	  <textarea class="form-control" placeholder="내용을 입력해주세요." name="freeBoardContent" id="freeBoardContent" style="height: 500px" required></textarea>
	     
	     <div class="d-flex justify-content-end" style="margin-top: 20px;">
        <button type="submit" class="btn btn-primary">등록하기</button>
    	</div>
    </form>	
	 </div>
	 
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
	 
	 
</body>
</html>