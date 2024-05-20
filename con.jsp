<!doctype html>
<%@page import="java.sql.*,java.io.*"%>
<html>
<head>
<title>Connection with mysql database</title>
<meta charset="UTF-8">
</head>
<body>
<h1>Connection Status</h1>
<%
try{
String connectionURL="jdbc:mysql://localhost:3306/demobase";
Connection connection=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection=DriverManager.getConnection(connectionURL,"root","Pyari$$");
if(!connection.isClosed())
%>
<b><font size="+3" color="green"></b>
<%
out.println("Successfully connected to"+"mysql server using TCP/IP.............");
connection.close();
}
catch(Exception ex)
{
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("unable to connect database.");
}
%>
</font>
</body>
</html>
