<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr {
	background-color: #dddddd;
}

thead > tr:first-child {
	background-color: #01987a;
}

tr:nth-child(even) {
	background-color: #ffffff;
}

.b-pagination-outer {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	overflow: hidden;
	display: flex
}

#border-pagination {
	margin: 0 auto;
	padding: 0;
	text-align: center
}

#border-pagination li {
	display: inline;
}

#border-pagination li a {
	color: #3279b6;
	display: block;
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ddd;
	float: left;
}

#border-pagination li a {
	-webkit-transition: background-color 0.4s;
	transition: background-color 0.4s
}

#border-pagination li a.active {
	background-color: #3279b6;
	color: #fff;
}

#border-pagination li a:hover:not(.active) {
	background: #ddd;
}

.container {
	margin: 0 5rem;
	font-family: 'Roboto', sans-serif;
}

.userNotes {
	
	width: 25rem;
	max-width: 25rem;
}

.disable {
	pointer-events: none;
	background-color: #e0e0e0;
}

#tbl_Header{
	color: white;
}

#tbl_Header .disable{
background-color: #01987a;
}


.row_Link {
	font-size: 14px;
	cursor: pointer;
}

.row_Link:hover {
	background-color: #797676;
	color: white;
}

.userInactive {
	pointer-events: none;
	text-decoration: line-through;
	color: #b6b6b6;
}

.tbl_HeaderName {
	cursor: pointer;
}

