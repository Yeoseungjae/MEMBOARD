<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="스프링 회원제 게시판">
<meta name="author" content="MR.YEO">
<meta name="keywords" content=" BOOTSTRAP MEMBER, BOARD, MEMBOARD">

<link rel="shortcut icon" href="resources/img/icons/icon-48x48.png" />

<title>Spring_MEMBOARD</title>

<link href="resources/css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="start"> <span
					class="align-middle">Spring<br/>회원제 게시판</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">회원정보</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="M_joinForm"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">회원가입</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="M_loginForm"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">로그인</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="M_logout"> <i class="align-middle"
							data-feather="settings"></i> <span class="align-middle">로그아웃</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="M_list"> <i class="align-middle"
							data-feather="credit-card"></i> <span class="align-middle">회원목록</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="M_view?MId=${sessionScope.loginId}"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">회원보기</span>
					</a></li>
					
					<li class="sidebar-item"><a class="sidebar-link" href="M_modiForm?MId=${sessionScope.loginId}"> 
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list align-middle"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg> <span class="align-middle">회원수정</span>
					</a></li>
					
					<li class="sidebar-header">게시판 정보</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="B_writeForm"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">게시글 작성</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="B_list"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">게시글 목록</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="B_view?BNo=1&page=1"> <i class="align-middle"
							data-feather="settings"></i> <span class="align-middle">게시글 보기</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="B_modiForm?BNo=1&page=1"> <i class="align-middle"
							data-feather="credit-card"></i> <span class="align-middle">게시글 수정</span>
					</a></li>
					
				</ul>

			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
			<form action="B_search" class="d-none d-sm-inline-block">
					<div class="input-group input-group-navbar">
						<select name="selectVal">
							<option value="BWriter">작성자</option>
							<option value="BTitle">제목</option>
							<option value="BContent">내용</option>
						</select> &nbsp;
						
						<input type="text" name="keyword" class="form-control" placeholder="Search…" aria-label="Search">
						<button class="btn" type="submit">
              <i class="align-middle" data-feather="search"></i>
            </button>
					</div>
				</form>
				<c:choose>
				<c:when test="${sessionScope.loginId != null}">
							<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
												
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown"> 
							<i class="align-middle" data-feather="settings"></i></a> 
							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown"> 
							<img src="resources/img/avatars/${sessionScope.profile}" class="avatar img-fluid rounded mr-1" alt="MProfile" /> 
							<span class="text-dark">${sessionScope.loginId}</span>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a class="dropdown-item" href="M_view?MId=${sessionScope.loginId}">
									<i class="align-middle mr-1" data-feather="user"></i> Profile
								</a>
								<a class="dropdown-item" href="#">
									<i class="align-middle mr-1" data-feather="pie-chart"></i> Analytics
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="M_modiForm?MId=${sessionScope.loginId}">
									<i class="align-middle mr-1" data-feather="settings"></i> 
									Settings & Privacy</a> 
								<a class="dropdown-item" href="#">
									<i class="align-middle mr-1" data-feather="help-circle"></i> Help Center
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="M_logout">Log out</a>
							</div></li>
					</ul>
				</div>
						</c:when>

						<c:otherwise>
							<div class="navbar-collapse collapse">
							<ul class="navbar-nav navbar-align">
												
								<li class="nav-item dropdown">
									<div class="position-relative">
										<a href="M_loginForm"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-in align-middle mr-2"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path><polyline points="10 17 15 12 10 7"></polyline><line x1="15" y1="12" x2="3" y2="12"></line></svg>로그인</a>&nbsp;&nbsp;&nbsp;
										<a href="M_joinForm"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle mr-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>회원가입</a> 
										
									</div>
								</li>
							</ul>
							</div>
						</c:otherwise>

				</c:choose>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3" style="text-align : center;">게시글 상세보기</h1>
					<div class="row">
						<div class="col-12 col-xl-6" style="margin:0 auto;">
							<div class="card mb-3">
								
								<div class="card-body">
									<h5 class="h6 card-title">번호</h5>
									<h3>${view.BNo}</h3>
								</div>
								
								<div class="card-body">
									<h5 class="h6 card-title">작성자</h5>
									<h3>${view.BWriter}</h3>
								</div>
								
								<div class="card-body">
									<h5 class="h6 card-title">제목</h5>
									<h3>${view.BTitle}</h3>
								</div>
								
								<div class="card-body">
									<h5 class="h6 card-title">게시글 내용</h5>
									<h3>${view.BContent}</h3>
								</div>
								
								<div class="card-body">
									<h5 class="h6 card-title">작성일</h5>
									<h3>${view.BDate}</h3>
								</div>
								
								<div class="card-body">
									<h5 class="h6 card-title">조회수</h5>
									<h3>${view.BHit}</h3>
								</div>
								
								<div class="card-body text-center">
									<img src="resources/boardUpload/${view.BFileName}" class="img-fluid pr-2"
										alt="photos" width="200px">
									<div class="text-muted mb-2">${view.BFileName}</div>
								</div>
								<c:if test="${sessionScope.loginId eq view.BWriter}">
								<div class="card-body text-center">
									<button class="btn btn-outline-success" onclick="location.href='B_modiForm?BNo=${view.BNo}&page=${page}'">수정</button>
									<button class="btn btn-outline-danger" onclick="location.href='B_delete?BNo=${view.BNo}&page=${page}'">삭제</button>
								</div>
								</c:if>
								<c:if test="${not empty sessionScope.loginId}">
								<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">댓글</h5>
								</div>
								<div class="card-body">
									<textarea class="form-control" rows="5" cols="20" id="CContent" placeholder="내용입력"></textarea>
									<button id="cmtBtn" class="btn btn-primary">댓글 입력</button>
								</div>
							</div>
							</c:if>
							<div id="commentArea"></div>
							</div>
						</div>
						


					</div>

				</div>
			</main>
		</div>
	</div>

	<script src="resources/js/app.js"></script>

