<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>상품등록</title>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">
	function fncAddProduct() {
		//Form 유효성 검증

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var amount = $("input[name='amount']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (amount == null || amount.length < 1) {
			alert("상품개수는 반드시 입력하셔야 합니다.");
			return;
		}

		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/product/addProduct")
				.submit();
	}

	$(function() {

		$(".btn.btn-primary:contains('등 록')").on("click", function() {
			fncAddProduct();
		});

		$(".btn.btn-primary:contains('취 소')").on("click", function() {
			$("form")[0].reset();
		});

		$(".btn.btn-primary:contains('확 인')").on("click", function() {
			self.location = "/product/listProduct?menu=manage";
		});

		$(".btn.btn-primary:contains('추가등록')").on("click", function() {
			self.location = "/product/addProduct";
		});

		$("#calender").on("click",function() {
			//show_calendar('document.detailForm.manuDate', $(
			//		'input[name=manuDate]').val());
		});
		
		$('#manuDate').datepicker({ dateFormat: 'yy-mm-dd' });

	});
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">

		<div class="page-header text-center">
			<h3 class="text-info">상 품 등 록</h3>
		</div>

		<form class="form-horizontal" name="detailForm"
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<c:if test="${empty product}">
						<input type="text" class="form-control" id="prodName"
							name="prodName" value="${product.prodName}"
							placeholder="상품명을 입력하세요." />
					</c:if>
					<c:if test="${!empty product}">
				${product.prodName}
			 </c:if>
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
					<c:if test="${empty product}">
						<input type="text" class="form-control" id="prodDetail"
							name="prodDetail" value="${product.prodDetail}"
							placeholder="상세정보를 입력하세요." />
					</c:if>
					<c:if test="${!empty product}">
				${product.prodDetail}
			 </c:if>
				</div>
			</div>

			<div class="form-group">
				<label for="amount" class="col-sm-offset-1 col-sm-3 control-label">상품개수</label>
				<div class="col-sm-4">
					<c:if test="${empty product}">
						<input type="text" class="form-control" id="amount" name="amount"
							value="${product.amount}" placeholder="상품 개수를 입력하세요." />
					</c:if>
					<c:if test="${!empty product}">
				${product.amount} 개
			 </c:if>
				</div>
			</div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<c:if test="${empty product}">
						<input type="text" class="form-control" id="manuDate" name="manuDate"/>
					</c:if>
					<c:if test="${!empty product}">
						${product.manuDate}
			 		</c:if>
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가격</label>
				<div class="col-sm-4">
					<c:if test="${empty product}">
						<input type="text" class="form-control" id="price" name="price"
							value="${product.price}" placeholder="상품 가격을 입력하세요." />
					</c:if>
					<c:if test="${!empty product}">
				${product.price}
			 </c:if>
				</div>
			</div>

			<div class="form-group">
				<label for="uploadFile"
					class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<c:if test="${empty product}">
						<input type="file" class="form-control" id="uploadFile"
							name="uploadFile" value="${product.fileName}"
							placeholder="상품 가격을 입력하세요." />
					</c:if>
					<c:if test="${!empty product}">
						<img src="/images/uploadFiles/${product.fileName}"
							onerror="this.src='/images/no_image.jpg'" />
					</c:if>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">
						<c:if test="${empty product}">등 록</c:if>
						<c:if test="${!empty product}">확 인</c:if>
					</button>
					<a class="btn btn-primary btn" role="button">
						<c:if test="${empty product}">취 소</c:if>
						<c:if test="${!empty product}">추가등록</c:if>
					</a>
				</div>
			</div>

		</form>

	</div>
</body>
</html>