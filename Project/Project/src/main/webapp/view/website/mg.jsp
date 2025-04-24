<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LMS_Error</title>
    <style>
        .errorcontent{
            margin-left: 100px;
            width:1000px;
        }
        a{
            text-decoration: none;
            font: "sans-serif";
            font-size: 20px;
            font-weight: bold;
            color: #145a98;
        }

    </style>
</head>
<body  style="background:#e7edfe">
<table class="errorcontent">
    <tr>
        <td rowspan="2" style="width:350px">
            <img style="width: 400px; height: 400px; padding-bottom: 20px" src="../../view/website/img/ba83fa72dfe7cddb688fa2d5b71ad4f.jpg">
        </td>
        <td><center>
            <p><h2>${errMsg}</h2></p>
        </center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <a href="${backUrl}">Back to web page</a>
            </center>
        </td>
    </tr>
</table>

</body>
</html>