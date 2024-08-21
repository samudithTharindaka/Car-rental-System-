<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrations</title>
    <style>
    table {
        border-collapse: collapse;
        width: 70%;
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
<div class="col-6"><h1 >Registration List</h1></div>
<div class="col-3"></div>
<div class="col-3"><a href="carOwner.jsp" class="btn btn-primary">back</a></div>

</div>

 </div>
   
<center>
    <%-- JavaScript alert if result is "false" --%>
    <c:if test="${param.result == 'false'}">
        <script type="text/javascript">
            alert('No Registrations Done yet');
        </script>
    </c:if>

    <table border="1">
        <tr>
        	<th>Id</th>
            <th>Type</th>
            <th>Model Name</th>
            <th>Brand</th>
            <th>No. of Seats</th>
            <th>Price</th>
            <th>Status</th>
            <th></th>
        </tr>
        <c:forEach var="application" items="${Applications}">
            <tr>
            	<td>${application.id}</td>
                <td>${application.vType}</td>
                <td>${application.vModelName}</td>
                <td>${application.vBrand}</td>
                <td>${application.noOfSeats}</td>
                <td>${application.price}</td>
                <td>${application.status}</td>
                <td>
             	<form action="applicationServlet">
                        <input type="hidden" value="${application.id}" name="applicationId">
                        <input type="hidden" value="${application.ownerId}" name="id">
                         <input type="hidden" value="deleteApllication" name="task">
                        
                     
                        <button type="submit" class="btn btn-primary">
							Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    </center>
</body>
</html>
