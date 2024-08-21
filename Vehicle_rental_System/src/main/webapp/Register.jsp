<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom CSS for styling */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            border-radius: 5px;
            margin-top: 50px;
        }
        .card-body {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Registration Form</h5>
                    <form action="UserServlet" method="post">
 
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>

                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>

                        <div class="form-group">
                            <label for="gmail">Gmail:</label>
                            <input type="text" class="form-control" id="gmail" name="gmail">
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber">Phone Number:</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                        </div>

                        <div class="form-group">
                            <label for="role">Role:</label>
                            <br>
                            <input type="radio" id="userRole" name="role" value="user" checked>
                            <label for="userRole"> User</label><br>
                            <input type="radio" id="carOwnerRole" name="role" value="car owner">
                            <label for="carOwnerRole"> Car Owner</label>
                        </div>

                        <button type="submit" class="btn btn-primary">Register</button>
                         <a class="btn btn-danger" href="index.jsp" style="margin-right: 20px;">Back</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Selecting the form element
        const form = document.querySelector('form');

        // Adding a submit event listener to the form
        form.addEventListener('submit', function (event) {
            // Preventing the default form submission
            event.preventDefault();

            // Validating name
            const nameInput = document.getElementById('name');
            const nameValue = nameInput.value.trim();
            if (nameValue === '') {
                alert('Please enter your name.');
                nameInput.focus();
                return;
            }

            // Validating password
            const passwordInput = document.getElementById('password');
            const passwordValue = passwordInput.value.trim();
            if (passwordValue === '') {
                alert('Please enter a password.');
                passwordInput.focus();
                return;
            }

            // Validating Gmail
            const gmailInput = document.getElementById('gmail');
            const gmailValue = gmailInput.value.trim();
            if (gmailValue === '') {
                alert('Please enter your Gmail.');
                gmailInput.focus();
                return;
            }

            // Validating Phone Number
            const phoneNumberInput = document.getElementById('phoneNumber');
            const phoneNumberValue = phoneNumberInput.value.trim();
            if (phoneNumberValue === '') {
                alert('Please enter your phone number.');
                phoneNumberInput.focus();
                return;
            }

            // Validating Role
            const userRoleInput = document.getElementById('userRole');
            const carOwnerRoleInput = document.getElementById('carOwnerRole');
            if (!userRoleInput.checked && !carOwnerRoleInput.checked) {
                alert('Please select a role.');
                return;
            }

            // If all validations pass, submit the form
            form.submit();
        });
    });
</script>


<!-- Bootstrap JS (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
