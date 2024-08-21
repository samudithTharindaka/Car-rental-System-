<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    body {
        background-color: #f8f9fa;
        overflow-x: hidden; /* Disable horizontal scrolling for the entire website */
    }
	.dashboard{
	padding-top:10vh;
	padding-left:5%;
	padding-bottom:8vh;
    background-color:#262A2E; /* Pale background color */
    font-family: 'Open Sans', sans-serif; /* Use Open Sans font */
    color: #ffffff; /* White text color */
    margin-bottom:5%;
    
	
	}
    .container {
        margin-top: 50px;
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .card-header {
        background-color:#262A2E;
        color: #fff;
        border-radius: 10px 10px 0 0;
    }

    .btn-custom {
        background-color: #262A2E;
        border-color: #007bff;
        border-radius: 5px;
        color:white
    }
</style>
</head>
<body>
<div class="dashboard">
<div class="row">
	<div class="col-6"><h1 >Admin Dashboard</h1></div>
	<div class="col-3"></div>
	<div class="col-3">
		<form action="UserServlet ">
		<input type="hidden" value="logout" name="task">
		<button type="submit" class="btn btn-danger">Logout</button>
		</form>
	</div>
</div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h1 class="text-center">Admin Portal</h1>
                </div>
                <div class="card-body">
                    <table class="table">
                        <c:forEach var="user" items="${sessionScope.userDetails}">
                            <tr>
                                <td>Customer ID</td>
                                <td>${user.id}</td>
                            </tr>
                            <tr>
                                <td>Customer Name</td>
                                <td>${user.name}</td>
                            </tr>
                            <tr>
                                <td>Customer Email</td>
                                <td>${user.gmail}</td>
                            </tr>
                            <tr>
                                <td>Customer Phone</td>
                                <td>${user.phoneNumber}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="row">
                        <!-- Buttons for navigating to other pages -->
                   	<div class="col-2">
                        <form action="UserServlet" method="get">
                        	<input type="hidden" value="ViewUsers" name="task">
                        	<button type="submit"  class="btn btn-custom mx-2">View Users</button>
                        </form>
                        
                    </div>  
                    <div class="col-2">
                          <form action="applicationServlet" method="get">
                        	<input type="hidden" value="ViewApplications" name="task">
                        	<button type="submit"  class="btn btn-custom mx-2">View Applications</button>
                        </form>
                     </div>  
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>