.b-pagination-outer {
	margin: 20px 0;
}
.current_total_page{
	text-align: center;
	margin: 1rem;
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
		<%-- <div class="navbar">
			<ul>
				<li><a href="<c:url value = "/"/>">Home</a></li>
				<li><a class="active" href="<c:url value = "/adminuser"/>">UserList</a></li>
				<li><a href="<c:url value = "/adminuser/new"/>">New User</a></li>
				<li><a href="#about">About</a></li>
			</ul>
		</div> --%>

	<div class="container">
		
		<h2>AdminUser Table</h2>
		<table id="user-table">
		<thead>
			<tr id="tbl_Header" data-sort="${sortType }">
				<th class="tbl_HeaderName disable">ID</th>
				<th class="tbl_HeaderName">Name</th>
				<th class="tbl_HeaderName">Email</th>
				<th class="tbl_HeaderName">Status</th>
				<th class="tbl_HeaderName">Notes</th>
				<th class="tbl_HeaderName">CreatedAt</th>
				<th class="tbl_HeaderName">UpdatedAt</th>
			</tr>
			</thead>
			<tbody>
			
  			  </tbody>
  			  

			<%-- <c:forEach var="user" items="${listUser}">
				<c:choose>
					<c:when test="${ user.deletedAt == null}">
						<tr class="row_Link" data-userID="${user.ID}">
							<td class="${ user.statusCode == 4 ? 'userInactive' : ''}">${user.ID}</td>
							<td class="${ user.statusCode == 4 ? 'userInactive' : ''}">${user.name}
							</td>
							<td class="${ user.statusCode == 4 ? 'userInactive' : ''}">${user.email}</td>
							<td class="${ user.statusCode == 4 ? 'userInactive' : ''}">${user.status}</td>
							<td
								class="${ user.statusCode == 4 ? 'userInactive' : ''} userNotes">${user.notes}</td>
							<td class="${ user.statusCode == 4 ? 'userInactive' : ''}">${user.createdAt}</td>
							<td class="${ user.statusCode == 4 ? 'userInactive' : ''}">${user.updatedAt}</td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach> --%>

		</table>
		
		
		<div class="current_total_page">Page ${currentPage} / ${ totalPage} Pages</div>

		<div class="b-pagination-outer">

			<ul id="border-pagination">
				<li><a class="${currentPage == 1 ? 'disable' : '' }"
					href="<c:url value = "/adminuser?page=1"/>">«</a></li>
				<li><a class="${currentPage == 1 ? 'disable' : '' }"
					href="<c:url value = "/adminuser?page=${ currentPage > 1 ? currentPage - 1 : 1 }"/>">Previous</a></li>

				<c:forEach begin="${ currentPage > 3 ?  currentPage - 2 : 1}"
					end="${currentPage + 3 > totalPage ? totalPage : currentPage + 3}"
					var="page">
					<li><a class="${page == currentPage ? 'active' : '' }"
						href="<c:url value = "/adminuser?page=${page }"/>">${page }</a></li>
				</c:forEach>

				<li><a class="${currentPage == totalPage ? 'disable' : '' }"
					href="<c:url value = "/adminuser?page=${ currentPage < totalPage ? currentPage + 1 : totalPage }"/>">Next</a></li>
				<li><a class="${currentPage == totalPage ? 'disable' : '' }"
					href="<c:url value = "/adminuser?page=${ totalPage}"/>">»</a></li>
			</ul>
		</div>
		
		

	</div>

	<script type="text/javascript">
	
	
	var userApi = 'http://localhost:8080/Assignment_1/api/v1/user_list'
	

		async function fetchUserData(userApi) {
		  try {
		    const response = await fetch(userApi);
		    const data = await response.json();
		    renderUserData(data);
		    addClickEventToRows();
		  } catch (error) {
		    console.log(error);
		  }
		}
	
	function addClickEventToRows() {
		  const rows = document.getElementsByClassName("row_Link");
		  for (const row of rows) {
		    row.addEventListener("click", (e) => {
		      let userID = row.getAttribute("data-userID");
				console.log(window.location.pathname + "/edit?id=" +userID);
				window.location.href = window.location.pathname + "/edit?id=" +userID;
		    });
		  }
		  let headers = document.getElementsByClassName("tbl_HeaderName");
			for(let header of headers){
				header.addEventListener("click",function(e){
					let sortType = document.getElementById("tbl_Header").getAttribute("data-sort");
					let col = header.innerHTML;
					console.log(col);
					let url = window.location.href;
					if(url.includes("&sort") || url.includes("?sort")){
						url = url.slice(0,url.indexOf("sort"))
						url = url  + "sort=" + sortType + "&col=" + col
						console.log( url  + "sort=" + sortType + "&col=" + col);
					}
					else if(url.includes("?")){
						console.log( url  + "&sort=" + sortType + "&col=" + col);
						url = url  + "&sort=" + sortType + "&col=" + col;
					}else{
						console.log( url  + "?sort=" + sortType + "&col=" + col);
						url = url  + "?sort=" + sortType + "&col=" + col;
					}
					window.location.href  = url;
				})
			}
		}
	
	document.addEventListener("DOMContentLoaded", () => {
		  fetchUserData(userApi);
		});
	
	/* fetch(userApi)
		.then(function(response){
			return response.json()
		})
		.then(function(users){
			renderUserData(users)
		}) */
		
		function renderUserData(data) {
        var table = document.getElementById('user-table').getElementsByTagName('tbody')[0];
         for (var i = 0; i < data.length; i++) {
            var row = document.createElement('tr');
            row.classList.add("row_Link")
            /* row.setAttribute("id", 'row_Link')  */
            row.setAttribute("data-userID", data[i].id)
            data[i].statusCD == 4 ? row.classList.add('userInactive') : ''
            		
            var id = document.createElement('td');
            var name = document.createElement('td');
            var email = document.createElement('td');
            var status = document.createElement('td');
            var note = document.createElement('td');
            var createAt = document.createElement('td');
            var updateAt = document.createElement('td');
            
            id.textContent = data[i].id;
            name.textContent = data[i].name;
            email.textContent = data[i].email;
            status.textContent = convertToStatusString(data[i].statusCD);
            note.textContent = data[i].notes;
            createAt.textContent = formatTimeStamp(data[i].createdAt); 
            updateAt.textContent = formatTimeStamp(data[i].updatedAt);          
            
            row.appendChild(id);
            row.appendChild(name);
            row.appendChild(email);
            row.appendChild(status);
            row.appendChild(note);
            row.appendChild(createAt);
            row.appendChild(updateAt);
            
            table.appendChild(row);
        }

    }	
	
		

			function formatTimeStamp(timestamp){
			  const date = new Date(timestamp);

			  const year = date.getFullYear();
			  const month = ("0" + (date.getMonth() + 1)).slice(-2); 
			  const day = ("0" + date.getDate()).slice(-2);
			  const hours = ("0" + date.getHours()).slice(-2);
			  const minutes = ("0" + date.getMinutes()).slice(-2);
			  const seconds = ("0" + date.getSeconds()).slice(-2);
			  const formattedDate = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
			  return formattedDate;
			}
			
	
			function convertToStatusString(sts){
				switch (sts) {
				  case 1:
				    return "Active"
				    break;
				  case 2:
				    return "Preapproval"
				    break;
				    case 3:
				    return "Suspended"
				    break;
				    case 4:
				    return "Inactive"
				    break;
				  case 5:
				    return "Locked"
				    break;
				  default:
				    console.log("Any thing wrong in status");
				}

			}
	
		

	
	
	/* document.addEventListener('DOMContentLoaded', ()=> {
        var rows = document.getElementsByClassName("row_Link");
        console.log(rows)
     for (const row of rows) {
         row.addEventListener('click', (e)=>{
            console.log(123);
      })           
     }
    }) */
	 
	
	
	
	
	    /* window.addEventListener("DOMContentLoaded", function() {
	    	console.log(100)
	    	const rows = document.getElementById("rowLink");
	    	console.log(rows)
	    	rows.addEventListener('click', ()=> {
	    		console.log(123)
	    	})
	    	
	    	
	    })  */
	
	/* window.addEventListener('DOMContentLoaded', (event) => {
	    console.log('DOM fully loaded and dsdjfm');
	    const rows = document.getElementsByClassName("row_Link");
	    rows.addEventListener("click", function() {
	    	console.log(12300)
	    })
	});
		 */	
		
	
	
	
	/* document.addEventListener("DOMContentLoaded", function(event) {

		(()=>{
			let rows = document.getElementsByClassName("row_Link");
			for(let row of rows){
				row.addEventListener("click",function(e){
					let userID = row.getAttribute("data-userID");
					console.log(123)
					console.log(window.location.pathname + "/edit?id=" +userID);
					window.location.href = window.location.pathname + "/edit?id=" +userID;
				})
			}
			
			let headers = document.getElementsByClassName("tbl_HeaderName");
			for(let header of headers){
				header.addEventListener("click",function(e){
					let sortType = document.getElementById("tbl_Header").getAttribute("data-sort");
					let col = header.innerHTML;
					console.log(col);
					let url = window.location.href;
					if(url.includes("&sort") || url.includes("?sort")){
						url = url.slice(0,url.indexOf("sort"))
						url = url  + "sort=" + sortType + "&col=" + col
						console.log( url  + "sort=" + sortType + "&col=" + col);
					}
					else if(url.includes("?")){
						console.log( url  + "&sort=" + sortType + "&col=" + col);
						url = url  + "&sort=" + sortType + "&col=" + col;
					}else{
						console.log( url  + "?sort=" + sortType + "&col=" + col);
						url = url  + "?sort=" + sortType + "&col=" + col;
					}
					window.location.href  = url;
				})
			}
			
		})()
		
		
	}) */
	</script>

</body>

</html>