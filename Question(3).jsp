<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    
    <link rel = "stylesheet"  type = "text/css" href = "style23.css">
</head>
<title> Question page</title>
<h style = "color:#00ff00">Search for questions </h>
<br/>
<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

li{
    float: right;
}

li a {
    display: inline-block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: skyblue ;

}

.active{
    background-color: red;

}
</style>
<ul>
    <li><a href="tryloginsuccess.jsp" class="active">Home</a></li>
</ul>
<body>
    
    <form action="Answer(3).jsp" method="post">
        <input type="text" name="question">
        
        <input type="submit" class = "button" value="Submit">
    </form>
 <br/>
 <h style = "color:#00ff00">Ask a  question </h>
<br/>

    <form action="Ask(3).jsp" method="post">
        <input type="text" name="question">
        
        <input type="submit" class = "button" value="Submit">
    </form>
 
 <br/>
 <a href='BrowseQuestions(3).jsp'>Browse through questions and answers</a>
</body>
</html>