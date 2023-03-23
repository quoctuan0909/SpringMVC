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
	cursor: pointer;
	margin-bottom: .5rem;
}

#status {
	width: 100%;
	flex: 6;
	color: black;
	font-size: 16px;
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
	margin-top: 1rem;
}

.btn-gr button {
	width: 80%;
	padding: 8px;
	background-color: #0188bf;
	color: #fff;
	font-size:16px;
	font-weight: 700;
	border: none;
	line-height: 25px;
	margin: 0 10px;
	cursor: pointer;
	border-radius: 4px !important;
}

.btn-gr .delete-btn {
	background-color: red;
}

#btn_Submit {
	background-color: #01987a;
}

button:nth-child(1) {
	border-radius: 4px 0 0 4px;
}

button:nth-child(3) {
	border-radius: 0 4px 4px 0;
}

.form {
	padding: 15px;
	border: 1px solid #55989f;
}

.hiden {
	display: none;
}

.disable {
	pointer-events: none;
	background-color: #e0e0e0;
}

.field_require{
	color: red;
	margin-left: 5px;
}
.container_box{
		max-width: 80%;
		margin: 0 auto;
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
			<li><a href="<c:url value = "/adminuser/new"/>">New User</a></li>
			<li><a href="#about">About</a></li>
		</ul>
	</div> --%>

	<div class="container">
		<div class="container_box">
			<div>
				<h3>Update User ID: ${adminuser.ID }</h3>
			</div>
			<form:form onsubmit="event.preventDefault(); updateUser();" class="form" action="modify" method="post" id="form_Data"
				modelAttribute="adminuser">
				<div class="container">
					<div class="info hiden">
						<label for="ID"><b>ID</b></label>
						<form:input type="text" path="ID" name="ID" id="ID" />
					</div>
	
					<div class="info">
						<label for="name"><b>Name</b><span class="field_require">*</span></label>
						<form:input type="text" path="name" name="name" id="name" />
					</div>
	
					<div class="info">
						<label for="email"><b>Email</b><span class="field_require">*</span></label> <input type="email"
							name="email" value="${adminuser.email}" class="disable" id="email" disabled />
					</div>
	
					<div class="info">
						<label for="password" data-pwd="${adminuser.password}"><b>Password</b></label> 
						<!-- <input type="text" placeholder="password" id="password" /> -->
						<form:input type="password" path="password" name="password" id="password" placeholder="password"/>
					</div>
	
					<div class="info">
						<label></label> 
						<input type="password" placeholder="verify password" name="psw-repeat" id="psw-repeat" />
					</div>
	
					<div class="info">
						<label for="agent_id"><b>Extension Number</b></label>
						<form:input type="text" path="agentID" name="agentID" id="agent_id" />
					</div>
	
					<div class="info">
						<label for="status"><b>Status</b><span class="field_require">*</span></label>
						<form:select name="status" path="statusCD" id="status">
							<c:forEach var="status" items="${statusList}">
								<option value="${status.codeValue}">${status.codeName}</option>
							</c:forEach>
						</form:select>
					</div>
	
					<div class="info">
						<label for="note"><b>Notes </b></label>
						<form:input type="text" path="notes" name="notes" id="note" />
					</div>
	
					<div class="info">
						<label for="creation-time"><b>Creation Time</b></label> <input
							type="datetime" value="${adminuser.createdAt}" class="disable" disabled>
	
					</div>
	
					<div class="info">
						<label for="change-time"><b>Change Time</b></label> <input
							type="datetime" value="${adminuser.updatedAt}" class="disable" disabled>
					</div>
	
					<div class="btn-gr">
						<button id="btn_Cancel" type="button">Cancellation</button>
						<button id="btn_Submit" type="submit" name="update">Submit</button>
						<button id="btn_Delete" onclick="deleteUser()" type="button" class="delete-btn" name="delete">Delete</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
	
	 function updateUser() {
         // Lấy giá trị từ các input trong form
         const id = document.getElementById("ID").value;
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
             agentID: agentID ,
             statusCD: status,
             notes: note
         };
         console.log(user)

         // Gửi yêu cầu PUT đến đường dẫn API để cập nhật thông tin user
         fetch("http://localhost:8080/Assignment_1/api/v1/user/"+id, {
             method: "PUT",
             body: JSON.stringify(user),
             headers: {
                 "Content-type": "application/json; charset=UTF-8",
             }
         })
         .then(res => res.json())
         .then(data => {
             console.log(data);
             alert("Update user successfully!");
         })
         .catch(error => {
             console.error(error);
             alert("Update user failed!");
         });
     }
	 
	 function deleteUser() {
         // Lấy giá trị từ các input trong form
         const id = document.getElementById("ID").value;

			console.log(id)
         // Gửi yêu cầu PUT đến đường dẫn API để cập nhật thông tin user
         fetch("http://localhost:8080/Assignment_1/api/v1/user/"+id, {
             method: "DELETE",
         })
         .then(res => {
             if (res.ok) {

                 alert("Delete user successfully!");
             } else {

                 alert("Delete user failed!");
             }
         })
         .catch(error => {
             console.error(error);
             alert("Delete user failed!");
         });
     }
	
	
	
	
	
	const handleName = (name, e) => {
		if(name !== ''){
			return true
		}else{
			alert("Please check the name")
			e.preventDefault()	
			return false;
		}	
	}
	
	const handleEmail = (email, e) => {
		if(email !== ''){
			return true;
		}else{
			alert("Please check the email");
			e.preventDefault();	
			return false;
		}	
	}
	const handlePswRepeat = (pswRepeat, password, e) => {
		if(typeof password === 'string' && typeof pswRepeat === 'string' && pswRepeat === password){
			return true 
		}else{
			alert("Please check the password")
			e.preventDefault()	
			return false;
		}
	}
	
	const handleStatus = (status, e) => {
		if(status !== ""){
			return true
		}else{
			alert("Please check the status")
			e.preventDefault()	
			return false;
		}	
	}
		document.addEventListener("DOMContentLoaded", function(event) {
			
			const pwd = document.getElementById('password').value;
			document.getElementById('password').value = "";
			
			document.getElementById("btn_Submit").addEventListener("click",
					function(event) {

					});

			document.getElementById("btn_Delete").addEventListener("click",
					function(event) {
						event.preventDefault();
						if (confirm("Are you sure want to delete this user")) {
							let input = document.createElement('input');
							input.setAttribute('name', "delete");
							document.forms[0].appendChild(input);
							//document.forms[0].action = "/adminuser/"
							document.forms[0].submit();
						}
					});

			document.getElementById("btn_Cancel").addEventListener(
					"click",
					function(event) {
						event.preventDefault();
						window.location.href = (window.location.href).slice(0,
								(window.location.href).indexOf("/edit"));
					});
			document.getElementById('btn_Submit').addEventListener("click", function(e) {
				const name = document.getElementById('name').value;
				const email = document.getElementById('email').value;
				const password = document.getElementById('password').value;
				const pswRepeat = document.getElementById('psw-repeat').value;
				const status = document.getElementById('status').value;
				
				if(password === "" && handleName(name, e) && handleEmail(email, e) && handlePswRepeat(pswRepeat, password, e) && handleStatus(status, e)){
					document.getElementById('password').value = pwd;
				}
			})

		})
	</script>

</body>
</html>