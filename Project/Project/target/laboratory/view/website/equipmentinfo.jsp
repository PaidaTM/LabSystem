<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String s_eqid = request.getParameter("eqid");
    int eqid = 0;
    if (s_eqid != null && !s_eqid.equals("")) {
        eqid = Integer.parseInt(s_eqid); //Convert string to integer
    }
    TEquipment equipment = equipmentService.getEquipmentByid(eqid);
    List<TDevice> deviceList = deviceService.getDeviceListByEquipmentId(equipment.getEqid());
    request.setAttribute("equipment", equipment);
    request.setAttribute("deviceList", deviceList);
    List<TLabUser> userList = labUserService.GetLabUserList(null, 0);
    request.setAttribute("userList", userList);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <!--begin to css of page-->
    <style type="text/css">


        .s1 {
            width: 290px;
            padding: 5px;
        }


        #table-2 td {
            border-bottom: #666666 1px dashed;
            align-content: center;
            margin: auto;
        }

        .button {

            background: #be88f8;
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
            background: #745d98;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 4px 4px;
            text-decoration: none;
            margin-left: 10px;
            margin-right: 10px;

        }

        .button3 {
            width: 130px;
            height: 21px;
            background: #8960c1;
            border-radius: 5px;
            color: #FFFFFF;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            padding: 4px 4px;
            text-decoration: none;
            margin-left: 10px;
            margin-right: 10px;

        }

        .navbar {
            padding-bottom: 50px;
        }

        .a {

            color: green;

        }

        .b {
            color: #6ca73d;
        }

        .c {
            color: yellow;
        }

        .d {
            color: orange;
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
    <!-- end of css of page -->
</head>
<body style="background:#e7edfe">

<!--begin to system menu -->
<div class="navbar">
    <%@include file="navigationbar.jsp" %>
</div>
<!-- end of system menu-->
<center>
    <!--begin of menu of equipment operation-->
    <div style="clear:both"></div>

    <div style="width:70%;height:40px; margin-top:10px; display: flex">

        <a class="button2"  href="../../equipmentmanage/delete?eqid=${equipment.eqid}">Delete</a>
        <a class="button2" style="display: block;" href="editequipment.jsp?eqid=${equipment.eqid}">Edit Equipment</a>
        <a class="button3" style="width:130px; display: block;" href="equipmentmaintenance.jsp?eqid=${equipment.eqid}">Maintain
            Equipment</a>
        <a class="button3" style="width:130px; display: block;" href="addequipment.jsp">Add Equipment</a>

    </div>
    <!--begin of equipment information-->
    <div>
        <!-- Start of container -->
        <main>
            <table class="container">
                <tbody>
                <tr>
                    <td class="tdy">Name</td>
                    <td class="tdy">Creator</td>
                    <td class="tdy" colspan="3">Lab_Section</td>
                </tr>
                <tr>
                    <td class="tn"> ${equipment.equipmentname}</td>
                    <%
                        TLabUser creator = labUserService.getUserByid(equipment.getCreatorid());
                        request.setAttribute("creator", creator);
                    %>
                    <td class="tdx">${creator.name}</td>
                    <td class="tdx" colspan="3">
                        <c:if test="${equipment.labid==1}">
                            <div >
                                <c:out value="Chemistry Laboratory"/>
                            </div>
                        </c:if>
                        <c:if test="${equipment.labid==2}">
                            <div >
                                <c:out value="Physics Laboratory"/>
                            </div>
                        </c:if>
                    </td>
                </tr>
                <tr style="text-align: center">
                    <td style="text-align: center;" colspan="5">Devices under this Equipment</td>
                </tr>
                <tr>
                    <td class=""></td>
                    <td class="tdy">DEVICE_NAME</td>
                    <td class="tdy">LAB_SECTION</td>
                    <td class="tdy">STATUS</td>
                    <td class="tdy"><a class="button" href="adddevice.jsp?eqid=${equipment.eqid}">Add
                        Device</a></td>
                </tr>
                <c:forEach items="${deviceList}" var="obj">
                    <tr>
                        <td class="s1">
                            <a href="deviceinfo.jsp?dvcid=${obj.dvcid}"><img
                                    style="width:250px;height:150px;border-radius:5px"
                                    src="img/${obj.imagelist}"></a>
                        </td>
                        <td class="tdx"><a
                                style="font-weight:bold; font-size: 24px; text-decoration: none; text-underline: none; color: #505583"
                                href="deviceinfo.jsp?dvcid=${obj.dvcid}">${obj.name}</a></td>
                        <td class="tdx" style="font-weight: bolder">${obj.labname}</td>
                        <td class="tdx" colspan="3" style="text-align: center; font-weight: bold ">
                            &nbsp;<c:if test="${obj.status==1}">
                            <div class="a">
                                <c:out value="Excellnet"/>
                            </div>
                        </c:if>
                            <c:if test="${obj.status==2}">
                                <div class="b">
                                    <c:out value="Good"/>
                                </div>
                            </c:if>
                            <c:if test="${obj.status==3}">
                                <div class="c">
                                    <c:out value="Fair"/>
                                </div>
                            </c:if>
                            <c:if test="${obj.status==4}">
                                <div class="d">
                                    <c:out value="Poor"/>
                                </div>
                            </c:if>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </main>
        <!-- End of container -->
    </div>
    <!-- end of hotel information-->

    <!--beginning of sub device list under the equipment-->
</center>
</body>
</html>

