<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Account Form</title>
</head>
<body>
<form action="insertnewaccountadmin.jsp" method="post"><br>
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    Name: <input type="text" name="Name"><br>
    Email: <input type="text" name="Email"><br><br>
    Address<br>
    State: <input type="text" name="State"><br>
    Ciy: <input type="text" name="City"><br>
    Apartment Number: <input type="text" name="ApartmentNumber"><br>
    Street: <input type="text" name="StreetName"><br>
    Zipcode: <input type="text" name="Zipcode"><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>