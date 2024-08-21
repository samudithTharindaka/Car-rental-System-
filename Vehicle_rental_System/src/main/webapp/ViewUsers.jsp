<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>User List</title>
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
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        .card {
            width: 45%;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card-header {
            background-color: #262A2E;
            color: #fff;
            padding: 10px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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
        .dashboard .back-button {
    color: #fff; /* White text color */
    text-decoration: none; /* Remove underline */
}
    </style>
</head>
<body>
<div class="dashboard">
<div class="row">
	<div class="col-6"><h1 >Admin Dashboard</h1></div>
	<div class="col-3"></div>
	<div class="col-3">
	<center>
		<a href="admin.jsp" class="back-button" >back</a>
		</center>
	</div>
</div>
</div>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1>User List</h1>
            </div>
            <div class="card-body">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.gmail}</td>
                            <td>${user.phoneNumber}</td>
                            <td>${user.role}</td>
                            <td>
                                <form action="UserServlet">
                                    <input type="hidden" value="${user.id}" name="userId">
                                    <input type="hidden" value="deleteUser" name="task">
                                    <button type="submit" class="btn">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h1>New Registrations List</h1>
            </div>
            <div class="card-body">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="user1" items="${newUsers}">
                        <tr>
                            <td>${user1.id}</td>
                            <td>${user1.name}</td>
                            <td>${user1.gmail}</td>
                            <td>${user1.phoneNumber}</td>
                            <td>${user1.role}</td>
                            <td>
                                <form action="UserServlet">
                                    <input type="hidden" value="${user1.id}" name="userId">
                                    <input type="hidden" value="acceptUser" name="task">
                                    <button type="submit" class="btn">Verify</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
