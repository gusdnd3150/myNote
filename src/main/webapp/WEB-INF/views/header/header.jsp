<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="/resources/img/favicon.png" type="image/png">
        <title>MeetMe Personal</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="/resources/css/bootstrap.css">
        <link rel="stylesheet" href="/resources/vendors/linericon/style.css">
        <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="/resources/vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="/resources/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="/resources/vendors/animate-css/animate.css">
        <link rel="stylesheet" href="/resources/vendors/popup/magnific-popup.css">
        <link rel="stylesheet" href="/resources/vendors/flaticon/flaticon.css">
        <!-- main css -->
        <link rel="stylesheet" href="/resources/css/style.css">
        <link rel="stylesheet" href="/resources/css/responsive.css">

<title>Insert title here</title>
</head>

<script>

function checkOut(){
	var check= window.confirm("로그아웃 하시겠습니까?");
	if(check==true){
		location.href="/practices/logOut.do";
	}
}
</script>
<body>
       <header class="header_area">
            <div class="main_menu">
            	<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620">
						<!-- Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="/practices/main.do"><img src="/resources/img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="/practices/main.do">Home</a></li> 
								<li class="nav-item"><a class="nav-link" href="/practices/about.do">About</a></li> 
								<li class="nav-item"><a class="nav-link" href="/practices/portfolio.do">Portfolio</a></li>
							
								<li class="nav-item"><a class="nav-link" href="/practices/board.do">MySkill</a></li>
							
								<li class="nav-item"><a class="nav-link" href="/practices/contact.do">Contact</a></li>
								
								<c:if test="${email ne null }">
								<!-- <li class="nav-item"><a class="nav-link" href="/practices/logOut.do">로그아웃</a></li> -->
								<li class="nav-item"><a class="nav-link" href="javascript:void(0);" onclick="checkOut();">로그아웃</a></li>  
								</c:if>
								<c:if test="${email eq null }">
								<li class="nav-item"><a class="nav-link" href="/practices/loginForm.do">로그인</a></li> 
								</c:if>
								
							</ul>
						</div> 
					</div>
            	</nav>
            </div>
        </header>
        
       <!--   <section class="banner_area">
	     </section>  -->

</body>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
</html>