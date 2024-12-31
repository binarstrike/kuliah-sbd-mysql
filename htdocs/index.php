<html>

<head>
  <title>Form Screen Center</title>
  <style>
    .tengah {
      position: absolute;
      margin-top: -100px;
      margin-left: -200px;
      left: 50%;
      top: 50%;
      width: 400px;
      height: 220px;
      background-color: #87CEFA;
    }
  </style>
</head>

<body>
  <div align="center" class="tengah">
    <p align="center">
      <font face="verdana" size="4" color="black"><b>Login Pengguna</b></font>
    </p>
    <form action="login.php" method="get">
      <font face="verdana" size="2" color="black">
        Username</br>
        <input type="text" name="username" /></br>
        Password</br>
        <input type="password" name="password" /></br></br>
        <input type="submit" value="Login" />
      </font>
    </form>
</body>

</html>