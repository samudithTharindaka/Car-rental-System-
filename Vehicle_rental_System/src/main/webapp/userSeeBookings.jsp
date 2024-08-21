<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </style>
</head>
<body>
<div class="dashboard">
<div class="row">
<div class="col-6"><h1 >View Bookings</h1></div>
<div class="col-3"></div>
<div class="col-3"><a href="registeredUser.jsp" class="btn btn-primary">back</a></div>

</div>

 </div>
    <div class="container">
        <h1 class="text-center">Booking List</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>User ID</th>
                            <th>Vehicle ID</th>
                            <th>Date From</th>
                            <th>Price</th>
                            <th>No. of Days</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${booking}">
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.userId}</td>
                                <td>${book.vid}</td>
                                <td>${book.startingDate}</td>
                                <td>${book.duration}</td>
                                <td>${book.total}</td>
                                <td>
                                    <form action="bookingServlet">
                                        <input type="hidden" value="${book.id}" name="bookId">
                                        <input type="hidden" value="deletbooking" name="task">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
