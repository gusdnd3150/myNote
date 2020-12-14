<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- ckedior 자바스크립트파일 참조 -->
<script src="/resources/ckeditor/ckeditor.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/header/header.jsp" />
<body>


	<div class="container">
		<h2 style="text-align: center">게시글추가</h2>
		<form class="form-horizontal" name="BoardForm" action="/practices/uploadBoard.do" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">제목:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title"
						placeholder="제목">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">게시판유형:</label>
				<div class="col-sm-10">
					<!-- <input type="password" class="form-control" id="pwd" placeholder="Enter password"> -->
					<select name="Boardtype" class="form-control">
						<option value="1">자바</option>
						<option value="2">스프링</option>
						<option value="3">기타</option>
					</select>
				</div>
			</div>
			<div class="form-group" style="padding-left: 205px;">
				<textarea name="content" id="editor1"></textarea>
				<script>
                CKEDITOR.replace( 'editor1',{
                	width:900,
                	height:900
                });
            </script>
			</div>

             <input type="hidden" name="email" value="${email }">

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" align="center">
					<input type="button" onclick="checkForm(event)" 
						class="btn-success" value="글쓰기">
				</div>
			</div>

             <!-- 로그인을 했다면 세션 영역에 값이 있기때문에 가능 -->
		</form>
	</div>

</body>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function checkForm(event){
	event.preventDefault();
	
	var form = document.BoardForm;
	var title= form.title.value; 
	var content = form.Boardtype.value;                //게시판 타입
	var ckContent = CKEDITOR.instances.editor1.getData(); // ck에디터 값
	var email = form.email.value;
	
	if(title==null||title==""){
		alert("제목을 입력해 주세요");
		return
	}else if(ckContent==null||ckContent==""){
		alert("내용을 입력해 주세요");
	}else{
	form.method="post";
	form.action="/practices/uploadBoard.do";
	form.submit();
	}
	
}

</script>
</html>