</body>
<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">

	// M_View.jsp페이지 로딩 시 댓글 목록 조회
	$(document).ready(function(){
		let CBNo = ${view.BNo};
		
		$.ajax({
			type : "POST" ,
			url : "C_list" , 
			data : {"CBNo" : CBNo} ,
			dataType : "json" , 
			success : function(result) {
				commentList(result);
			},
			error : function(){
				alert("댓글 리스트 불러오기 실패!");
			}
		});
		
		$("#cmtBtn").click(function(){
			let CWriter = '${sessionScope.loginId}';
			let CContent = $("#CContent").val();
			let CBNo = ${view.BNo};
			
			$.ajax({
				type : "POST" ,
				url : "C_write" ,
				data : {"CWriter" : CWriter,
					    "CContent" : CContent,
					    "CBNo" : CBNo} ,
				dataType : "json" ,
				success : function(result) {
					commentList(result);
					$("#CContent").val("");
				} ,
				error : function() {
					alert("댓글 입력 실패!");
				}
			});
		});
	});
	
	function commentList(result) {
		let output = "";
		output += "";
		output += "<table class='table table-striped'>";
		output += "<thead>";
		output += "<tr>";
		output += "<th>작성자</th>";
		output += "<th>내용</th>";
		output += "<th>삭제</th>";
		output += "</tr>";
		output += "</thead>";
		
		for(var i in result) {
			output += "<tbody>";
			output += "<tr>";
			output += "<td>"+result[i].CWriter+"</td>";
			output += "<td>"+result[i].CContent+"</td>";
			output += "<td><button class='btn btn-primary' onclick='cmtDelete("+result[i].CNo+")'>삭제</button></td>";
			output += "</tr>";
			output += "</tbody>";
		}
		output += "</table>";
		
		$("#commentArea").html(output);
	}
	
	function cmtDelete(CNo) {
		
		$.ajax({
			type : "GET" ,
			url : "C_delete" ,
			data : {
				"CNo" : CNo,
				"CBNo" : ${view.BNo}
			},
			dataType : "json",
			success : function(result) {
				commentList(result);
			},
			error : function(){
				alert("댓글 삭제 실패!");
			}
		});
	}
</script>
</html>