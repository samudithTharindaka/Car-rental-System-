<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View vehicles</title>
</head>
<body>
   
<style>
.dashboard{
	padding-top:10vh;
	padding-left:5%;
	padding-bottom:8vh;
    background-color:#262A2E; /* Pale background color */
    font-family: 'Open Sans', sans-serif; /* Use Open Sans font */
    color: #ffffff; /* White text color */
    margin-bottom:5%;
    
	
	}
	 body {
            overflow-x: hidden; /* Disable horizontal scrolling */
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card {
            width: 23%; /* Adjust the width as needed */
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box; /* Ensure padding and border are included in the width */
        }

        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card h2 {
            margin-top: 0;
        }
   </style>
	<%
		String id = request.getParameter("id");
	
	%>
	
    <%-- JavaScript alert if result is "false" --%>
    <c:if test="${param.result == 'false'}">
        <script type="text/javascript">
            alert('No any vehicle Available!');
        </script>
    </c:if>
<div class="dashboard">
<h1 >View Vehicles</h1>
<a href="registeredUser.jsp" class="btn btn-primary">back</a>
 </div>
<div class="row" style="padding-left:4%;padding-right:4%;">
        <c:forEach var="vehicle" items="${vehicles}">
         	<div class="card col-3" style="width: 23%; margin-right:1.5%;">
  			<img src="images/placeholder.jpeg" class="card-img-top" alt="...">
  			<div class="card-body">
    			<h5 class="card-title">${vehicle.vModelName}</h5>
      			<p><strong>Type:</strong> ${vehicle.vType}</p>
                <p><strong>Brand:</strong> ${vehicle.vBrand}</p>
                <p><strong>No. of Seats:</strong> ${vehicle.noOfSeats}</p>
                <p><strong>Price:</strong> ${vehicle.price}</p>
                <p><strong>Status:</strong> ${vehicle.status}</p>
     			<a href="userBookCar.jsp?id=<%= id %>&vid=${vehicle.id}&price=${vehicle.price}&vtype=${vehicle.vType}" class="btn btn-primary">Book this ${vehicle.vType}</a>
  			</div>
			</div>
        </c:forEach>
    </div>
    

</body>
</html>
