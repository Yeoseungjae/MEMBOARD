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
			alert('로그인 후 사용해주세요.');
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
							<img src="./resources/profile/${sessionScope.profile}" class="avatar img-fluid rounded mr-1" alt="MProfile" /> 
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
					<h1 class="h3 mb-3" style="text-align: center;">회원정보</h1>
					
					<div class="row">
						<div class="col-12 col-xl-6" style="margin:0 auto;">
							<div class="card mb-3">
								
								<div class="card-body text-center">
									<img src="resources/profile/${view.MProfileName}" alt="profile" class="img-fluid rounded-circle mb-2" width="128" heigt="128"/>
									<h5 class="card-title mb-0">${view.MId}</h5>
								</div>
								
								
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">About</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home align-middle mr-2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg> ID :  ${view.MId }</li>
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock align-middle mr-2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg> PASSWORD : ${view.MPw}</li>
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock align-middle mr-2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg> NAME : ${view.MName}</li>
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock align-middle mr-2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg> Phone : ${view.MPhone}</li>
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock align-middle mr-2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg> Birth : ${view.MBirth}</li>
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail align-middle mr-2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> e-mail : ${view.MEmail }</li>
										<li class="mb-1"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-aperture align-middle mr-2"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg> 주소 : ${view.MAddr}</li>
										
									</ul>
								</div>
								
								<c:if test="${sessionScope.loginId eq view.MId}">
								<hr class="my-0" />
								<div class="card-body" style="text-align: center;">
									
										<a href="M_modiForm?MId=${view.MId}&page=${page}"><i class="align-middle" data-feather="edit-2"></i> 수정하기 </a> &nbsp; &nbsp; &nbsp; 
										<a href="M_delete?MId=${view.MId}&page=${page}"><i class="align-middle" data-feather="trash"></i> 삭제하기</a>
									
								</div>
								</c:if>
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