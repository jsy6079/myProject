<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>메인 페이지</title>
<style>
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a, .pagination span {
        margin: 0 5px;
        padding: 3px 10px;
        border: 1px solid #ccc;
        color: #333;
        text-decoration: none;
    }
    .pagination a.active, .pagination span.active {
        background-color: #007bff;
        color: #fff;
    }
</style>
    
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
 
<div class="container">

    <div class="d-flex align-items-center justify-content-center" style="margin-top: 50px;">
        <table class="table">
            <thead class="table-secondary">
                <tr>
                    <th scope="col" style="width: 5%;">번호</th>
                    <th scope="col" style="width: 40%;">제목</th> <!-- 제목 부분 넓힘 -->
                    <th scope="col" style="width: 15%;">작성자</th> <!-- 작성자 부분 모음 -->
                    <th scope="col" style="width: 15%;">작성일</th> <!-- 작성일 부분 모음 -->
                    <th scope="col" style="width: 10%;">조회수</th>
                </tr>
            </thead>
            <tbody>
                    <c:forEach var="board" items="${freeBoardPage.content}">
                        <tr>
                            <td>${board.freeBoardNo}</td>
                            <td><a href="/freeBoardDetails/${board.freeBoardNo}">${board.freeBoardTitle}</a></td>
                            <td>${board.freeBoardWriter}</td>
                            <td><fmt:formatDate value="${board.freeBoardDate}" pattern="yyyy.MM.dd" /></td>
                            <td>${board.freeBoardView}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>          
        </div>
   <div class="d-flex justify-content-end">
      <button type="button" class="btn btn-primary" onclick="location.href='/free/freeBoardWrite'">글쓰기</button>
  </div>
    </div>

<!-- 페이징 구역 -->
<div class="pagination">

    <c:if test="${!freeBoardPage.isFirst()}">
        <a href="?page=0&size=${freeBoardPage.size}">처음으로</a>
    </c:if>

    <c:if test="${!freeBoardPage.isFirst()}">
        <a href="?page=${freeBoardPage.number - 1}&size=${freeBoardPage.size}">&laquo;</a>
    </c:if>

    

    <c:if test="${freeBoardPage.totalPages > 0}">

        <c:forEach var="i" begin="${Math.max(freeBoardPage.number - (freeBoardPage.number % 3), 0)}" 
            end="${Math.min(freeBoardPage.number - (freeBoardPage.number % 3) + 2, freeBoardPage.totalPages - 1)}">

            <c:choose>
            	
                <c:when test="${i == freeBoardPage.number}">
                    <span class="active">${i + 1}</span>
                </c:when>
      
                <c:otherwise>
                    <a href="?page=${i}&size=${freeBoardPage.size}">${i + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>
    
    <c:if test="${!freeBoardPage.isLast()}">
        <a href="?page=${freeBoardPage.number + 1}&size=${freeBoardPage.size}">&raquo;</a>
    </c:if>
    
    <c:if test="${!freeBoardPage.isLast()}">
        <a href="?page=${freeBoardPage.totalPages - 1}&size=${freeBoardPage.size}">끝으로</a>
    </c:if>
    
    
</div>
<!-- 페이징 구역 -->

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