<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String driver="org.gjt.mm.mysql.Driver";
Connection con=null;
ResultSet rs=null;
Statement stmt=null;
try
{
String url="jdbc:mysql://localhost:3306/empdata?user=root&password=Pyari$$";
con=DriverManager.getConnection(url);
stmt=con.createStatement();
}
catch(Exception ex)
{
out.print(ex.getMessage());
}
if(request.getParameter("action")!=null)
{
int eno=Integer.parseInt(request.getParameter("empeno"));
String ename=request.getParameter("empename");
int esal=Integer.parseInt(request.getParameter("empesal"));
String egrade=request.getParameter("empegrade");
stmt.executeUpdate("insert into myemp(eno,ename,esal,egrade) values('"+eno+"','"+ename+"','"+esal+"','"+egrade+"')");
response.sendRedirect("/mypro/home.html");
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
        <h4>Employee Registration</h4>
        <br>
        <form action="/mypro/empins.jsp" method="POST" id="empForm">
            <input type="hidden" name="action" value="list">
            <table class="table">
                <tr>
                    <td>ENO</td>
                    <td><input type="text" name="empeno" class="form-control"></td>
                </tr>
                <tr>
                    <td>ENAME</td>
                    <td><input type="text" name="empename" class="form-control"></td>
                </tr>
                <tr>
                    <td>ESAL</td>
                    <td><input type="text" name="empesal" class="form-control"></td>
                </tr>
                <tr>
                    <td>EGRADE</td>
                    <td><input type="text" name="empegrade" class="form-control"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Submit" class="btn btn-primary">
                        <input type="reset" value="Reset" class="btn btn-secondary">
                    </td>
                </tr>
            </table>
        </form>
        <div class="form-error" id="formError">
            Please fill in all fields.
        </div>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#empForm').submit(function(e) {
        var valid = true;
        $(this).find('input[type="text"]').each(function() {
          if ($(this).val() == '') {
            valid = false;
            $(this).next('.form-error').show();
          } else {
            $(this).next('.form-error').hide();
          }
        });
        if (!valid) {
          e.preventDefault();
          $('#formError').text('Please fill in all fields.').show();
        }
      });
    });
  </script>
</body>
</html>
