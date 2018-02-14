<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="com.zaching.service.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/resources/layout/sub_toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->

        
        <style>
        
        	body {
        		padding-top: 50px;
        	}
        
        
        </style>
        
        </head>
        <body>
        <div class="container">
        
        
        <button type="button" class="btn btn-login btn-lg" data-toggle="modal"
			data-target="#myModal">메세지 보내기</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">

			<div class="modal-dialog modal-center">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<div class=row>
							<h3>메세지보내기</h3>
							<p>
							<div class="row friendName">
								<div class="col-xs-4">
									<label for="inputlg" style="margin-left: 5px">받는사람</label> <input
										type="text" class="form-control" placeholder="받는사람">
										<br>
									<div class="row">
										<div class="col-sm-6">
											<label for="inputlg" style="margin-left: 5px"
												style="margin-top: 5px">메세지내용</label>
											<textarea class="form-control" rows="5"
												style="margin: 0px -521.344px 0px 0px; width: 595px; height: 126px;"></textarea>
												<br>
											<input class="btn btn-default" type="button" align="right"
												value="전송">

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>





















