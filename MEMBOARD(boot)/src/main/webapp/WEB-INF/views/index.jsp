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

				<c:choose>
				<c:when test="${sessionScope.loginId != null}">
							<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
												
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown"> 
							<i class="align-middle" data-feather="settings"></i></a> 
							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown"> 
							<img src="resources/profile/${sessionScope.profile}" class="avatar img-fluid rounded mr-1" alt="MProfile" /> 
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
				<!-- index_main -->
				<div class="container-fluid p-0" style="text-align:center;">
					<c:choose>
						<c:when test="${sessionScope.loginId eq 'admin'}">
							<img src="resources/profile/${sessionScope.profile}" alt="main" width="30%" style="margin: 10 auto"><br/><br/>
							<button class="btn btn-primary" style="font-size:50px; margin-right: 20px;" onclick="location.href='M_list'">회원목록</button><br/><br/>
							<button class="btn btn-warning" style="font-size:50px; margin-right: 20px;" onclick="location.href='B_list'">게시글목록</button><br/><br/>
							<button class="btn btn-success" style="font-size:50px; margin-right: 20px;" onclick="location.href='B_writeForm'">게시글작성</button><br/><br/>
							<button class="btn btn-danger" onclick="location.href='M_logout'" style="font-size:50px; margin-right: 20px;">로그아웃</button>
						</c:when>


						<c:when test="${sessionScope.loginId != null}">
							<img src="resources/profile/${sessionScope.profile}" alt="main" width="20%" style="margin: 10 auto"><br/><br/>
							<button class="btn btn-success" style="font-size:50px; margin-right: 20px;" onclick="location.href='B_writeForm'">게시글작성</button><br/><br/>
							<button class="btn btn-warning" style="font-size:50px; margin-right: 20px;" onclick="location.href='B_list'">게시글목록</button><br/><br/>
							<button class="btn btn-primary" style="font-size:50px; margin-right: 20px;" onclick="location.href='M_view?MId=${sessionScope.loginId}'">내정보보기</button><br/><br/>
							<button class="btn btn-danger" onclick="location.href='M_logout'" style="font-size:50px; margin-right: 20px;">로그아웃</button>
						</c:when>

						<c:otherwise>
							<div class="container-fluid p-0">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
							<img src="resources/img/photos/Signiture.png" alt="main" width="30%" style="margin: 10 auto"><br/><br/>
								<h5 class="h3 mb-3">회원제 게시판</h5>
								<h6 class="card-subtitle text-muted">로그인 후 이용가능</h6>
							</div>
							<main class="content">
				<div class="container-fluid p-0" >

					<h1 class="h3 mb-3" style="text-align : center;">로그인</h1>

					<div class="row">


						<div class="col-md-5" style="margin:0 auto;">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="account"
									role="tabpanel">

									<div class="card">
										<form action="M_login" method="POST">
											<div class="card-body">

												<div class="row">
													<div class="col-md-8" >
														<div class="mb-3" >
															<label class="form-label" for="inputUsername" >&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;ID</label>
															<input type="text" class="form-control" name="MId"
																placeholder="UserId" style="width:570px;">
														</div>
														<div class="mb-3">
															<label class="form-label" for="inputUsername" >&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;PASSWORD</label>
															<input type="password" class="form-control" name="MPw"
																placeholder="UserPassword" style="width:570px;">
														</div>
													</div>

												</div>

												<button type="submit" class="btn btn-primary" style="margin:0 auto;">로그인</button>


											</div>
										</form>
										
										<!--  -->
									</div>



								</div>
								<div class="tab-pane fade" id="password" role="tabpanel">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">Password</h5>

											<form>
												<div class="mb-3">
													<label class="form-label" for="inputPasswordCurrent">Current
														password</label> <input type="password" class="form-control"
														id="inputPasswordCurrent"> <small><a
														href="#">Forgot your password?</a></small>
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputPasswordNew">New
														password</label> <input type="password" class="form-control"
														id="inputPasswordNew">
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputPasswordNew2">Verify
														password</label> <input type="password" class="form-control"
														id="inputPasswordNew2">
												</div>
												<button type="submit" class="btn btn-primary">Save
													changes</button>
											</form>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>
						</div>
					</div>
					</div>
						</c:otherwise>

					</c:choose>




				</div>
			</main>

		</div>
	</div>

	<script src="resources/js/app.js"></script>


</body>

</html>