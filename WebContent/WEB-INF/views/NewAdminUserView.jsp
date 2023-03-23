<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,500;1,400&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
	body {
		font-size: 14px;
		
	}
	
	h3 {
		color: #fff;
		background-color: #01987a;
		border: 1px solid #55989f;
		padding: 8px;
		margin-bottom: 31px;
		border-radius: 4px 4px 0 0;
		position: relative;
		top: 20px;
	}
	
	.container {
		font-family: 'Roboto', sans-serif;
	}
	
	.info {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;
	}
	
	input {
		width: 100%;
		flex: 6;
		color: black;
		font-size: 16px;
		padding: 10px;
		border-radius: 4px;
		border: 1px solid darkgrey;
		margin-bottom: .5rem;
	}
 
	#status {
		width: 100%;
		flex: 6;
		color: #000;
		padding: 10px;
		border-radius: 4px;
		border: 1px solid darkgrey;
		margin-bottom: .5rem;
	}
	
	label {
		flex: 1;
		font-size: 16px;
	}
	
	.btn-gr {
		display: flex;
		justify-content: center;
		width: 100%;
		margin-top: 2rem;
	}
	
	.btn-gr button {
		width: 25rem;
		padding: 10px;
		background-color: #01987a;
		color: #fff;
		border: none;
		line-height: 25px;
		margin: 0 20px;
		border-radius: 4px !important;
		font-weight: 700;
		cursor: pointer;
	}
	
	#btn_close{
		background-color: #bf0108;
	}
	
	
	button:nth-child(1) {
		border-radius: 4px 0 0 4px;
	}
	
	button:nth-child(2) {
		border-radius: 0 4px 4px 0;
	}
	
	.form {
		padding: 15px;
		border: 1px solid #55989f;
	}
	
	.field_require{
		color: red;
		margin-left: 5px;
	}
	
	.container_box{
		max-width: 80%;
		margin: 0 auto;
	}
	
	#msg_error{
		color: red;
		font-size: 16px;
		font-weight: 700;
	}
	.title_error{
		font-size: 18px;
		font-weight: 700;
	}

</style>
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
		display: block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
		font-family: 'Roboto', sans-serif;
		font-size: 16px;
	}
	
	.navbar li a:hover {
		background-color: #111;
	}
	.navbar .active{
		background-color: #1075ce;
	}
	
</style>
</head>
<body>

<%-- 	<div class="navbar">
		<ul>
			<li><a href="<c:url value = "/"/>">Home</a></li>
			<li><a href="<c:url value = "/adminuser"/>">UserList</a></li>
			<li><a class="active" href="<c:url value = "/adminuser/new"/>">New User</a></li>
			<li><a href="#about">About</a></li>
		</ul>
	</div> --%>

	<div class="container">
		<div class="container_box">
			<div>
				<h3>New User</h3>
			</div>
			<form onsubmit="event.preventDefault(); saveUser();">
				<div class="container">
	
					<div class="info">
						<label for="name"><b>Name</b> <span class="field_require">*</span> </label>
						<input type="text" name="name" id="name" />
					</div>
	
					<div class="info">
						<label for="email"><b>Email</b><span class="field_require">*</span></label>
						<input type="email" name="email" id="email" />
					</div>
	
					<div class="info">
						<label for="password"><b>Password</b></label>
						<input type="password" placeholder="password"
							name="password" id="password" />
					</div>
	
					<div class="info">
						<label></label> <input type="password"
							placeholder="verify password" name="psw-repeat" id="psw-repeat" />
					</div>
	
					<div class="info">
						<label for="agent_id"><b>Agent ID</b></label>
						<input type="text" name="agentID" id="agent_id" />
					</div>
	
					<div class="info">
						<label for="status"><b>Status</b><span class="field_require">*</span></label>	
						<select name="statusCD" id="status">
						<option value="">select</option>
							<c:forEach var="status" items="${statusList}">						
								<option value="${status.codeValue}">${status.codeName}</option>
							</c:forEach>
							
						</select>
					</div>=
	
					<div class="info">
						<label for="note"><b>Notes</b></label>
						<input type="text" name="notes" id="note" />
					</div>
					
					<div class="info">
							<h5 class="title_error"><span id="msg_error"></span></h5>
					</div>
	
					<div class="btn-gr">
						<button type="button" id="btn_close" name ="Close bnt">Close</button>
						<button name ="registerbtn" id="btn_register" type="submit" class="registerbtn">Registration</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
	async function getStatusData(){
		const response = await fetch() 
	}
	
	 function saveUser() {
         const name = document.getElementById("name").value;
         const email = document.getElementById("email").value;
         const password = document.getElementById("password").value;
         const agentID = document.getElementById("agent_id").value;
         const status = document.getElementById("status").value;
         const note = document.getElementById("note").value;
         
         // Tạo một đối tượng user để lưu trữ giá trị nhập từ form
         const user = {
             name: name,
             email: email,
             password: password,
             agentID: agentID,
             statusCD: status,
             note: note
         };
         console.log(user)
         
         // Gửi yêu cầu POST đến đường dẫn API để lưu thông tin user
         fetch("http://localhost:8080/Assignment_1/api/v1/user", {
             method: "POST",
             body: JSON.stringify(user),
             headers: {
                 "Content-type": "application/json; charset=UTF-8",
             }
         })
         .then(res => res.json())
         .then(data => {
             console.log(data);
             alert("Save user successfully!");
         })
         .catch(error => {
             console.error(error);
             alert("Save user failed!");
         });
     }
	
	
	function isHaveError(){
		if((window.location.search).includes("error")){
			let msg_error = ((window.location.search).split("=")[1]).replaceAll("_"," ");
			document.getElementById("msg_error").innerText = "Error: " + msg_error;
			alert(msg_error)
		}
	}
	const handlePswRepeat = (pswRepeat, password, e) => {
		if(typeof password === 'string' && typeof pswRepeat === 'string' && pswRepeat === password){
			return true 
		}else{
			alert("Error: Please check the password")
			e.preventDefault()	
		}
	}
	document.addEventListener("DOMContentLoaded", function(event) {
		
		isHaveError();
		
		document.getElementById("btn_register").addEventListener("click", function(event){
			const pwd = document.getElementById('password').value;
			const cfm_pwd = document.getElementById('psw-repeat').value;
			handlePswRepeat(pwd,cfm_pwd);
			
		});
		
		document.getElementById("btn_close").addEventListener("click", function(event){
			event.preventDefault();
			window.location.href = (window.location.href).slice(0,(window.location.href).indexOf("/new"));
		});
		
	})
	
	</script>
</body>
</html>