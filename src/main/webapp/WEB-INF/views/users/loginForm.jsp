<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="/resources/img/favicon.png" type="image/png">
<title>MeetMe Personal</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet"
	href="/resources/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="/resources/vendors/animate-css/animate.css">
<link rel="stylesheet"
	href="/resources/vendors/popup/magnific-popup.css">
<link rel="stylesheet" href="/resources/vendors/flaticon/flaticon.css">
<!-- main css -->
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/responsive.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<!--================Home Banner Area =================-->

	<!--================End Home Banner Area =================-->

	<br>
	<br>
	<br>
	<br>
	<!--================Home Banner Area =================-->
	<section class="profile_area">
		<div class="container">

			<form class="form-horizontal" action="/practice/login.do"
				name="check">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">이메일:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Enter email">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">비밀번호:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pwd" name="pwd"
							placeholder="Enter password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox"> Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10" style="float: left">
						<button type="submit" onclick="checkForm(event);"
							class="btn btn-default">로그인</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<div align="center">
		<button type="submit" onclick="join();" class="btn btn-default">회원가입</button>
	</div>
	<!--================End Home Banner Area =================-->

	<!--================Welcome Area =================-->
	<!--================End Welcome Area =================-->

	<!--================Testimonials Area =================-->
	<!--================End Testimonials Area =================-->

	<!--================Footer Area =================-->
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function join() {
		console.log("Ddd");
		location.href = "/practices/join.do";
	}

	function checkForm(event) {
        event.preventDefault();
		var frmLogin = document.check;
		var email = frmLogin.email.value;
		var password = frmLogin.pwd.value;
		
        var form = $('#check')[0];
        var data = new FormData(form);
           $.ajax({
            type: "POST",
            url: "/practices/login.do",
            data: data,
            dataType: "text",
            success: function (data) {
            	alert("complete");
                $("#btnSubmit").prop("disabled", false);
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("fail");
            }
        });

		

	}
	
</script>

</html>
