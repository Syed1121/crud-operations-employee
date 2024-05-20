<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String driver="org.gjt.mm.mysql.Driver";
Connection con=null;
ResultSet rs=null;
PreparedStatement ps = null;
try
{
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata","root","Pyari$$");
if(request.getParameter("teno")!=null)
{
int eno=Integer.parseInt(request.getParameter("teno"));
ps=con.prepareStatement("delete from myemp where eno=?");
ps.setInt(1,eno);
ps.executeUpdate();
response.sendRedirect("/mypro/home.html");
con.close();
}
}catch(Exception ex)
{
out.print(ex);
}
%>
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
    .navbar-nav .nav-link:hover {
      color: blue !important; 
    }
    .jumbotron {
      background-color: rgba(0,0,0,0.5);
      color: #fff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);
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

  <div class="container">
    <form name="fm1" method="POST" action="/mypro/del.jsp">
      <div class="form-group">
        <label for="teno">Employee Number:</label>
        <input type="text" class="form-control" id="teno" name="teno">
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <button type="reset" class="btn btn-secondary">Reset</button>
    </form>
  </div>

</body>
</html>
