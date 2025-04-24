<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TLabUser loginUser = (TLabUser) session.getAttribute("loginUser");

    //priority manage
    if (loginUser == null || loginUser.getUtid() != 1) {
        response.sendRedirect("beikemain.jsp");
        return;
    }

    List<TEquipment> equipmentList = equipmentService.getEquipmentByCreator(loginUser.getUserid());
    request.setAttribute("equipmentList", equipmentList);


%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <!--begin to css of page-->
    <style type="text/css">
        /* Border styles */
        .title {
            width: 100%;
            height: 30px;
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

        #table-2 {
            width: 85%;
            margin-top: 10px;
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
            text-align: center;
        }

        .s3 {
            font-size: 14px;
            font-weight: 400;
            color: #575757;
            text-align: left;
        }

        .s4 {
            font-size: 14px;
            font-weight: 400;
            color: #009ACD;
            text-align: left;
        }

        .s5 {
            font-size: 14px;
            font-weight: 400;
            color: #575757;
            text-align: center;
            text-decoration: none;
            flex-direction: row;
        }

        .s6 {
            font-size: 20px;
            font-weight: 400;
            color: #FF0000;
            padding: 20px;
            text-align: center;
        }

        .s7 {
            font-size: 16px;
            font-weight: 400;
            color: #000000;
            padding: 10px;
            text-align: left;
        }

        .s8 {
            font-size: 16px;
            font-weight: 400;
            color: #FF8C00;
            padding: 10px;
            text-align: left;
            text-decoration: none;
        }

        .s9 {
            font-size: 24px;
            color: #3333CC;
            font-weight: 600;
            width: 400px;
            text-align: left;
        }

        .titletd {
            background: #800080;
            border: #800080 1px solid;
            font-size: 14px;
            color: #fff;
        }

        .titletd2 {
            background: #ffffff;
            font-size: 14px;
            color: #FF7F50;
        }

        #table-2 td {
            border-bottom: #666666 1px dashed;
        }

        .date1 {
            margin-left: 10px;
            margin-top: 3px;
            width: 100px;
            height: 45px;
            background: #0000ff;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 5px 5px;
        }

        .date2 {
            margin-left: 10px;
            margin-top: 3px;
            width: 100px;
            height: 45px;
            background: #FF8000;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 5px 5px;
        }

        .onorder {
            margin-left: 10px;
            margin-top: 3px;
            width: 50px;
            height: 20px;
            background: #FF8000;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 10px 5px;
        }

        .isend {
            margin-left: 10px;
            margin-top: 3px;
            width: 50px;
            height: 20px;
            background: #999999;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 10px 5px;
        }

        .button {
            margin-left: 3px;
            margin-top: 3px;
            background: #FF8000;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 5px 5px;
            text-decoration: none;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 200px;
            height: 23px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 2px;
            margin-bottom: 2px;
        }

        .orgbuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #ffffff solid;
            background-color: #FF8000;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
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
            width: 80px;
            height: 15px;
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
            width: 80px;
            height: 15px;
            margin-left: 15px;
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

        .navbar {
            padding-bottom: 90px;
        }
    </style>
    <!-- end of css of page -->
</head>
<body style="background:#e7edfe">
<center>

    <!--begin to navigation bar menu -->
    <div class="navbar" style="background:#e7edfe">
        <%@include file="navigationbar.jsp" %>
    </div>
    <!-- end of navigation bar menu-->
    <!-- beginning of administrator information-->
    <div style="margin-top:30px;width:85%;border:0.5px solid #CCC"></div>
    <table id="table-1">
        <tbody class="body">
        <tr>
            <td width="10%" style="text-align:right; " class="s3">College：</td>
            <td colspan=3 width="90%" style="text-align:left;color:blueviolet" class="s2">${loginUser.collegename}</td>
        </tr>
        <tr>
            <td width="20%" style="text-align:right;padding-top:20px" class="s5">USER ACCOUNT：</td>
            <td width="30%" style="text-align:left; padding-top:20px" class="s5">${loginUser.userid}</td>
            <td width="20%" style="text-align:right; padding-top:20px" class="s5">USER NAME：</td>
            <td width="30%" style="text-align:left; padding-top:20px" class="s5">${loginUser.name}</td>
        </tr>
        <tr>
            <td width="20%" style="text-align:right; padding-top:10px" class="s5">TELEPHONE：</td>
            <td width="30%" style="text-align:left; padding-top:10px" class="s5">${loginUser.phone}</td>
            <td width="20%" style="text-align:right; padding-top:10px" class="s5">MAIL：</td>
            <td width="30%" style="text-align:left; padding-top:10px" class="s5">${loginUser.mail}</td>
        </tr>

        </tbody>
    </table>
    <!-- end of administrator information-->


    <!--beginning of the list of equipment added by the admin-->
    <table id="table-2" cellspacing=0 cellpadding=0>
        <thead class="head">
        <tr style="line-height: 40px; text-align: center;">
            <td style="width:25%;" class="titletd">Equimpent Name</td>
            <td style="width:35%;" class="titletd">Section</td>
            <td style="width:25%;" class="titletd">Date Created</td>
            <td style="width:15%;" class="titletd"></td>
        </tr>

        </thead>
        <tbody class="body">
        <c:forEach items="${equipmentList}" var="obj">
            <tr>
                <td class="s5"><p>${obj.equipmentname}</p></td>
                <td class="s5"><p>${obj.labname}</p></td>
                <td class="s5"><p>${obj.createddate}</p></td>
                <td class="s5">
                    <a class="button3" href="equipmentinfo.jsp?eqid=${obj.eqid}">Detail</a> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="button2"  href="../../equipmentmanage/delete?eqid=${obj.eqid}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--ending of the list of equipment added by the admin-->
</center>
</body>
</html>

