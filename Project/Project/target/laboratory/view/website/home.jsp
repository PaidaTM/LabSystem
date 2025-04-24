<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            background: #1e293b;

        }

        .navbar {
            padding-bottom: 90px;
            z-index: 5;
        }
    </style>
</head>
<body>
<div>
    <div class="navbar" style=" background: #1e293b" >
        <%@ include file="unidentified.html"%>
    </div >
    <div style="padding-bottom: 30px">
        <%@include file="home.html" %>
    </div>
    <div>
        <%@include file="footer1.html" %>
    </div>

</div>
</body>
</html>
