

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="https://production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
  <link rel="mask-icon" type="" href="https://production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
  <title>CodePen - InfiniteGrid demo</title>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
  
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootflat/2.0.4/css/bootflat.min.css'>

      <style>
      body {background-color: #f1f2f6;}
.item {
  width:50%;
  min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}
@media (min-width: 768px) {
  .item {
    width : 33.33333333%;
  }
}
@media (min-width: 992px) {
  .item {
    width : 25%;
  }
}
@media (min-width: 1200px) {
  .item {
    width : 33.33333333%;
  }
}
    </style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no" >

  <div class="container">
	<!-- navbar -->
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-3">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">egjs infiniteGrid</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- jumbotron -->
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<div class="jumbotron-contents">
					<h2>InfiniteGrid Demo</h2>
					<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- infinite grid -->
	<div id="grid" class="row" style="visibility:hidden"></div>
</div>
<script id="items-template" type="text/x-handlebars-template">
	{{~#each items~}}
	<div class="item">
		<div class="thumbnail">
			<img class="img-rounded" src="{{imgSrc}}" />
			<div class="caption">
				<p><a href="{{href}}">{{desc}}</a></p>
			</div>
		</div>
	</div>
	{{~/each~}}
</script>
    <script src="//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>

  <script src='https://code.jquery.com/jquery-1.7.0.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.min.js'></script>
<script src='https://naver.github.io/egjs/latest/dist/pkgd/infiniteGrid.pkgd.min.js'></script>

  

    <script>
      var template = Handlebars.compile($("#items-template").html());
		var data = {
			getItems: function(groupNo) {
				groupNo *= 30;
				var items = [];
				for(var i=0; i<30; i++) {if (window.CP.shouldStopExecution(1)){break;}
					items.push(groupNo + i);
				}
		window.CP.exitedLoop(1);
		
				items = $.map(items, function(v) {
					return {
						offset: v,
						imgSrc: "../resources/images/sample_bob_background.jpg",
						href: "https://naver.com/",
						desc: "Cras justo odio..."
					};
				});
				return {items: items};
			}
		};
		
		$(document).ready(function() {
			var $grid = $("#grid");
			var ig = new eg.InfiniteGrid("#grid", {
				count : 60
			}).on({
				"append" : function(e) {
					var gk = this.getGroupKeys();
					var lastGk = gk[gk.length-1];
					lastGk++;
					console.log(gk)
					ig.append(template(data.getItems(lastGk)), lastGk);
				},
				"prepend" : function(e) {
					var firstGk = this.getGroupKeys()[0];
					firstGk--;
					if(firstGk >= 0) {
						ig.prepend(template(data.getItems(firstGk)), firstGk);
					}
				},
				"layoutComplete" : function(e) {
					$grid.css("visibility", "visible");
				}
			});
		
			ig.append(template(data.getItems(0)), 0);
		});
		      //# sourceURL=pen.js
		    </script>



  
  

</body>

</html>
 