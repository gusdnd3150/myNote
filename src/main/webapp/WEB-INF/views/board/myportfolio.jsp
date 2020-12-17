<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<!-- Required meta tags -->
<script src="/resources/ckeditor/ckeditor.js"></script>
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

<!-- 페이징을 위한 선언 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.pagination {
	display: inline-block;
	text-align: center;
}

.pagination>li>a {
	float: none;
}
</style>
</head>

<jsp:include page="/WEB-INF/views/header/header.jsp" />
<section class="banner_area"></section>
<body>

	<!-- 게시판 리스트 -->
	<div class="container">
		<h1 style="text-align: center">공부자료</h1>
		<div class="row">
			<div class="col-lg-12">
				<div id="board">
					<!-- 					<table class="table table-hover" id="list">
					</table> -->

				</div>
				<!-- 페이징 -->
				<div id="paging" align="center"></div>

				<div align="center">
					<button class="btn btn-default btn-lg" style="font-size: medium;"
						onclick="writeBoard();">글쓰기</button>
				</div>

			</div>
		</div>
		<hr>
	</div>
	<br>
	<br>
	<br>

	<!-- 게시판 디테일 -->
	<div class="container" id="detailContainer"
		style="border-style: groove; border-top-width: thin; border-bottom-width: thin; border-left-width: thin; border-right-width: thin; display: none">
		<div class="row">
			<button class="btn-warning" style="margin: 20px;" onclick="fold()">접기</button>

			<!-- 게시글 -->
			<div class="col-lg-12" id="boardDetail"
				style="padding: 90px; padding-bottom: 10px;"></div>

			<!-- 댓글 -->
			<div class="col-lg-12" style="padding: 90px; padding-top: 0px;">
				<h2>댓글</h2>
				<div style="background-color: #e9e9e9; padding: 20px;"
					id="afterList"></div>
				<hr>
				<!-- 댓글 등록 버튼 -->
				<div id="commentButton"></div>
			</div>

		</div>
	</div>



	<!-- 기타 자료 -->
	<div class="container">
		<h style="text-align:center"></h>
		<div class="row" id="medioArea">
			<div class="col-lg-6">asdasdsad</div>
			<div class="col-lg-6">sadsada</div>
		</div>
	</div>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() { //최초에 페이지이동 후 문서가 로드되었을때 한번 실행
		paging(1, 6);

	});

	function addComment(boardNum) { //댓글등록
		var content = $("#commentContent").val();
		var email = "${email}";

		if (email == null | email == "") {
			alert("로그인 후 이용 가능합니다.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/practices/addComment.do",
			data : {
				boardNum : boardNum,
				content : content
			},
			dataType : "text",
			success : function(responseData, status, xhr) {
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	}

	function fold() {
		$("#detailContainer").slideUp();
	}

	function paging(nowPage, cntPerPage) { //현재페이지 , 페이지당 보여줄 row 개수
		$
				.ajax({
					type : "get",
					url : "/practices/paging.do",
					dataType : "json",
					data : {
						nowPage : nowPage,
						cntPerPage : cntPerPage
					},
					success : function(data) {
						console.log(data);

						var pagingView = "";
						pagingView += "<ul class='pagination' style='inline-block:none'>";

						if (data.startPage != 1) {
							pagingView += "<li><a href='#' onclick='return paging("
									+ (data.startPage - 1)
									+ ","
									+ data.cntPerPage + ");'>&lt;</a></li>";
						}

						for (var i = data.startPage; i <= data.endPage; i++) {
							if (i == data.nowPage) {
								pagingView += "<li><a style='color:red' href='#'>"
										+ i + "</a></li>";
							} else if (i != data.nowPage) {
								pagingView += "<li><a href='#' onclick='return paging("
										+ i
										+ ","
										+ data.cntPerPage
										+ ");'>"
										+ i + "</a></li>";
							}
						}

						if (data.endPage != data.lastPage) {
							pagingView += "<li><a href='#' onclick='return paging("
									+ (data.endPage + 1)
									+ ","
									+ data.cntPerPage + ");'>&gt;</a></li>";
						}

						pagingView += "</ul>";

						var pagingDiv = $("#paging");
						pagingDiv.html(pagingView);

						$
								.ajax({
									type : "get",
									url : "/practices/pagingValues.do",
									dataType : "json",
									data : {
										start : data.start,
										end : data.end
									}, //시작 번호와 끝값만 다시 보내주고 값을 가져옴 start,end
									success : function(data) {
										console.log(data);

										var table = "";
										table += "<table class='table table-hover'>";
										table += "<tr>";
										table += "<th>글번호</th>";
										table += "<th>제목</th>";
										table += "<th>작성자</th>";
										table += "<th>작성일</th>";
										table += "<th>분류</th>";
										table += "<th>조회수</th>";
										table += "</tr>";

										if (data.length == 0) { //게시물이 없다면
											table += "<tr>";
											table += "<th style='text-align:center' colspan='6'>등록된 게시물이 없습니다.</td>";
											table += "</tr>";
										} else {

											for ( var i in data) {
												table += "<tr>";
												table += "<td>" + data[i].RN
														+ "</td>";
												/* table += "<td><a href='/practices/boardDetail.do?boardNum="+data[i].BOARDNUM+"'>"+data[i].TITLE+"</a></td>"; */
												if(data[i].COUNT>0){
												table += "<td><a href='#' onclick='return showBoard("+data[i].BOARDNUM+ ");'>"+data[i].TITLE+"["+data[i].COUNT+"]</a></td>";
												}else{
													table += "<td><a href='#' onclick='return showBoard("+data[i].BOARDNUM+ ");'>"+data[i].TITLE+ "</a></td>";
												}
												table += "<td>" + data[i].NAME
														+ "</td>";
												table += "<td>"
														+ data[i].UPDATED
														+ "</td>";
												if (data[i].BOARDTYPE == 1) {
													table += "<td>자바</td>";
												} else if (data[i].BOARDTYPE == 2) {
													table += "<td>스프링</td>";
												} else if (data[i].BOARDTYPE == 3) {
													table += "<td>기타</td>";
												}
												if (data[i].CNT == null) {
													table += "<td>0</td>";
												} else {
													table += "<td>"
															+ data[i].CNT
															+ "</td>";
												}
												table += "</tr>";
											}
										}
										table += "</table>";

										$("#board").html(table);

									}
								});
					},

				});
	}

	function showCK() { ///ck에디터 적용 함수
		CKEDITOR.replace('content', {
			width : 900,
			height : 600
		});
	}

	function writeBoard() {
		var email = "${email}"; //세션에 저장되어있다면 로그인한 것이니까 선언하여 값 체크 후 페이지 이동
		if (email == null || email == "") {
			alert("로그인 후 이용 가능합니다");
		} else {
			location.href = "/practices/write.do";
		}
	}

	function showBoard(boardNum) { //게시판 디테일
		$
				.ajax({
					type : "get",
					url : "/practices/boardDetail.do",
					data : {
						boardNum : boardNum
					},
					dataType : "json",
					success : function(responseData) {
						console.log(responseData);

						var boardDetail = $("#boardDetail"); //div테그
						var detailContainer = $("#detailContainer");
						var outPut = "";

						outPut += "";
					
						outPut += "<h1 >" + responseData.detail[0].TITLE+"</h1>";	
						outPut += "<br>";
						outPut += "<div class='media'>";
						outPut += "<div class='media-left'>";
						outPut += "<img src='/resources/userBasic.jpg' class='media-object' style='width: 60px'>";
						outPut += "</div>";
						outPut += "<div class='media-body'>";
						outPut += "<h4 class='media-heading'>"
								+ responseData.detail[0].ID + "</h4>";
						outPut += "<p>날짜 " + responseData.detail[0].UPDATED
								+ " 조회수:" + responseData.detail[0].CNT
								+ "  </p>";
						outPut += "</div>";
						outPut += "</div>";
						outPut += "<hr>";
						outPut += "<textarea id='content'>"
								+ responseData.detail[0].CONTENT
								+ "</textarea>";
						outPut += "<br>";
						outPut += "<hr>";
						outPut += "";
						outPut += "";

						boardDetail.empty(); //기존에 div안에 테그들이 있다면 없앤 후
						boardDetail.append(outPut); // append로 테그를 추가
						showCK(); // ck에디터 적용 함수
						detailContainer.slideDown(); // 숨김처리로 된 div를 노출시킴
						showAfter(boardNum);
					},
					error : function(xhr) {
						console.log(xhr);
					}
				});

	}

	function showAfter(boardNum) { //댓글 보여주기 함수
		$
				.ajax({
					type : "get",
					url : "/practices/afterList.do",
					data : {
						boardNum : boardNum
					},
					dataType : "json",
					success : function(data, status, xhr) {
						console.log("댓글리스트:"+data);
						var afterList = $("#afterList");
						var afterPut = "";
						
						if (data.length == 0) {
							afterPut += "<div class='media'>";
							afterPut += "<div class='media-left'>";
							afterPut += "<p>댓글이 없습니다.</p>";
							afterPut += "</div></div>";
						} else {

							for ( var i in data) {
								if (data[i].LEV == 1) { //원글이면
									afterPut += "<div class='media'>";
								} else if (data[i].LEV == 2) { // 댓글이면 padding으로 구분지었다
									afterPut += "<div class='media'  style='padding-left:50px'>";
								} else if (data[i].LEV == 3) { //대댓글이면
									afterPut += "<div class='media'  style='padding-left:100px'>";
								}
								afterPut += "<div class='media-left'>";
								if (data[i].PROFILEIMAGE == null) { //프로필사진이 없으면
									afterPut += "<img src='/resources/userBasic.jpg' class='media-object' style='width:45px'>";
								} else {
									afterPut += "<img src='/resources/"+data[i].PROFILEIMAGE+"' class='media-object' style='width:45px'>";
								}
								afterPut += "</div>";
								afterPut += "<div class='media-body'>";
								afterPut += "<h4 class='media-heading'>"
										+ data[i].ID + "<small><i>"
										+ data[i].UPDATED
										+ "</i></small></h4>";
								afterPut += "<p>" + data[i].CONTENT
										+ "</p>";
								afterPut += "</div>";
								afterPut += "</div>";
							}
						}
						afterList.html(afterPut);

						var commentButton = $("#commentButton");

						commentButton
								.html("<div class='input-group'>"
										+ "<textarea placeholder='로그인 후 이용 가능합니다.' id='commentContent' class='form-control custom-control' rows='3' style='resize:none'></textarea>"
										+ "<span style='width:89px;font-size: 25px;' class='input-group-addon btn btn-primary' onclick='addComment("
										+ data[0].BOARDNUM
										+ ")'>등록</span>" + "</div>");
					},
					error : function(xhr, status, error) {
					}
				});

	}
</script>
</html>