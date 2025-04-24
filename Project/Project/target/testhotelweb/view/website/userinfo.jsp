<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String s_userid = request.getParameter("userid");
    int userid = 0;
    if (s_userid != null && !s_userid.equals("")) {
        userid = Integer.parseInt(s_userid); //Convert string to integer
    }
    TLabUser user = labUserService.getUserByid(userid);
    request.setAttribute("user", user);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <!--begin to css of page-->
    <style type="text/css">

        #table-1 {
            width: 100%;
            margin-top: 10px;
            padding-left: 80px;
        }


        .s1 {
            width: 200px;
            padding: 10px;
        }

        .s2 {
            font-size: 24px;
            color: #3333CC;
            font-weight: 600;
            width: 400px;
        }


        .s4 {
            font-size: 16px;
            font-weight: 300;
            color: #FFFFFF;
            text-align: left;
        }

        .ar {

            line-height: 40px;
        }

        .s5 {
            font-size: 14px;
            font-weight: 400;
            color: #575757;
            text-align: center;
        }

        .s6 {
            font-size: 20px;
            font-weight: 400;
            color: #FF0000;
            text-align: center;
        }

        .s7 {
            font-size: 16px;
            font-weight: 400;
            color: #000000;
            text-align: center;
        }

        .s8 {
            font-size: 16px;
            font-weight: 400;
            color: #FF8C00;
            padding: 10px;
            text-align: center;
            text-decoration: none;
        }

        .titletd {
            background: #33CCFF;
            border: #33CCFF 1px solid;
            font-size: 14px;
            color: #fff;
        }

        #table-2 td {
            border-bottom: #666666 1px dashed;
            align-content: center;
            margin: auto;
        }

        .button {
            margin-left: 3px;
            margin-top: 3px;
            background: #FF8000;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 10pt;
            padding: 5px 5px;
            text-decoration: none;
        }

        .button2 {
            width: 100px;
            height: 21px;
            margin-left: 15px;
            margin-top: 3px;
            background: #00CC99;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 4px 4px;
            text-decoration: none;
            float: right;
        }

        .button3 {
            width: 130px;
            height: 21px;
            margin-left: 3px;
            margin-top: 3px;
            background: #FFA500;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 4px 4px;
            text-decoration: none;
            float: right;
        }

        .state {
            display: flex;
        }

        .a {

            color: green;

        }

        .b {
            color: lime;
        }

        .c {
            color: yellow;
        }

        .d {
            color: orange;
        }


        .navbar {
            padding-bottom: 90px;
        }

        .mc {
            display: flex;
            margin-left: auto;
            margin-right: auto;
        }

        .dp {
            border: #FFFFFF 5px;
            border-radius: 50%;
            width: 50px;
            height: 50px;
        }
    </style>
    <link rel="stylesheet"
          href="assets/css/print.css"
          type="text/css"
          media="print"/>
    <!-- end of css of page -->
</head>
<body style="background:#e7edfe">

<!--begin to navigation bar -->
<div class="navbar" style="background:#e7edfe">
    <%@include file="navigationbar.jsp" %>
</div>
<!-- end of navigation bar -->
<center>
    <!--beginning of user information-->
    <div class="mc">
        <div>
            <table id="table-1">
                <tbody class="body">
                <tr>
                    <td>UserName : ${user.name}</td>
                </tr>
                <tr>
                    <td>FisrtName : ${user.firstname}</td>
                </tr>
                <tr>
                    <td>LastName : ${user.lastname}</td>
                </tr>
                <tr>
                    <td>Gender : ${user.gender}</td>
                </tr>
                <tr>
                    <td>Mobile : ${user.phone}</td>
                </tr>
                <tr>
                    <td>Email : ${user.mail}</td>
                </tr>
                <tr>
                    <td>Education : ${user.educaton}</td>
                </tr>
                <tr>
                    <td>College : ${user.collegename}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div><img src="img/${user.profilephoto}" class="dp"></div>
    </div>
    <!-- end of user information-->
    <%--    <a class="button2" onclick="window.print()">Print</a>--%>
</center>
</body>
</html>

