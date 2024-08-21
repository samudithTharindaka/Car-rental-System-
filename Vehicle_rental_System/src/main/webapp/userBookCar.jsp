<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String vehiclePricePerDay=request.getParameter("price");
String vtype= request.getParameter("vtype");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book the <%= vtype %></title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h2 {
        color: #007bff;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        margin-top: 10px;
        display: block;
    }

    input[type="text"],
    input[type="date"],
    input[type="number"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"],btn {
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
    
</head>
<body>

<h2>Book the <%= vtype %></h2>

<form id="bookingForm" action="bookingServlet" method="get">
    <label for="userId">User ID:</label><br>
    <input type="text" id="userId" name="userId" value="${param.id}" readonly><br>
    <input type="hidden" name="task" value="booktheCar">
    
    <label for="vehicleId">Vehicle ID:</label><br>
    <input type="text" id="vehicleId" name="vehicleId" value="${param.vid}" readonly><br>
    
    <label for="bookingDate">Booking Start Date:</label><br>
    <input type="date" id="startDate" name="startDate" required><br>
    
    <label for="endDate">Booking End Date:</label><br>
    <input type="date" id="endDate" name="endDate" required><br>
    
    <label for="duration">Duration (in days):</label><br>
    <input type="number" id="duration" name="duration" min="1" readonly><br>
    
    <label for="totalPrice">Total Price:</label><br>
    <input type="text" id="totalPrice" name="totalPrice" readonly><br>
    
    <!-- Change type to button to prevent form submission -->
    <a href="registeredUser.jsp" class="btn btn-primary">back</a>
    <input type="submit" value="Book <%= vtype %>">
</form>

<script>
document.getElementById("startDate").addEventListener("change", calculatePrice);
document.getElementById("endDate").addEventListener("change", calculatePrice);

function calculatePrice() {
    var startDate = new Date(document.getElementById("startDate").value);
    var endDate = new Date(document.getElementById("endDate").value);
    
    // Calculate the duration in days
    var duration = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24));
    document.getElementById("duration").value = duration;
    
    // Calculate the total price (assuming price per day is available as a variable)
    var pricePerDay = <%= vehiclePricePerDay %>;
    var totalPrice = duration * pricePerDay;
    document.getElementById("totalPrice").value = totalPrice;
}
</script>

</body>
</html>

