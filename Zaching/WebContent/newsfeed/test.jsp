<html>
<head>
	<style type="text/css">
		ul{list-style:none;list-style:none;font-family:"Malgun Gothic", "Georgia", "Arial", "Sans-serif"}
		.masonry{width:400px;padding:0px;font-size:0px;display:inline-block;}
		.masonry .item{
			display:block;border:1px solid #ffffff;min-height:50px;box-sizing:border-box;
			background:#1fa98d;font-size:30px;color:#ffffff;text-align:center;
		}
		.masonry .item.new{background:#fb9b33;}
		.masonry .w100{width:100px;}
		.masonry .w200{width:200px;}
 
		.form{display:inline-block;vertical-align:top;margin:0px;width:310px;font-size:0px;}
		.howto{margin-bottom:5px;}
		.howto select{width:305px;height:50px;vertical-align:top;text-align:center;font-size:15px;}
 
		.btn{}
		.btn button{width:150px;height:50px;margin:0px 5px 5px 0px;}
 
		
	</style>
	<script type="text/javascript" src="http://cdn.dontorz.com/js/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
	<script type="text/javascript">
		function newItem(){
			var option = {'width' : ['w100', 'w200'], 'height' : ['50px', '100px', '150px', '200px']};
			var i = {'w' : Math.floor((Math.random() * (2 - 1 + 1)) + 1) - 1, 'h' : Math.floor((Math.random() * (4 - 1 + 1)) + 1) - 1};
			var $item = $('<li>', {'class' : 'item new '+option['width'][i['w']]}).css('height', option['height'][i['h']]);
			return $item.get(0);
		}
 
		$(function(){
			$masonry = $(".masonry").masonry({
				itemSelector	: ".item",
				columnWidth	: 100
			});
 
			$('.btn button').bind('click', function(){
				var items = [];
				var howto = $("select[name='howto']").val() ? $("select[name='howto']").val() : 1;
 
				switch($(this).attr('class')){
					case 'btn1' : case 'btn2' : case 'btn3' :
						while(howto >= 1){
							/*
							새로 추가되는 엘리먼트는 자바스크립트 엘리먼트의 배열집합
							*/
							items.push(newItem());
							howto--;
						}
						break;
					case 'btn4' :
						/*
						삭제되는 엘리먼트는 getItemElements 메서드를 이용한 masonry의 엘리먼트 집합중 마지막에서부터 카운트.
						*/
						var elems = $masonry.masonry('getItemElements');
 
						while(howto >= 1){
							if(elems.length > 0)	items.push(elems.pop());
							howto--;
						}
						break;
				}
 
				switch($(this).attr('class')){
					/*
					appended
					masonry 영역에 jQuery append로 엘리먼트를 우선 삽입한 후
					masonry appended 메서드를 실행하여 정렬을 실행한다.
					*/
					case 'btn1' :
						$masonry.append(items).masonry('appended', items);
						break;
					/*
					prepended
					masonry 영역에 jQuery prepend로 엘리먼트를 우선 삽입한 후
					masonry prepended 메서드를 실행하여 정렬을 실행한다.
					*/
					case 'btn2' :
						$masonry.prepend(items).masonry('prepended', items);
						break;
					/*
					addItems
					masonry 영역에 jQuery append나 prepend로 엘리먼트를 우선 삽입한 후
					masonry addItems 메서드를 실행하여 masonry에 아이템을 추가한다.
					그후 layout 메서드를 실행하여 레이아웃을 정렬한다.
					*/
					case 'btn3' :		// 
						$masonry.append(items).masonry('addItems', items);
						$masonry.masonry('layout');
						break;
					/*
					remove
					remove의 경우 엘리먼트를 선제거 할 필요없이
					바로 remove 메서드를 사용하여 해당 엘리먼트를 삭제한다.
					그 후 layout 메서드를 실행하여 레이아웃을 정렬한다.
					*/
					case 'btn4' :		// remove
						$masonry.masonry('remove', items);
						$masonry.masonry('layout');
						break;
				}
			});
		});
	</script>
</head>
<body>
	<ul class="masonry">
		<li class="item w100" style="height:100px">1</li>
		<li class="item w200" style="height:150px">2</li>
		<li class="item w100" style="height:100px">3</li>
		<li class="item w100" style="height:200px">4</li>
		<li class="item w100" style="height:50px">5</li>
		<li class="item w200" style="height:200px">6</li>
		<li class="item w100" style="height:150px">7</li>
		<li class="item w100" style="height:100px">8</li>
		<li class="item w200" style="height:50px">9</li>
		<li class="item w100" style="height:100px">10</li>
	</ul>
 
	<div class="form">
		<p class="howto">
			<select name="howto">
				<option value="1">ITEM COUNT - 1 Block</option>
				<option value="2">ITEM COUNT - 2 Block</option>
				<option value="3">ITEM COUNT - 3 Block</option>
			</select>
		</p>
		<p class="btn">
			<button type="button" class="btn1">appended</button>
			<button type="button" class="btn2">prepended</button>
			<button type="button" class="btn3">addItems</button>
			<button type="button" class="btn4">remove</button>
		</p>
	</div>
</body>
</html>