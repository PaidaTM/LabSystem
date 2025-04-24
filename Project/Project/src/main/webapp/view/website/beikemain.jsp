<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String equipmentname = null;
    TEquipment equipment = new TEquipment();
    equipment.setEquipmentname(request.getParameter("equipmentname"));
    List<TEquipment> equipmentList = equipmentService.getEquipmentListByCondition(equipment.getEquipmentname());
    request.setAttribute("equipmentList", equipmentList);
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
            box-shadow: 0 0 5px rgba(0, 255, 0, .2), inset 0 0 5px rgba(0, 255, 0, .1), 0 2px 0 #000;
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
            background: #e7edfe;
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
                box-shadow: 0 0 5px rgba(0, 255, 0, .2), inset 0 0 5px rgba(0, 255, 0, .1), 0 2px 0 #000000;
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

        .s1 {
            width: 200px;
        }

        .s2 {
            font-size: 24px;
            color: # #3333CC;
            font-weight: 600;
            width: 400px;
        }

        .s3 {
            font-size: 14px;
            font-weight: 400;
            color: #575757;
        }

        .s4 {
            font-size: 14px;
            font-weight: 400;
            color: #009ACD;
        }

        .s5 {
            font-size: 24px;
            font-weight: 400;
            color: #EE7621;
            style =
            padding: 20px;
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

        .navbar {
            padding-bottom: 40px;
        }

    </style>
    <style>

        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

        body {
            font-family: 'Open Sans', sans-serif;
            font-weight: 300;
            line-height: 1.42em;
        }

        tr {
            line-height: 25px;
        }

        h1 {
            font-size: 3em;
            font-weight: 300;
            line-height: 1em;
            text-align: center;
            color: #4DC3FA;
        }


        .blue {
            color: #185875;
        }

        .yellow {
            color: #FFF842;
        }

        .container th h1 {
            font-weight: bold;
            font-size: 18px;
            text-align: left;
            color: #185875;
        }

        .container td {

            font-size: 18px;
            -webkit-box-shadow: 0 2px 2px -2px #0E1119;
            -moz-box-shadow: 0 2px 2px -2px #0E1119;
            box-shadow: 0 2px 2px -2px #0E1119;
        }

        .container {
            text-align: left;
            overflow: hidden;
            width: 80%;
            margin: 0 auto;
            display: table;
        }

        .container td, .container th {
            padding-bottom: 2%;
            padding-top: 2%;
            padding-left: 2%;
        }

        /* Background-color of the odd rows */
        .container tr:nth-child(odd) {
            background-color: #e6ebf5;
        }

        /* Background-color of the even rows */
        .container tr:nth-child(even) {
            background-color: #e0e9ff;
        }

        .container th {
            background-color: #1F2739;
        }

        .container td:first-child {
            color: #000000;
        }

        .container tr:hover {
            background-color: #ffffff;
            -webkit-box-shadow: 0 6px 6px -6px #0E1119;
            -moz-box-shadow: 0 6px 6px -6px #0E1119;
            box-shadow: 0 6px 6px -6px #0E1119;
        }

        .tdy {
            font-weight: bold;
            text-align: center;
        }

        .tdy:hover {
            background-color: #ffffff;
            color: #403E10;
            font-weight: bold;

            box-shadow: #e7edfe -1px 1px, #c7cddd -2px 2px, #e7edfe -3px 3px, #a4a8b4 -4px 4px, #e7edfe -5px 5px, #a0a5b3 -6px 6px;
            transform: translate3d(6px, -6px, 0);

            transition-delay: 0s;
            transition-duration: 0.4s;
            transition-property: all;
            transition-timing-function: line;
        }

        .tdx {
            text-align: center;
            font-size: 14px;
        }

        .tn {
            color: plum;
            text-decoration: none;
            text-underline: none;
            font-weight: 500;
            text-align: center;
        }

        @media (max-width: 800px) {
            .container td:nth-child(4),
            .container th:nth-child(4) {
                display: none;
            }
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

    <div class="sample twelve" style="width:85%;height:30px;padding-top: 60px; padding-bottom: 50px ">
        <section class="webdesigntuts-workshop">
            <form action="" method="">
                <input type="search" placeholder="Search by name" name="equipmentname" value="${equipmentname}">
                <button type="submit">Search</button>
            </form>

        </section>

    </div>
    <!--List of Equipment-->
    <div style="margin-top:5px;width:85%;border:0.5px solid #CCC"></div>
    <main>
        <table class="container">
            <tbody>
            <tr>
                <td class="tdy">Name</td>
                <td class="tdy">Lab_Section</td>
                <td class="tdy">Date_Created</td>
            </tr>
            <c:forEach items="${equipmentList}" var="obj">
                <tr>
                    <td class="tn"><a style="text-decoration: none; text-underline: none"
                                      href="equipmentinfo.jsp?eqid=${obj.eqid}">${obj.equipmentname}</td>
                    <td class="tdx"><c:if test="${obj.labid==1}">
                        <div >
                            <c:out value="Chemistry Laboratory"/>
                        </div>
                    </c:if>
                        <c:if test="${obj.labid==2}">
                            <div >
                                <c:out value="Physics Laboratory"/>
                            </div>
                        </c:if></td>
                    <td class="tdx">${obj.createddate}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <!-- End of container -->

    </main>
</center>
</body>
</html>
