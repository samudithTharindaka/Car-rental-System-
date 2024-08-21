<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Car Owner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            overflow-x: hidden; /* Hide horizontal scrollbar */
        }
        .dashboard {
            padding-top: 10vh;
            padding-left: 5%;
            padding-bottom: 8vh;
            background-color: #262A2E; /* Pale background color */
            font-family: 'Open Sans', sans-serif; /* Use Open Sans font */
            color: #ffffff; /* White text color */
            margin-bottom: 5%;
        }
        .footer {
            background-color: #262A2E;
            color: #ffffff;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>



<div class="dashboard">
    <div class="row">
        <div class="col-6"><h1>Vehicle Owner Dashboard</h1></div>
        <div class="col-3"></div>
        <div class="col-3">
          <form action="UserServlet ">
		<input type="hidden" value="logout" name="task">
		<button type="submit" class="btn btn-danger">logout</button>
		</form>
        </div>
    </div>
</div>

<h1></h1>

<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h1 class="text-center">Owner Options</h1>
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
                </div>
            </div>
        </div>
    </div>
</div>

<c:set var="userId" value="${userDetails[0].id}" />

<div class="row">
<div class="col-4"></div>
<div class="col-4">
<div class="row">
<div class="col-4">
<a href="addVehicle.jsp?id=${userId}&result=a" class="btn btn-primary">Add a new Vehicle</a> 
</div>
<div class="col-4">
<form action="viewRegistrations" method="get">
    <input type="hidden" value="${userId}" name="id">
    <input type="hidden" value="ViewRegistrations" name="task">
    <button type="submit"  class="btn btn-primary">See Registrations</button>
</form>
</div>
<div class="col-4">
<form action="vehicleServelet" method="get">
    <input type="hidden" value="${userId}" name="id">
    <input type="hidden" value="viewVehicleUser" name="task">
    <button type="submit"  class="btn btn-primary">View Vehicles</button>
</form>
</div>
</div>
</div>
<div class="col-4"></div>
</div>
<footer class="footer">
    <div class="container">
        <span class="text-muted">© 2024 Your Company. All rights reserved.</span>
    </div>
</footer>

</body>
</html>
