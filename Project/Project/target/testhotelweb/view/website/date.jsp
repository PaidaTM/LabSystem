
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>Demo: Current Date</h1>
<div id="p1" ></div>
<script>
    var date = new Date();
    var current_time = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
    document.getElementById("p1").innerHTML = current_time;
</script>
</body>
</html>