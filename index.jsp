<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>My Daily Work Update</title>
		<link rel="stylesheet" type="text/css" href="index.css">
		<script src = "index.js" type = "text/javascript"/></script>
	</head>

	<body onload="startTime()">

		<div class="header">
			<h1>My To Do List</h1>
		</div>

		<jsp:include page="nav.jsp" />
	
		<div id="demo"></div>

		<div id="myDIV" class="header2">
			<input type="text" id="myInput" placeholder="Title...">
			<span onclick="newElement()" class="addBtn">Add</span>
		</div>
		<ul id="myUL"></ul>

		<script>
			//Create a "close" button and append it to each list item
			var myNodelist = document.getElementsByTagName("LI");
			var i;
			for (i = 0; i < myNodelist.length; i++) {
			var span = document.createElement("SPAN");
			var txt = document.createTextNode("\u00D7");
			span.className = "close";
			span.appendChild(txt);
			myNodelist[i].appendChild(span);
			}
			
			// Click on a close button to hide the current list item
			var close = document.getElementsByClassName("close");
			var i;
			for (i = 0; i < close.length; i++) {
			close[i].onclick = function() {
				var div = this.parentElement;
				div.style.display = "none";
			}
			}
			
			// Add a "checked" symbol when clicking on a list item
			var list = document.querySelector('ul');
			list.addEventListener('click', function(ev) {
			if (ev.target.tagName === 'LI') {
				ev.target.classList.toggle('checked');
			}
			}, false);
		</script>
	</body>
</html>