<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="스프링 회원제 게시판">
<meta name="author" content="MR.YEO">
<meta name="keywords" content=" BOOTSTRAP MEMBER, BOARD, MEMBOARD">

<link rel="shortcut icon" href="resources/img/icons/icon-48x48.png" />
<title>MemBoard_Write</title>
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
				<div class="container-fluid p-0">
					<h1 class="h3 mb-3" style="text-align : center;">회원가입</h1>

					<div class="row">
						<div class="col-12 col-xl-6" style="margin:0 auto;">
							<div class="card">

								<div class="card-body">
						<form action="M_join" method="POST" enctype="multipart/form-data" id="joinForm">
							<div class="mb-3">
								<label class="form-label">아이디</label>&emsp;&emsp;&emsp;&nbsp;
								<input type="text" name="MId" id="MId" onkeyup="idOverlap()">
								<br/><span id="confirmId"></span>
							</div>
							<div class="mb-3">
								<label class="form-label">비밀번호</label> &emsp;&emsp;&nbsp;
								<input type="password"  name="MPw" id="MPw" onkeyup="pwRegExp()">
								<br/><span id="pwRegExp"></span>
							</div>
							<div class="mb-3">
								<label class="form-label">패스워드 확인</label>&nbsp;
								<input type="password" id="checkPw" onkeyup="pwOverlap()">
								<br/><span id="confirmPw"></span>
							</div>
							<div class="mb-3">
								<label class="form-label">이름</label>&emsp;&emsp;&emsp;&emsp;
								<input type="text" name="MName">
							</div>
							<div class="mb-3">
								<label class="form-label">연락처</label>&emsp;&emsp;&emsp;&nbsp;
								<input type="text" name="MPhone">
							</div>
							<div class="mb-3">
								<label class="form-label">생년월일</label>&emsp;&emsp;
								<input type="date" name="MBirth">
							</div>
							<div class="mb-3">
								<label class="form-label">이메일</label>
								<input type="email" name="MEmail" id="MEmail">
								<span id="emailConfirmText"><input type="button" value="인증" onclick="confirmEmail()"></span>
							</div>
							<div class="mb-3">
								<label class="form-label">주소</label>
								<input type="text" id="sample6_postcode" placeholder="우편번호" name="addr1">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								&emsp;&emsp;&nbsp;<input type="text" id="sample6_address" placeholder="주소" name="addr2"><br>
								&emsp;&emsp;&nbsp;<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3">
							</div>
							<div class="mb-3">
								<label class="form-label w-100">프로필사진</label> 
								<input type="file" name="MProfile">
								<small class="form-text text-muted">10MB 이하</small>
							</div>
							<input type="button" class="btn btn-primary" value="가입" onclick="mJoin()"> 
							<input type="reset"  class="btn btn-secondary" value="다시작성">
						</form>
					</div>
				</div>
			</div>
			</div>
			</div>
			</main>
			</div>
			</div>
</body>
<script src="resources/js/app.js"></script>
<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">

	// 아이디 중복체크
	function idOverlap(){
		let idCheck = document.getElementById("MId").value;
		let confirmId = document.getElementById("confirmId");
		let idPass = false;
		
		$.ajax({
			type : "POST" ,
			url : "A_idoverlap" ,
			data : { "MId" : idCheck } ,
			async : false,
			datatype : "text" ,
			success : function(data) {
				if(data=="OK"){
					confirmId.style.color="#0000ff";
					confirmId.innerHTML = "사용 가능한 아이디";
					idPass = true;
				} else {
					confirmId.style.color="#ff0000";
					confirmId.innerHTML = "사용 불가능한 아이디";
					idPass = false;
				}
			},
			error : function(){
				alert("idOverlap함수 통신실패!")
			}
		});
		
		return idPass;
	}
	
	// 비밀번호 정규식
	function pwRegExp(){
		let MPw = document.getElementById("MPw").value;
		let pwRegExp = document.getElementById("pwRegExp");
		let pwPass = false;
		
		let num = MPw.search(/[0-9]/g);
		let eng = MPw.search(/[a-z]/ig);
		let spe = MPw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);
		
		if(MPw.length < 8 || MPw.length > 15) {
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "8자리 ~ 15자리 이내로 입력하세요!";
		} else if(MPw.search(/\s/) != -1) {
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "비밀번호는 공백없이 입력하세요!";
		} else if(num < 0 || eng < 0 || spe < 0) {
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력하세요!";
		} else {
			pwRegExp.style.color="#0000ff";
			pwRegExp.innerHTML = "적절한 비밀번호 입니다!";
			pwPass = true;
		}
		
		return pwPass;
	}
	
	// 비밀번호 일치여부 확인
	function pwOverlap() {
		let MPw = document.getElementById("MPw").value;
		let pwRegExp = document.getElementById("pwRegExp");
		
		let checkPw = document.getElementById("checkPw").value;
		let confirmPw = document.getElementById("confirmPw");
		
		let pwPass = false;
		
		pwRegExp.innerHTML = "";
		
		if(MPw == checkPw) {
			confirmPw.style.color="#0000ff";
			confirmPw.innerHTML = "비밀번호가 일치합니다!";
			pwPass = true;
		} else {
			confirmPw.style.color="#ff0000";
			confirmPw.innerHTML = "비밀번호가 일치하지 않습니다!";
		}
		return pwPass;
	}
	
	// 이메일 인증
	function confirmEmail() {
		let MEmail = document.getElementById("MEmail").value;
		let emailConfirmText = document.getElementById("emailConfirmText");
		
		
		$.ajax({
			type : "GET" ,
			url : "A_emailConfirm" ,
			data : {"MEmail" : MEmail} ,
			dataType : "text" ,
			success : function(data){
				alert("입력하신 이메일로 인증번호가 발송됐습니다!");
				emailConfirmText.innerHTML = "<input type='hidden' id='check2' value='"+ data +"'>"
											+ "<br/><input type='text' placeholder='인증번호 입력' id='emailKey'>"
											+ " <input type='button' value='확인' onclick='keyCheck()'>"
											+ "<br/><span id='check1'></span>";
			} ,
			error : function() {
				alert("인증번호 발송에 실패했습니다!");
			}
		});
	}
	
	// 인증번호 확인
	function keyCheck() {
		let emailKey = document.getElementById("emailKey").value;
		let check2 = document.getElementById("check2").value;
		let check1 = document.getElementById("check1");
		let emailPass = false;
		
		if(emailKey==check2) {
			check1.style.color="#0000ff";
			check1.innerHTML = "인증번호가 일치합니다!";
			emailPass = true;
		} else {
			check1.style.color="#ff0000";
			check1.innerHTML = "인증번호가 일치하지 않습니다!";
		}
		return emailPass;
	}
	
	// 회원가입 버튼
	function mJoin() {
		console.log("아이디 체크 : " + idOverlap());
		console.log("비밀번호 체크1 : " + pwRegExp());
		console.log("비밀번호 체크2 : " + pwOverlap());
		console.log("이메일 체크 : " + keyCheck());
		
		if(!idOverlap()) {
			alert("아이디 중복체크를 진행해주세요.");
		} else if(!pwRegExp()) {
			alert("비밀번호 규칙에 맞게 입력해주세요.");
		} else if(!pwOverlap()) {
			alert("비밀번호가 일치하지 않습니다.");
		} else if(!keyCheck()) {
			alert("이메일 인증을 진행해주세요.");
		} else {
			joinForm.submit();
		}
	}
	
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
</script>
</html>