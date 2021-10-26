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
	<c:if test="${sessionScope.loginId==null}">
		<script>
			alert('로그인 후 이용하세요.');
			location.href = "M_loginForm";
		</script>
	</c:if>
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
				

					<h1 class="h3 mb-3" style="text-align : center;">게시글 작성</h1>
					<div class="row">
						<div class="col-12 col-xl-6" style="margin:0 auto;">
							<div class="card">
								
								<div class="card-body">
									<form action="B_write" method="POST" enctype="multipart/form-data">

										<div class="mb-3">
											<label class="form-label" >작성자</label><br/>
											<label class="form-label" style="font-weight : bold;">${sessionScope.loginId}</label> 
											<input type="hidden" name="BWriter" value="${sessionScope.loginId}">
										</div>
										<div class="mb-3">
											<label class="form-label">제목</label> 
											<input type="text" class="form-control" name="BTitle" placeholder="bTitle(제목)">
										</div>
										<div class="mb-3">
											<label class="form-label">내용</label>
											<textarea class="form-control" placeholder="Textarea" rows="10" name="BContent"></textarea>
										</div>
										<div class="mb-3">
											<label class="form-label w-100">첨부파일</label> 
											<input type="file" name="BFile">
										</div>

										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>
							</div>
						</div>

					</div>

				</div>
			</main>
		</div>
	</div>

	<script src="resources/js/app.js"></script>

</body>

</html>