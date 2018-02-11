<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css" rel="stylesheet" type="text/css">
<!-- all these references goes before the closing body tag-->
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="//cdn.jsdelivr.net/stickynavbar.js/1.3.2/jquery.stickyNavbar.min.js"></script>


</head>
<style>
body,
h1,
ul {
  margin: 0;
}

li {
  list-style-type: none;
}

h1 {
  font-size: 1.5rem;
}

a {
  text-decoration: none;
  text-transform: uppercase;
  color: #fff;
}

.toggle-menu {
  box-shadow: none;
  background: transparent;
  border: 0;
}

body {
  background: #f1f1f1;
  color: #272626;
  font: normal 20px/1.6 "Noto Sans", sans-serif;
}


/* HEADER STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */

header {
  position: fixed;
  top: 0;
  width: 100%;
  padding: 20px;
  box-sizing: border-box;
  background: #DD3543;
}

nav {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  transition: align-items .2s;
}

.logo {
  font-size: 2rem;
  display: inline-block;
  padding: 20px 30px;
  background: #F35B66;
  color: #fff;
  margin: 50px 0 0 50px;
  transition: all .2s;
}

ul {
  display: flex;
  margin: 50px 50px 0 0;
  padding: 0;
  transition: margin .2s;
}

li:not(:last-child) {
  margin-right: 20px;
}

li a {
  display: block;
  padding: 10px 20px;
}

.toggle-menu {
  display: none;
  font-size: 2rem;
  color: #fff;
  margin: 10px 10px 0 0;
  transition: margin .2s;
}


/* MAIN STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */

main {
  display: block;
  padding: 0 20px;
}


/* STYLES FOR THE "scroll" CLASS
–––––––––––––––––––––––––––––––––––––––––––––––––– */

.scroll {
  box-shadow: 0 7px 0 0 rgba(0, 0, 0, .1);
}

.scroll .logo {
  padding: 10px 20px;
  font-size: 1.5rem;
}

.scroll nav {
  align-items: center;
}

.scroll .logo,
.scroll ul,
.scroll .toggle-menu {
  margin: 0;
}


/* MQ STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */

@media screen and (max-width: 1060px) {
  header {
    padding: 10px;
  }
  nav {
    align-items: center;
  }
  ul {
    display: none;
  }
  .logo {
    font-size: 1.8rem;
    margin: 10px 0 0 10px;
  }
  .toggle-menu {
    display: block;
  }
}


/* STYLES FOR THE COUNTER
–––––––––––––––––––––––––––––––––––––––––––––––––– */

.counter {
  visibility: hidden;
  position: fixed;
  top: 50%;
  transform: translateY(-50%);
  right: 1px;
  padding: 5px;
  color: #fff;
  background: #DD3543;
}
</style>
<script>
(function() {

	  'use strict';

	  var m = document.querySelector("main"),
	    h = document.querySelector("header"),
	    c = document.querySelector(".counter"),
	    counter = 0,
	    hHeight;

	  function setTopPadding() {
	    hHeight = h.offsetHeight;
	    m.style.paddingTop = hHeight + "px";
	  }

	  function onScroll() {

	    window.addEventListener("scroll", _.throttle(callbackFunc, 200));
	    /**
	     * Replace the line above with the following one 
	     * to see how many more times the "callbackFunc" is executed
	     */
	    // window.addEventListener("scroll", callbackFunc);

	    function callbackFunc() {
	      c.style.visibility = "visible";
	      c.innerHTML = counter++;
	      var y = window.pageYOffset;
	      if (y > 150) {
	        h.classList.add("scroll");
	      } else {
	        h.classList.remove("scroll");
	      }
	    }
	  }

	  window.onload = function() {
	    setTopPadding();
	    onScroll();
	  };

	  window.onresize = function() {
	    setTopPadding();
	  };
	})();
</script>
<body>

<header>
  <nav>
    <h1>
      <a href="" class="logo">Logo</a>
    </h1>
    <ul>
      <li><a href="">About</a></li>
      <li><a href="">Services </a></li>
      <li><a href="">Portfolio</a></li>
      <li><a href="">Contact</a></li>
    </ul>
    <button class="toggle-menu" aria-label="Responsive Navigation Menu">b</button>
  </nav>
</header>

<main>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam temporibus repellat voluptatem sit nulla commodi, maxime optio aperiam! Consequuntur necessitatibus iste amet id, nihil laboriosam voluptatem cum laudantium ab repudiandae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis,
  enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p> Eipsum dolor sit amet, consectetur adipisicing elit. Quisquam temporibus repellat voluptatem sit nulla commodi, maxime optio aperiam! Consequuntur necessitatibus iste amet id, nihil laboriosam voluptatem cum laudantium ab repudiandae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam temporibus repellat voluptatem sit nulla commodi, maxime optio aperiam! Consequuntur necessitatibus iste amet id, nihil laboriosam voluptatem cum laudantium ab repudiandae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis.<p>

  <p> ipsum dolor sit amet, consectetur adipisicing elit. Quisquam temporibus repellat voluptatem sit nulla commodi, maxime optio aperiam! Consequuntur necessitatibus iste amet id, nihil laboriosam voluptatem cum laudantium ab repudiandae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  </p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>

  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Eipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime ipsum blanditiis, enim beatae, ipsam tempore, ullam voluptas consequuntur laborum, dolor nobis nam velit iure. Autem veniam atque quo, sunt veritatis!</p>
</main>

<div class="counter"></div>
</body></html>
