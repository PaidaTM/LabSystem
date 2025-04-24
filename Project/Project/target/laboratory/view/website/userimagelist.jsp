<%@include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String s_utid = request.getParameter("utid");
    int ud = 0;
    if (s_utid != null && !s_utid.equals("")) {
        ud = Integer.parseInt(s_utid); //Convert string to integer
    }

    List<TLabUser> labUserList = labUserService.GetLabUserList(null, ud);
    request.setAttribute("labUserList", labUserList);
    List<TLabUser> userpicturelist = labUserService.getUserPicture(null);
    request.setAttribute("userpicturelist", userpicturelist);

%>

<html>
<head>
    <title>Title</title>
    <style>

        .contained {
            /*display: flex;*/
            justify-content: space-around;
            align-items: center;
            padding-left: 100px;

        }

        .border {
            height: 369px;
            width: 290px;
            background: transparent;
            border-radius: 10px;
            transition: border 1s;
            position: relative;
        }

        .border:hover {
            border: 1px solid #fff;
        }

        .card {
            height: 379px;
            width: 300px;
            border-radius: 10px;
            transition: background 0.8s;
            overflow: hidden;
            background: #000;
            box-shadow: 0 70px 63px -60px #000;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;

        }
        <c:forEach  items="${labUserList}" var="up" >
        .card0 {
            <%--background: url("img/${up.profilephoto}") center center no-repeat;--%>
           background-image: url("img/${up.profilephoto}");
            background-size: 300px;
            filter: grayscale(100);
            object-fit: cover;
        }

        .card0:hover {
            background: url("img/${up.profilephoto}") left center no-repeat;
            background-size: 600px;
        }
        </c:forEach>
        .card0:hover h2 {
            opacity: 1;
            color: black;
        }

        .card0:hover .fa {
            opacity: 1;
        }

        h2 {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            color: #fff;
            margin: 20px;
            opacity: 0;
            transition: opacity 1s;
            color: black;
        }

        .fa {
            opacity: 0;
            transition: opacity 1s;
        }

        .icons {
            position: absolute;
            fill: #000000;
            color: #000000;
            height: 130px;
            top: 226px;
            width: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
            border: #000000 5px;
            border-radius: 10px;
        }

        .navbar {
            padding-bottom: 30px;
        }

        .table tr td {
            border: 1px solid #ccc;
        }

        .gridbox {
            display: grid;
            grid-template-columns: auto auto auto;
            padding-top: 20px;

        }


    </style>

</head>
<body style="background:#e7edfe">
<div class="navbar" style="background:#e7edfe">
    <%@include file="navigationbar.jsp" %>
</div>
<%--<div style="width:85%;height:30px;margin:10px auto">--%>
<%--    <form action="">--%>
<%--        Position：<input class="editbox" type="text" name="position"></input>--%>
<%--        &nbsp; Equipment Name：<input class="editbox" type="text" name="equipmentname"></input>--%>
<%--        <button class="greenbuttoncss" type="submit">Query</button>--%>
<%--        <a class="link"href="usernamelist.jsp?utid=${ud}" >View By Name</a>--%>
<%--    </form>--%>
<%--</div>--%>
<%--<div class="contained" style="width:85%;height:30px;margin:10px auto">--%>
<%--    <div class="gridbox">--%>
<%--        <c:forEach items="${labUserList}" var="obj">--%>
<%--            <div>--%>
<%--                <div class="card card0" style="">--%>
<%--                    <div class="border">--%>
<%--                        <h2>--%>
<%--                                ${obj.firstname}--%>
<%--                            <br>--%>
<%--                                ${obj.lastname}--%>
<%--                        </h2>--%>
<%--                        <div class="icons">--%>
<%--                            <i class="fa fa-email" aria-hidden="true">--%>

<%--                                <object data="assets/svg/redmail.svg" width="28px" height="24px"></object>--%>
<%--                            </i>--%>
<%--                            <i class="fa fa-phone" aria-hidden="true">--%>
<%--                                <object data="assets/svg/phone.svg"></object>--%>
<%--                            </i>--%>
<%--                            <i class="fa fa-college" aria-hidden="true">--%>
<%--                                <object data="assets/svg/university.svg" width="24px" height="24px"></object>--%>
<%--                            </i>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
</html>
