<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<jsp:include page="/WEB-INF/views/header/header.jsp" />
<body>

	<div class="container">
	   <h1 style="text-align:center">공부자료</h1>
		<div class="row">
			<div class="col-lg-12">
				<div id="board">
<!-- 					<table class="table table-hover" id="list">
					</table> -->
					
				</div>
				 <!-- 페이징 -->
					<div id="paging" align="center"></div>
					
				<div align="center">
				 <button class="btn btn-default" onclick="writeBoard();">글쓰기</button>
				</div>	
					
			</div>
		</div>
	<hr>
	</div>
	<br>
	<br><br>
	
	<div class="container">
	   <h style="text-align:center"></h>
	  <div class="row" id="medioArea">
	        <div class="col-lg-6">
	        asdasdsad
	        </div>
	        <div class="col-lg-6">
	          sadsada
	        </div>
	  </div>
	</div>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function () { //최초에 페이지이동 후 문서가 로드되었을때 한번 실행
	paging(1,6);
	
});

function paging(nowPage,cntPerPage){        //현재페이지 , 페이지당 보여줄 row 개수
  $.ajax({
    	type:"get",
    	url:"/practices/paging.do",
    	dataType:"json",
    	data:{nowPage:nowPage,cntPerPage:cntPerPage},
    	success:function(data){
    		console.log(data);
    		
    		var pagingView="";
    		
    		  if(data.startPage !=1){
    			  pagingView +="<a href='#' onclick='return paging("+(data.startPage -1)+","+data.cntPerPage+");'>&lt;</a>";
    		  } 
    		  for(var i =data.startPage; i<=data.endPage;i++){
    			  if(i ==data.nowPage ){
    				  pagingView +="<a style='color:red' href='#'>"+i+"</a>";
    			  }else if(i !=data.nowPage){
    				  pagingView +="<a href='#' onclick='return paging("+i+","+data.cntPerPage+");'>"+i+"</a>";
    			  }
    		  }
    		  if(data.endPage != data.lastPage){
    			  pagingView +="<a href='#' onclick='return paging("+(data.endPage +1)+","+data.cntPerPage+");'>&gt;</a>";
    		  }

    		var pagingDiv =$("#paging");	
    		pagingDiv.html(pagingView);
    		
    		
    	 	$.ajax({
    	    	type:"get",
    	    	url:"/practices/pagingValues.do",
    	    	dataType:"json",
    	    	data:{start:data.start,end:data.end},       //시작 번호와 끝값만 다시 보내주고 값을 가져옴 start,end
    	    	success:function(data){
    	    		console.log(data);
    	    		
     	    		var table="";
     	    		table += "<table class='table table-hover'>";
     	    		table += "<tr>";
     	    		table += "<th>글번호</th>";
     	    		table += "<th>제목</th>";
     	    		table += "<th>작성자</th>";
     	    		table += "<th>작성일</th>";
     	    		table += "<th>분류</th>";
     	    		table += "<th>조회수</th>";
     	    		table += "</tr>";
     	    		
    	    		
    	    		if(data.length ==0){  //게시물이 없다면
    	    			table +="<tr>";
    	    			table +="<th style='text-align:center' colspan='6'>등록된 게시물이 없습니다.</td>";
    	    			table +="</tr>";
    	    		}else{
    	    			
    	    		for(var i in data){
    	    			table +="<tr>";
    	    			table += "<td>"+data[i].RN+"</td>";
    	    			table += "<td><a href='/practices/boardDetail.do?boardNum="+data[i].BOARDNUM+"'>"+data[i].TITLE+"</a></td>";
    	    			table += "<td>"+data[i].NAME+"</td>";
    	    			table += "<td>"+data[i].UPDATED+"</td>";
    	    			if(data[i].BOARDTYPE==1){
    	    				table += "<td>자바</td>";	
    	    			}
    	    			table += "<td>"+data[i].CNT+"</td>";
    	    			table +="</tr>";
    	    		}
    	    		}
    	    		table += "</table>";
    	    	
    	    		$("#board").html(table);
    	    		
    	    	}
    	    }); 
    	},
 
    });
}  

function writeBoard(){
	
	var email = "${email}";  //세션에 저장되어있다면 로그인한 것이니까 선언하여 값 체크 후 페이지 이동
	if(email==null||email==""){
		alert("로그인 후 이용 가능합니다");
	}else{
	    location.href="/practices/write.do";
	}
}

</script>
</html>