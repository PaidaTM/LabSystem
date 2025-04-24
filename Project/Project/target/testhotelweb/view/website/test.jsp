<%@include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String s_utid = request.getParameter("utid");
    int ud = 0;
    if (s_utid != null && !s_utid.equals("")) {
        ud = Integer.parseInt(s_utid); //Convert string to integer
    }

    String firstname = null;
    TLabUser user = new TLabUser();
    user.setFirstname(request.getParameter("firstname"));
    List<TLabUser> labUserList = labUserService.GetLabUserList(user.getFirstname(), ud);
    request.setAttribute("labUserList", labUserList);
    request.setAttribute("ud", ud);
%>
<html>
<head>
    <title>Title</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Cabin:400);

        .webdesigntuts-workshop {

            text-align: center;
            width: 100%;
        }

        .webdesigntuts-workshop:before {
            background: #444;
            /*background: linear-gradient(left, #151515, #444, #151515);*/
            top: 192px;
        }

        .webdesigntuts-workshop:after {
            /*background: #000;*/
            /*background: linear-gradient(left, #151515, #000, #151515);*/
            top: 191px;
        }

        .webdesigntuts-workshop form {
            background: #111;
            /*background: linear-gradient(#1b1b1b, #111);*/
            /*border: 1px solid #000;*/
            border-radius: 5px;
            box-shadow: inset 0 0 0 1px #272727;
            display: inline-block;
            font-size: 0px;
            padding: 10px;
            margin-bottom: 20px;
            z-index: 1;
        }

        .webdesigntuts-workshop input {
            background: #222;
            background: linear-gradient(#333, #222);
            border: 1px solid #444;
            border-radius: 5px 0 0 5px;
            /*box-shadow: 0 2px 0 #000;*/
            color: #888;
            display: block;
            float: left;
            font-family: 'Cabin', helvetica, arial, sans-serif;
            font-size: 13px;
            font-weight: 400;
            height: 40px;
            padding: 0 10px;
            /*text-shadow: 0 -1px 0 #000;*/
            width: 200px;
        }

        .ie .webdesigntuts-workshop input {
            line-height: 40px;
        }

        .webdesigntuts-workshop input::-webkit-input-placeholder {
            color: #888;
        }

        .webdesigntuts-workshop input:-moz-placeholder {
            color: #888;
        }

        .webdesigntuts-workshop input:focus {
            animation: glow 800ms ease-out infinite alternate;
            background: #e7edfe;
            background: linear-gradient(#333933, #222922);
            border-color: #393;
            box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
            color: #efe;
            outline: none;
        }

        .webdesigntuts-workshop input:focus::-webkit-input-placeholder {
            color: #efe;
        }

        .webdesigntuts-workshop input:focus:-moz-placeholder {
            color: #efe;
        }

        .webdesigntuts-workshop button {
            background: #222;
            background: linear-gradient(#333, #222);
            box-sizing: border-box;
            border: 1px solid #444;
            /*border-left-color: #000;*/
            border-radius: 0 5px 5px 0;
            /*box-shadow: 0 2px 0 #000;*/
            color: #fff;
            display: block;
            float: left;
            font-family: 'Cabin', helvetica, arial, sans-serif;
            font-size: 13px;
            font-weight: 400;
            height: 40px;
            line-height: 40px;
            margin: 0;
            padding: 0;
            position: relative;
            /*text-shadow: 0 -1px 0 #000;*/
            width: 80px;
        }

        .webdesigntuts-workshop button:hover,
        .webdesigntuts-workshop button:focus {
            background:#e7edfe;
            background: linear-gradient(#393939, #292929);
            color: rgb(179, 178, 238);
            outline: none;
        }

        .webdesigntuts-workshop button:active {
            background: #292929;
            background: linear-gradient(#393939, #292929);
            /*box-shadow: 0 1px 0 #691313, inset 1px 0 1px #222;*/
            top: 1px;
        }

        @keyframes glow {
            0% {
                border-color: rgb(159, 137, 239);
                box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000000;
            }
            100% {
                border-color: #e7edfe;
                box-shadow: 0 0 20px rgba(55, 63, 169, 0.6), inset 0 0 10px rgba(53, 38, 111, 0.4), 0 2px 0 #917be7;
            }
        }

    </style>
    <style>

        .sb {

            font-size: 24px;
            color: #7f7fee;
            font-weight: 600;
            width: 400px;
            text-decoration: none;
            text-underline: none;
            text-align: center;

        }

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
            border: 2px solid #fff;
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
            object-fit: fill;
            text-decoration: none;
            /*filter: grayscale(100);*/

        }

        .cc {
            opacity: 0;
            transition: opacity 1s ease-in;
            text-decoration: none;

        }

        .card:hover > .cc {
            opacity: 1;
            display: ruby;
            text-decoration: none;
            text-underline: none;

        }

        }


        <c:forEach  items="${labUserList}" var="up" >
        .card0 {
        <%--background: url("img/${up.profilephoto}") center center no-repeat;--%>
            /*background-size: 300px;*/
            /*object-fit: cover;*/
        }

        .card0:hover {
        <%--    /*  background: url("img/--%><%--${up.profilephoto} ") left center no-repeat;--%><%--    background-size: 600px;*/--%>


        }

        </c:forEach>
        .card0:hover h2 {
            opacity: 1;
            color: white;
            text-decoration: none;
            text-underline: none;
        }

        .card0:hover .fa {
            opacity: 1;
        }

        h2 {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            color: white;
            margin: 20px;
            opacity: 0;
            transition: opacity 1s;
            text-decoration: none;
            text-underline: none;

        }

        h2:link {
            color: white;
        }

        h2:visited {
            color: white;
        }

        h2:hover {
            color: white;
        }

        h2:active {
            color: white;
        }

        .fa {
            opacity: 0;
            transition: opacity 1s;
        }

        .icons {
            position: absolute;
            fill: #FFFFFF;
            color: #FFFFFF;
            height: 130px;
            top: 226px;
            width: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
            border: #FFFFFF 5px;
            border-radius: 10px;
        }

        .navbar {
            padding-bottom: 50px;
            background: #e7edfe;
        }

        .table tr td {
            border: 1px solid #ccc;
        }

        .gridbox {
            display: grid;
            grid-template-columns: auto auto auto;
            padding-top: 20px;
            row-gap: 40px;
            padding-bottom: 50px;

        }
    </style>
    <script>
        <c:forEach items="${labUserList}" var="obj">

        function userpage() {
            <%--window.open("userinfo.jsp?userid=${obj.userid}");--%>
            window.location.href = "profile.jsp?userid=${obj.userid}";
        }


        </c:forEach>
    </script>
</head>
<body style="background:#e7edfe">
<div class="navbar" style="background:#e7edfe; z-index: 2">
    <%@include file="navigationbar.jsp" %>
</div>
<center>
<div class="sample twelve"  style="width:85%;height:30px;padding-top: 60px; padding-bottom: 50px ">
    <section class="webdesigntuts-workshop">
        <form action="" method="">
            <input type="search" placeholder="Search by name" name="firstname" value="${firstname}">
            <button type="submit">Search</button>
            <button> <a style="text-decoration: none; text-underline: none; color: #FFFFFF" href="usernamelist.jsp?utid=${ud}">Name_List</a></button>
        </form>
    </section>
</div>
</center>
<div class="contained" style="width:85%;height:30px;margin:10px auto">
    <div class="gridbox">
        <c:forEach items="${labUserList}" var="obj">
            <div>
                <div class="card card0" style="background: url(img/${obj.profilephoto})  center center no-repeat;
                        background-size: 300px;
                        object-fit: fill;">
                    <div class="cc" style="background: url(img/${obj.profilephoto}) left center no-repeat;
                            background-size: 600px;">
                        <a href="profile.jsp?userid=${obj.userid}" style="text-decoration: none;text-underline: none">
                            <div class="border">
                                <h2 style="text-decoration: none; text-underline: none;color: black">
                                        ${obj.firstname}
                                    <br>
                                        ${obj.lastname}
                                </h2>
                                <div class="icons">
                                    <i class="fa fa-email" aria-hidden="true">

                                        <object data="assets/svg/redmail.svg" width="28px" height="24px"></object>
                                    </i>
                                    <i class="fa fa-phone" aria-hidden="true">
                                        <object data="assets/svg/phone.png" width="40px" height="40px"></object>
                                    </i>
                                    <i class="fa fa-college" aria-hidden="true">
                                        <object data="assets/svg/university.png" width="28px" height="28px"></object>
                                    </i>

                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

