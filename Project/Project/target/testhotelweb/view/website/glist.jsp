<%@include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<TLabUser> labUserList = labUserService.GetLabUserList(null);
    request.setAttribute("labUserList", labUserList);

%>

<html>
<head>
    <title>Title</title>
    <style>
        .gridbox {
            display: grid;
          grid-template-columns: auto auto auto;

        }

    </style>


</head>
<body>


<div class="gridbox">
    <c:forEach items="${labUserList}" var="obj">
    <div>
            ${obj.name}
    </div>
    </c:forEach>
</div>
</body>
</html>
