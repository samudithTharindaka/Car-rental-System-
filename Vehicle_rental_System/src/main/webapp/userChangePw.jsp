<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
              background-color: #F1F2F4;
        }
        .container {
            max-width: 400px;
            margin: auto;
            margin-top:10%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color:white;
            

   					 box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Horizontal offset, Vertical offset, Blur radius, Spread radius, Color */

        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
        .done{
        	color:green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Change Password</h2>
        <form action="UserServlet" method="get">
            <label for="currentPassword">Current Password:</label><br>
            <input type="password" id="currentPassword" name="currentPassword" required><br>
            <label for="newPassword">New Password:</label><br>
            <input type="password" id="newPassword" name="newPassword" required><br>
            <label for="confirmPassword">Confirm New Password:</label><br>
            <input type="password" id="confirmPassword" name="confirmPassword" required><br>
            <input type="submit" value="Change Password">
            
            <input type="hidden" value="<%= id %>" name= "userId">
            <input type="hidden" value="changePW" name= "task"> 
            <a href="registeredUser.jsp">back</a>
        </form>
        
        <div class="error">
            ${res}
        </div>
           <div class="done">
            ${resDone}
        </div>
    </div>
</body>
</html>
