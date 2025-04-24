<%@ page import="model.TEquipment" %>
<%@ page import="java.util.List" %>
<%@ include file="importtop.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    TLabUser loginUser = (TLabUser) session.getAttribute("loginUser");
    if (loginUser == null || loginUser.getUtid() != 1) {
        response.sendRedirect("beikemain.jsp");
        return;
    }else {
        List<TEquipment> equipmentList = equipmentService.getEquipmentDamagedByPricipalID(loginUser.getUserid());
        request.setAttribute("equipmentList",equipmentList);

        if (equipmentList.isEmpty()){

        }
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script type="text/javascript">



    </script>
    <!--begin to css of page -->
    <style type="text/css">
        /* Border styles */
        .title{
            width:100%; height: 40px;
        }

        .navigationbar a{
            color:#fff;
        }

        .navigationbar span{
            color:#fff;
        }
        #table-1{
            width:85%;
            margin-top:10px;
        }
        .s1{
            width:200px;
        }
        .s2{
            font-size: 24px;
            color:# #3333CC;
            font-weight: 600;
            width:400px;
        }
        .s3{
            font-size: 14px;
            font-weight: 400;
            color:#575757;
        }
        .s4{
            font-size: 14px;
            font-weight: 400;
            color:#009ACD;
        }
        .s5{
            font-size: 24px;
            font-weight: 400;
            color: #EE7621;
            style=padding:20px;
        }
        .editbox{
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width:300px;
            height: 24px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top:3px;
            margin-bottom:3px;
        }

        .greenbuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt; color: #ffffff;
            border: 0px #93bee2 solid;
            background-color:#009393;
            cursor: hand;
            font-style: normal ;
            width:80px;
            height:30px;
            border-radius: 5px 5px 5px 5px;
        }

        .navbar {
            padding-bottom: 90px;
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
    <!--Query Toolbar-->
    <div style="width:85%;height:30px;margin:10px auto">
        <form action="">
            Position：<input class="editbox" type="text" name="position"></input>
            &nbsp; Equipment Name：<input class="editbox" type="text" name="equipmentname"></input>
            <button class="greenbuttoncss" type="submit">Query</button>
        </form>
    </div>
    <!--List of Hotel-->
    <div style="margin-top:5px;width:85%;border:0.5px solid #CCC"></div>
    <table id="table-1">
        <tbody class="body">
        <c:forEach items="${equipmentList}" var="obj">

            <!-- Begin to an hotel information -->
            <tr>
                    <%--            <td class="s1" >--%>
                    <%--                <a href="hotelinfo.jsp?hotelid=${obj.eqid}"><img style="width:280px;height:180px;border-radius:5px"--%>
                    <%--                                                                    src="/upload/${obj.photourl}"></a>--%>
                    <%--            </td>--%>
                <td style="width:600px;">
                    <table style="width:100%; height:180px; margin-left:10px">
                        <tr>
                            <td class="s2">
                                <a href="equipmentinfo.jsp?eqid=${obj.eqid}" style="text-decoration:none">${obj.equipmentname}</a>
                            </td>
                        </tr>
                            <%--                    <tr>--%>
                            <%--                        <td class="s3">${obj.country}.${obj.province}.${obj.city}--%>
                            <%--                        .${obj.detailaddr}</td>--%>
                            <%--                    </tr>--%>
                        <tr>
                            <td class="s4">features：${obj.phone}</td>
                        </tr>
                        <tr>
                            <td class="s4">server：${obj.cost}</td>
                        </tr>
                    </table>
                </td>
                <td valign="top" align="right" class="s5">
                    <span style="font-size:12px;">￥</span><span>328</span><span style="font-size:16px;">yuan start</span>
                </td>
            </tr>
            <tr>
                <td colspan="3"><div style="width:100%;border:0.5px solid #CCC"></div></td>
            </tr>
            <!-- end of  an hotel information -->
        </c:forEach>

        </tbody>
    </table>

</center>
</body>
</html>
