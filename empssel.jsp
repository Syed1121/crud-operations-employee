<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Karim Tech - Employee Registration</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
    body {
      background-image: url('/mypro/company.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: #fff;
      font-family: Arial, sans-serif;
    }
    .navbar {
      background-color: rgba(0,0,0,0.7);
    }
    .navbar-brand, .navbar-nav .nav-link {
      color: #fff;
      font-weight: bold;
    }
    .navbar-brand:hover, .navbar-nav .nav-link:hover {
      color: #f8f9fa;
    }
    .jumbotron {
      background-color: rgba(0,0,0,0.5);
      color: #fff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);
    }
    .navbar-nav .nav-link:hover {
      color: blue !important; 
    }
    .container {
      margin-top: 20px;
    }
    .form-error {
      display: none;
      color: #ff0000;
    }
    td {
      color: white;
    }
  </style>
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="#">Karim Tech</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/mypro/home.html">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empins.jsp">Insert</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empasel.jsp">List</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empssel.jsp">Record</a>
          </li>
	  <li class="nav-item">
            <a class="nav-link" href="/mypro/del.jsp">Delete</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
    <div class="jumbotron">
        <marquee width="100%" behavior="scroll" bgcolor="black">  
            Now you can insert employee details....................
        </marquee>  
        <br>
<form name="fm1" method="POST" action="/mypro/empssel.jsp">
    Emloyee Number:<input type="text" name="teno"><br><br>
          <input type="submit" value="Submit" class="btn btn-primary">
          <input type="reset" value="Reset" class="btn btn-secondary">
</form>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String driver = "org.gjt.mm.mysql.Driver";
String QUERY = "select eno,ename,esal,egrade from myemp where eno =?";
try {
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata", "root", "Pyari$$");
    String tenoParam = request.getParameter("teno");
    if (tenoParam != null && !tenoParam.isEmpty()) { // Check if tenoParam is not null or empty
        int eno = Integer.parseInt(tenoParam);
        PreparedStatement preparedStatement = connection.prepareStatement(QUERY);
        preparedStatement.setInt(1, eno);
        System.out.println(preparedStatement);

        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            String tename = rs.getString("ename");
            int tesal = rs.getInt("esal");
            String tegrade = rs.getString("egrade");
            out.println(tename);
%>
        <!-- Display entered text in animation -->
        <script>
            window.onload = function() {
                var enteredText = "<%= tename %>"; // Fetching the entered text from JSP
                var animatedText = document.getElementById("animated-text");
                var textArray = enteredText.split(""); // Splitting the text into an array of characters
                var index = 0;
                var timer = setInterval(function() {
                    animatedText.textContent += textArray[index];
                    index++;
                    if (index === textArray.length) {
                        clearInterval(timer);
                    }
                }, 100); // Speed of animation in milliseconds
            };
        </script>
<%
        }
        eno++;
    }
} catch (Exception ex) {
    out.print(ex);
}
%>
