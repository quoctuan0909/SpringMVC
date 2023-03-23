<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>About Us</title>
	<style>
		.navbar ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: #333;
		}
		
		.navbar li {
			float: left;
		}
		
		.navbar li a {
			font-family: 'Roboto', sans-serif;
			display: block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			font-size: 16px;
		}
		
		.navbar li a:hover {
			background-color: #111;
		}
		
		.navbar .active{
			background-color: #1075ce;
		}
	</style>
	
	<style>
		.headerPage{
			font-size: 45px;
			font-family: 'Roboto', sans-serif;
			text-align: center;
		}
		.contentBox{
			margin-top: 5rem;
		}
	</style>
	
	<style>
		
		.memberList{
			text-align: center;
			margin-top: 5rem;
		}
		.memberCard{
			border: solid black;
			display: inline-block;
			border-radius: 16px;
			width: 15rem;
			margin: 0 2rem;
		}
		.memberCard .thumbnail img{
			width: 100%;
			height: 240px;
			max-height: 240px;
			border-radius: 16px;
		}
		
		.memberName{
			font-family: 'Roboto', sans-serif;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="navbar">
			<ul>
				<li><a href="<c:url value = "/"/>">Home</a></li>
				<li><a href="<c:url value = "/adminuser"/>">UserList</a></li>
				<li><a href="<c:url value = "/adminuser/new"/>">New User</a></li>
				<li><a class="active" href="<c:url value = "/about"/>">About</a></li>
			</ul>
		</div>
		
		<div class="contentBox">
			<h2 class="headerPage">Our Member</h2>
		
			<div class="memberList">
				<div class="memberCard">
					<div class="thumbnail">
						<!--  <img alt="" src="https://i.kym-cdn.com/photos/images/facebook/000/303/776/2ef.jpg">-->
						<img alt="" src="https://media.tenor.com/qAJUUHshZEEAAAAM/bruh-sigh.gif">
					</div>
					<div class="memberInfo">
						<h3 class="memberName">5TL</h3>
					</div>
				</div>
				
				<div class="memberCard">
					<div class="thumbnail">
						<img alt="" src="https://i.kym-cdn.com/photos/images/newsfeed/000/343/462/79a.gif">
					</div>
					<div class="memberInfo">
						<h3 class="memberName">Quoc Tuan</h3>
					</div>
				</div>
			</div>
		
		</div>
		
		
		
	</div>
</body>
</html>