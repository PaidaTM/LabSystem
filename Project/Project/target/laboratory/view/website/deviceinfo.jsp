<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String s_dvcid = request.getParameter("dvcid");
    int dvcid = 0;
    if (s_dvcid != null && !s_dvcid.equals("")) {
        dvcid = Integer.parseInt(s_dvcid); //Convert string to integer
    }
    TDevice device = deviceService.getDeviceById(dvcid);
    request.setAttribute("device", device);
    List<TLabUser> userList = labUserService.GetLabUserList(null, 0);
    request.setAttribute("userList", userList);

    TLabUser creator = labUserService.getUserByid(device.getCreatorid());
    TLabUser updator = labUserService.getUserByid(device.getUpdaterid());
    TEquipment parentequipment = equipmentService.getEquipmentByid(device.getEqid());
    request.setAttribute("parentequipment", parentequipment);
    request.setAttribute("creator", creator);
    request.setAttribute("updator", updator);


%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <!--begin to css of page-->
    <style type="text/css">

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
            color: #191a22;
            font-weight: 600;
            width: 400px;
        }


        .s4 {
            font-size: 16px;
            font-weight: 300;
            color: #191a22;
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
            color: #000000;
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
    <!--begin of menu of device operation-->
    <div style="clear:both"></div>
    <div style="width:85%;height:40px; margin-top:10px;">
        <a class="button3" style="width:130px; display: block;" href="adddevice.jsp">Add device</a>
        <a class="button2" style="display: block;" href="editdevice.jsp?dvcid=${device.dvcid}">Edit</a>
        <a class="button2" href="../../devicemanage/delete?dvcid=${device.dvcid}">Delete</a>
    </div>
    <!--end of  menu of device operation-->
    <div style="clear:both"></div>
    <div style="margin-top:5px;width:85%;border:0.5px solid #CCC"></div>
    <!--begin of device information-->
    <table id="table-1">
        <tbody class="body">
        <tr>
            <td>
                <img style="width:450px; height:280px;border-radius:5px" src="img/${device.imagelist}">
            </td>
            <td style="text-align:center">
                <table width="100%" height="100%">
                    <tr style="line-height: 60px;">
                        <td class="s2">
                            ${device.name}</td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            LabName : ${device.labname}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">

                            Created By : ${creator.firstname}  ${creator.lastname}
                        </td>
                        <td class="s4">
                            Date Created : ${device.createddate}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Updated By : ${updator.firstname}  ${updator.lastname}
                        </td>
                        <td class="s4">
                            Recent Updated Date : ${device.updateddate}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Type: ${parentequipment.equipmentname}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Brand : ${device.brand}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            <div class="state">Status : &nbsp;<c:if test="${device.status==1}">
                                <div class="a">
                                    <c:out value="Excellnet"/>
                                </div>
                            </c:if>
                                <c:if test="${device.status==2}">
                                    <div class="b">
                                        <c:out value="Good"/>
                                    </div>
                                </c:if>
                                <c:if test="${device.status==3}">
                                    <div class="c">
                                        <c:out value="Fair"/>
                                    </div>
                                </c:if>
                                <c:if test="${device.status==4}">
                                    <div class="d">
                                        <c:out value="Poor"/>
                                    </div>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Units in stock : ${device.number}
                        </td>
                        <td class="s4">
                            Unit Price : ${device.unitprice}
                        </td>
                        <td class="s4">
                            Sum Price : <c:out value="${device.number * device.unitprice}"/>
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Instructions : ${device.instructions}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Expiration Date : ${device.expirationdate}
                        </td>
                    </tr>
                    <tr class="ar">
                        <td class="s4">
                            Remark : ${device.remark}
                        </td>
                    </tr>

                </table>

            </td>
        </tr>
        </tbody>
    </table>
    <!-- end of device information-->
    <a class="button2" onclick="window.print()">Print</a>
</center>
</body>
</html>

