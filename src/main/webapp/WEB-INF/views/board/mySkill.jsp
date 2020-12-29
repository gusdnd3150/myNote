<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- 이순서가 중요하다고함 문제는 페이징 아이콘이 출력이 되질 않는다 -->
<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/uicss/jquery-ui.css"/>  <!-- css를 따로다운받고 경로를 잡아주었다 -->
<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css"/>
<script src="/resources/jqgrid/js/jquery-1.11.0.min.js"type="text/javascript"></script>
<script src="/resources/jqgrid/js/i18n/grid.locale-kr.js"type="text/javascript"></script>
<script src="/resources/jqgrid/js/jquery.jqGrid.min.js"type="text/javascript"></script>
<meta charset="utf-8" />
</head>
<body>


<%--   css충돌로 인해 적용이 안되는듯 모달로 띄워보자
<jsp:include page="/WEB-INF/views/header/header.jsp" />
 <section class="banner_area">
            <div class="box_1620">
				<div class="banner_inner d-flex align-items-center">
					<div class="container">
						<div class="banner_content text-center">
							<h2>라이브러리 연습</h2>
							
						</div>
					</div>
				</div>
            </div>
        </section> --%>
  
  <div class="container">
<div style="margin-left:20px">
    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
</div>
  </div>
 

    
</body>   
 <script type="text/javascript"> 
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
                mtype: "GET",
                datatype: "json",
                colModel: [
                    { label: '주문ID', name: 'OrderID', key: true, width: 75 },
                    { label: '고객 ID', name: 'CustomerID', width: 150 },
                    { label: '주문날짜', name: 'OrderDate', width: 150,
					formatter : '날짜', formatoptions: { srcformat : 'Y-m-d H:i:s', newformat :'ShortDate'}},
                    { label: '운송', name: 'Freight', width: 150 },
                    { label:'Ship Name', name: 'ShipName', width: 150 }
                ],
				viewrecords: true,
                width: 780,
                height: 250,
                rowNum: 20,
                pager: "#jqGridPager"
            });
        });
   </script>
</html>