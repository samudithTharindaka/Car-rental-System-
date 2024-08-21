<!DOCTYPE html>
<html>
<head>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <meta charset="ISO-8859-1">
  <title>Login</title>
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-form {
    margin-top:40%;
      background-color: #ffffff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .login-form h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .form-control {
      border-radius: 5px;
    }
    .btn-primary {
      border-radius: 5px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <div class="login-form">
          <h2>Login</h2>
          <form action="log" method="post">
            <div class="form-group">
              <label for="email">Email address</label>
              <input type="email" class="form-control" id="email" placeholder="Enter email" name="username" required>
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
            </div>
            <br>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <a href="index.jsp" class="btn btn-danger btn-block">Back</a>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Bootstrap JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
