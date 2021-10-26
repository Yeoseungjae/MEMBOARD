<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:if test="${sessionScope.loginId ne 'admin'}">
		<script>
			alert('관리자로 로그인 해주세요.');
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
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3" style="text-align: center;">회원목록</h1>

					<div class="row">
						<div >
							<div class="card">

								<table class="table table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>프로필사진</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${memberList}">
											<tr>
												<td><a href="M_view?MId=${list.MId}&page=${paging.page}">${list.MId}</a></td>
												<td>${list.MName}</td>
												<td><img src="resources/profile/${list.MProfileName}" width="70px"></td>
												<c:choose>
													<c:when test="${list.MId eq sessionScope.loginId || sessionScope.loginId eq 'admin'}">
														<td>
															<a href="M_modiForm?MId=${list.MId}&page=${page}"><i class="align-middle" data-feather="edit-2"></i></a> 
															<a href="M_delete?MId=${lsit.MId}&page=${page}"><i class="align-middle" data-feather="trash"></i></a>
														</td>
													</c:when>
													
													<c:otherwise>
														<td>
															<a data-toggle="modal" data-target="#sizedModalSm"><i class="align-middle" data-feather="edit-2"></i></a> 
															<a data-toggle="modal" data-target="#sizedModalSm"><i class="align-middle" data-feather="trash"></i></a>
															<div class="modal fade" id="sizedModalSm" tabindex="-1" aria-hidden="true" style="display: none;">
																<div class="modal-dialog modal-sm" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">본인 확인</h5>
																			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      														<span aria-hidden="true">×</span></button>
																		</div>
																		<div class="modal-body m-3">
																			<p class="mb-0">본인 외에 수정 & 삭제가 불가능 합니다</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																		</div>
																	</div>
																</div>
															</div>												
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="6" style="text-align:center;">
												<!-- 페이징 처리 -->
	<!-- [이전] 페이지 처리 : 현재 페이지에서 -1 페이지 -->
	<c:if test="${paging.page<=1}">[이전]</c:if>
	<c:if test="${paging.page>1}">
		<a href="M_list?page=${paging.page-1}">[이전]</a>
	</c:if>

	<!-- [현재(숫자)]페이지 처리 -->
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
		<c:choose>
			<c:when test="${paging.page eq i}">${i}</c:when>
			<c:otherwise>
				<a href="M_list?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- [다음] 페이지 처리 : 현재 페이지에서 +1 페이지 -->
	<c:if test="${paging.page>=paging.maxPage}">[다음]</c:if>
	<c:if test="${paging.page < paging.maxPage}">
		<a href="M_list?page=${paging.page+1}">[다음]</a>
	</c:if>


											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>
			</main>

			
		</div>
	</div>

	<script src="resources/js/app.js"></script>
	<script>
		
	</script>

</body>

</html>