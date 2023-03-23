<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,500;1,400&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Home Page</title>
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
	.headerPage, .headerAssignment{
	font-family: 'Roboto', sans-serif;
		margin-top: 5px;
		text-align: center;
		background-color: #4c4c51;
		font-size: 45px;
		font-weight: 700;
		color: white;
		padding: 5rem 0;
		white-space: 1px;
	}
	
	.headerAssignment{
	font-size: 25px;
		font-weight: 700;
		background-color: #98FB98;
		color: white;
		padding: 2rem 0;
		white-space: 2px;
		width: 50%;
    margin: 0 auto;
    border-radius: 4px;
	}
</style>

</head>
<body>
	
	<div class="container">
		<div class="navbar">
			<ul>
				<li><a class="active" href="#home">Home</a></li>
				<li><a href="<c:url value = "/adminuser"/>">UserList</a></li>
				<li><a href="<c:url value = "/adminuser/new"/>">New User</a></li>
				<li><a href="<c:url value = "/about"/>">About</a></li>
			</ul>
		</div>
		
		<h3 class="headerPage">${currPage}</h3>
		<h5 class="headerAssignment">Assignment 2</h5>
	</div>
</body>
</html>