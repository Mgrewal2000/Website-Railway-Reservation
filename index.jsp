<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
<head>
    <title>Login Website</title>
</head>
<body>
    <form action="login.jsp">
        <input type="submit" value="Login" required>
    </form>
    <form action="createAccount.jsp">
        <input type="submit" value="Create Account" required>
    </form>
</body>
</html>