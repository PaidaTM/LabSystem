<%@ page import="java.util.List" %>
<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String s_utid = request.getParameter("utid");
    int ud = 0;
    if (s_utid != null && !s_utid.equals("")) {
        ud = Integer.parseInt(s_utid); //Convert string to integer
    }

    TLabUser user = new TLabUser();
    user.setFirstname(request.getParameter("firstname"));
    List<TLabUser> labUserList = labUserService.GetLabUserList(user.getFirstname(), ud);
    request.setAttribute("labUserList", labUserList);
    request.setAttribute("ud", ud);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>

    <!--begin to css of page -->
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
    <style type="text/css">
        /* Border styles */
        .title {
            width: 100%;
            height: 40px;
        }

        .sysmenu {
            width: 100%;
            height: 40px;
            border-bottom: #0033FF 1px solid;
            background: #0033FF;
        }

        .sysmenu a {
            color: #fff;
        }

        .sysmenu span {
            color: #fff;
        }

        #table-1 {
            width: 85%;
            margin-top: 10px;
        }

        tr {
            line-height: 50px;
            padding: 10px;
        }

        .s0 {
            font-size: 30px;
            font-weight: bold;
            color: #000000;
            width: 400px;
            text-align: left;
        }

        .s1 {
            font-size: 30px;
            font-weight: bold;
            color: #000000;
            width: 400px;
            text-align: center;
        }

        .s2 {
            font-size: 24px;
            color: #545353;
            font-weight: 600;
            width: 400px;
            text-align: left;

        }

        .sb {

            font-size: 24px;
            color: #7f7fee;
            font-weight: 600;
            width: 400px;
            text-decoration: none;
            text-underline: none    ;

        }

        .s4 {
            font-size: 20px;
            font-weight: 500;
            color: #474a4c;
            width: 400px;
            text-align: center;
        }

        .s5 {
            font-size: 20px;
            font-weight: 500;
            color: #4f5353;
            width: 400px;
            text-align: center;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 300px;
            height: 24px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 3px;
            margin-bottom: 3px;
        }

        .greenbuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #93bee2 solid;
            background-color: #009393;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .dp {
            border-radius: 50%;
        }

        .navbar {
            padding-bottom: 30px;
        }
    </style>
    <!--end of css of page -->
</head>
<body style="background:#e7edfe">
<center>

    <!-- begin to system menum-->
    <div class="navbar" style="background:#e7edfe">
        <%@include file="navigationbar.jsp" %>
    </div>
    <!-- end of system menu-->
    <div class="sample twelve"  style="width:85%;height:30px;padding-top: 60px; padding-bottom: 50px ">
        <section class="webdesigntuts-workshop">
            <form action="" method="">
                <input type="search" placeholder="Search by name" name="firstname" value="${firstname}">
                <button type="submit">Search</button>
                <button> <a style="text-decoration: none; text-underline: none; color: #FFFFFF" href="test.jsp?utid=${ud}">Image_List</a></button>
            </form>
        </section>

    </div>
    <!--Query Toolbar-->
    <!--List of Users-->
    <div style="margin-top:5px;width:85%;border:0.5px solid #CCC"></div>
    <table id="table-1">
        <tbody class="body">
        <tr style="display: flex">
            <td class="s0">Name</td>
            <td class="s1">Education</td>
            <td class="s1">College</td>
        </tr>
        <c:forEach items="${labUserList}" var="obj">
            <!-- Beginning of user information -->
            <tr style="display: flex">
                <td class="s2">
                    <a href="profile.jsp?userid=${obj.userid}"
                       style="text-decoration:none">${obj.firstname} ${obj.lastname}</a>
                </td>
                <td class="s4">${obj.educaton}</td>
                <td class="s5">${obj.collegename}</td>
            </tr>
            <!-- end of user information -->
        </c:forEach>
        </tbody>
    </table>
</center>
</body>
</html>
