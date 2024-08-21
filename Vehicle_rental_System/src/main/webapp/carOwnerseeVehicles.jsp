<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrations</title>
    <style>
    table {
        border-collapse: collapse;
        width: 80%;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    button,a {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
    
</head>
<body>
    <h1>Vehicle set</h1>
    <a href="carOwner.jsp" >Back</a>

    <%-- JavaScript alert if result is "false" --%>
    <c:if test="${param.result == 'false'}">
        <script type="text/javascript">
            alert('No Registrations Done yet');
        </script>
    </c:if>
<center>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Type</th>
            <th>Model Name</th>
            <th>Brand</th>
            <th>No. of Seats</th>
            <th>Price</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="vehicle" items="${vehicles}">
            <tr>
                <td>${vehicle.id}</td>
                <td>${vehicle.vType}</td>
                <td>${vehicle.vModelName}</td>
                <td>${vehicle.vBrand}</td>
                <td>${vehicle.noOfSeats}</td>
                <td>${vehicle.price}</td>
                <td>${vehicle.status}</td>
                <td>
                    <form action="vehicleServelet">
                        <input type="hidden" value="${vehicle.id}" name="vehicleId">
                        <input type="hidden" value="${vehicle.ownerId}" name="id">
                        <input type="hidden" value="${vehicle.status eq 'Unavailable' ? 'updateToAvailable' : 'updateToUnavailable'}" name="task">
                        <button type="submit" class="btn btn-primary">
                            <c:choose>
                                <c:when test="${vehicle.status == 'Unavailable'}">Make Available</c:when>
                                <c:otherwise>Make Unavailable</c:otherwise>
                            </c:choose>
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    </center>
</body>
</html>
