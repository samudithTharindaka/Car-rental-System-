<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #262A2E;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 5px 10px;
            background-color: #262A2E;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="dashboard" style="background-color:#262A2E; color:#ffffff; padding:20px;">
    <h1>Registration List</h1>
    	<center>
		<a href="admin.jsp" class="back-button" >back</a>
		</center>

    <c:if test="${param.result == 'false'}">
        <script type="text/javascript">
            alert('No Registrations Done yet');
        </script>
    </c:if>
    
    <c:if test="${param.result == 'accepted'}">
        <script type="text/javascript">
            alert('Successfully Added!');
        </script>
    </c:if>
</div>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Type</th>
        <th>Model Name</th>
        <th>Brand</th>
        <th>No. of Seats</th>
        <th>Price</th>
        <th>Option</th>
    </tr>
    <c:forEach var="application" items="${Applications}">
        <tr>
            <td>${application.id}</td>
            <td>${application.vType}</td>
            <td>${application.vModelName}</td>
            <td>${application.vBrand}</td>
            <td>${application.noOfSeats}</td>
            <td>${application.price}</td>
            <td>
                <form action="applicationServlet" method="get">
                    <input type="hidden" value="accept" name="task">
                    <input type="hidden" value="${application.id}" name="id">
                    <button type="submit" class="btn">Approve</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
