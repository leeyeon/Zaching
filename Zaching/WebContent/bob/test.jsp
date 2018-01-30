<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
body {
  background-color: #eee;
  height: 100vh;
  margin: 0;
  position: relative;
  overflow: hidden;
}

* {
  box-sizing: border-box;
}

main {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  flex-direction: column;
  user-select: none;
}

#top-bar {
  margin: 10px;
  padding: 10px;
  background-color: white;
  box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);
  min-height: 119px;
}

#drop-panel {
  min-height: 200px;
  background: white;
  padding: 10px;
  margin: 10px;
  box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.3);

  header {
    padding-left: 10px;
    font-size: 12px;
  }
}

.content {
  flex: 1;
}

#scroll-box {
  border: 1px solid #ccc;
  white-space: nowrap;
  overflow-x: scroll;
}

#tile-container {
  display: inline-flex;
}

.tile-wrapper {
  width: 80px;
  height: 80px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  position: relative;
}

.tile {
  background-color: mediumvioletred;
  color: #fafafa;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  position: relative;
  width: 60px;
  height: 60px;
  cursor: move;
  box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.5);
  overflow: hidden;

  &.clone {
    position: absolute;
    opacity: 0;
    visibility: hidden;
  }

  &.dropped {
    background: cornflowerblue;
  }
}


</style>

<script type="text/javascript">
	
	/*
	///////////////////////////////////////////////////////////////////////////////////
	// DRAGGING AN ELEMENT OUTSIDE A SCROLLABLE CONTAINER
	///////////////////////////////////////////////////////////////////////////////////
	
	HOW IT WORKS...
	
	The app starts off by creating clones for each tile using the scope listed below.
	When the user clicks on a tile, startDraggable is called, which enables the 
	draggable instance to be dragged. When this happens, the real tile is hidden, 
	with the clone taking its place. Because the clone is not actually inside the 
	overflow container, it can be dragged anywhere. When the dragging stops, the clone
	goes back to a hidden state.
	
	SCOPE
	- element: the tile element located in the #scroll-box
	- wrapper: the element's parent, used to animate the space collapsing around a tile
	- clone: a clone of the element that gets appended to the #clone-container
	- dropped: is true when the tile is appended to the #drop-panel
	- moved: is true when the tile has been dragged outside of its wrapper
	- draggable: the draggable instance used by the clone
	- x,y: getters that return the start position of the element 
	- width: the width of the wrapper
	
	START DRAGGABLE 
	- moves the clone to the tile's position
	- toggles the visibility between the element and clone
	- starts the draggable instance by passing in the pointer event to its startDrag method
	
	ON DRAG
	- checks if the clone is outside of the wrapper using hitTest
	- if true, it animates the space collapsing where the tile used to be
	
	ON RELEASE
	- checks if the clone is inside the drop panel using hitTest
	- if it's inside and not already dropped, the wrapper is appended to the panel
	
	MOVE BACK
	- animates the wrapper space expanding
	- animates the clone moving back to its starting position
	- toggles the visibility between the clone and tile
	
	///////////////////////////////////////////////////////////////////////////////////
	*/
	
	var container = $("#clone-container");
	var scrollBox = $("#scroll-box");
	var dropPanel = $("#drop-panel");
	var tiles     = $(".tile");
	var threshold = "50%";
	
	tiles.each(function() {
	
	  var element = $(this);
	  var wrapper = element.parent();
	  var offset  = element.position();
	
	  var scope = {
	    clone   : element.clone().addClass("clone").prependTo(container),
	    element : element,
	    wrapper : wrapper,
	    width   : wrapper.outerWidth(),
	    dropped : false,
	    moved   : false,
	    get x() { return getPosition(wrapper, offset).x; },
	    get y() { return getPosition(wrapper, offset).y; }
	  };
	
	  scope.draggable = createDraggable(scope);
	
	  element.on("mousedown touchstart", scope, startDraggable);
	});
	
	// START DRAGGABLE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	function startDraggable(event) {
	
	  var tile = event.data;
	
	  TweenLite.set(tile.element, { autoAlpha: 0 });
	  TweenLite.set(tile.clone, { x: tile.x, y: tile.y, autoAlpha: 1 });
	
	  tile.draggable.startDrag(event.originalEvent);
	}
	
	// CREATE DRAGGABLE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	function createDraggable(tile) {
	
	  var clone   = tile.clone;
	  var wrapper = tile.wrapper;
	
	  tile.draggable = new Draggable(clone, {
	    onPress   : setActive,
	    onDrag    : collapseSpace,
	    onRelease : dropTile
	  });
	
	  return tile.draggable;
	  ///////
	
	  function setActive() {
	    TweenLite.to(clone, 0.15, { scale: 1.2, autoAlpha: 0.75 });
	  }
	
	  function collapseSpace() {
	    if (!tile.moved) {
	      if (!this.hitTest(wrapper)) {
	        tile.moved = true;
	        TweenLite.to(wrapper, 0.3, { width: 0 });
	      }
	    }
	  }
	
	  function dropTile() {
	
	    var className = undefined;
	
	    if (this.hitTest(dropPanel, threshold) && !tile.dropped) {
	      dropPanel.append(wrapper);
	      tile.dropped = true;
	      className = "+=dropped";
	    } 
	
	    moveBack(tile, className);
	  }
	}
	
	// MOVE BACK :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	function moveBack(tile, className) {
	
	  var clone   = tile.clone;
	  var element = tile.element;
	  var wrapper = tile.wrapper;
	
	  TweenLite.to(wrapper, 0.2, { width: tile.width });
	  TweenLite.to(clone, 0.3, { scale: 1, autoAlpha: 1, x: tile.x, y: tile.y, onComplete: done });
	
	  if (className) TweenLite.to([element, clone], 0.3, { className: className });
	
	  function done() {
	    tile.moved = false;
	    TweenLite.set(clone, { autoAlpha: 0 });
	    TweenLite.set(element, { autoAlpha: 1 });
	  }
	}
	
	// GET POSITION ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	function getPosition(wrapper, offset) {
	
	  var position1 = wrapper.offset();
	  var position2 = container.offset();
	
	  return {
	    x: position1.left - position2.left + offset.left,
	    y: position1.top  - position2.top  + offset.top
	  };
	}

</script>

</head>
<body>

<main>
  <section id="top-bar">
    <div id="clone-container">
      <div id="scroll-box">
        <div id="tile-container">

          <div class="tile-wrapper">
            <div class="tile">A</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">B</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">C</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">D</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">E</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">F</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">G</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">H</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">I</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">J</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">K</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">L</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">M</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">N</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">O</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">P</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">Q</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">R</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">S</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">T</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">U</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">W</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">X</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">Y</div>
          </div>
          <div class="tile-wrapper">
            <div class="tile">Z</div>
          </div>

        </div>
      </div>
    </div>
  </section>
  <section class="content"></section>
  <section id="drop-panel">
    <header>DRAG ITEMS HERE</header>
  </section>
</main>


</body>
</html>