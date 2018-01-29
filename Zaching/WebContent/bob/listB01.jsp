<div class="row">
	<c:if test="${empty list}">
		목록이 없습니다. <br>
		방만들기를 통해 친구를 만들어보세요.
	</c:if>
	<c:forEach var="bob" items="${list}">
	  <input type="hidden" name="bobId" value="${bob.bobId}">
	  <input type="hidden" name="category" value="${bob.category}">
	  <div class="col-sm-6 col-md-4 text-center">
	    <div class="thumbnail">
	      <div style="position:absolute; font-weight: bold; font-size: 22px; top:20px; right: 40px;">1/5 명</div>
	      <img src="../resources/images/sample_bob_background.jpg" style="cursor: pointer;">
	      <div class="user_thumnail" style="background: url(../resources/images/sample_bob_background.jpg) center center no-repeat;">
	      	<div style="position:relative; top:-60px; font-size:25px;">${bob.title}</div>				      	
	      </div>
	      <div class="caption" style="position:relative; top:-20px; font-size: 20px;">
	        <p>${bob.locationName}, ${bob.appointmentTime}</p>
	      </div>
	    </div>
	  </div>
	</c:forEach>
</div>