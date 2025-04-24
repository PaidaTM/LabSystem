<%@include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //priority manage
    TLabUser loginUser = (TLabUser) session.getAttribute("loginUser");
//    if (loginUser == null || loginUser.getUtid() != 1) {
//        response.sendRedirect("beikemain.jsp");
//        return;
//    }

    String s = request.getParameter("eqid");
    if (s != null && !s.equals("")) {
        int eqid = Integer.parseInt(s);
        TEquipment equipment = equipmentService.getEquipmentByid(eqid);
        request.setAttribute("equipment", equipment);
    }

    List<TLabUser> userList = labUserService.GetLabUserList(null,0);
    request.setAttribute("userList", userList);

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
            font-size: 16px;
            font-weight: 400;
            color: #575757;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 400px;
            height: 24px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 2px;
            margin-bottom: 2px;
            padding: 3px;
        }

        .editbox2 {
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
        }

        .editbox3 {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 400px;
            height: 30px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 4px;
            margin-bottom: 4px;
            padding: 3px;
        }

        .bluebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #93bee2 solid;
            background-color: #66B3FF;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .whitebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #99999;
            border: 1px #A9A9A9 solid;
            background-color: #ffffff;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .greenbuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #93bee2 solid;
            background-color: #009393;
            cursor: hand;
            font-style: normal;
            width: 120px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }

        .topic {
            margin-left: 100px;
            margin-top: 10px;
            width: 280px;
            height: 40px;
            border: #FF8000 solid 1px;
            border-radius: 5px;
            color: #FF8000;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 20pt;
            padding: 20px 20px;
        }

        .navbar {
            padding-bottom: 90px;
        }
    </style>
    <!--end of page css-->

    <script type="text/javascript">

        $(function () {
            date = new Date();
            year = date.getFullYear();
            month = date.getMonth() + 1;
            day = date.getDate();
            document.getElementById("date").innerHTML = year + "-" + month + "-" + day;
        })

        $(function () {
            /*After the upload button is clicked, the
            file control is invoked to open the file selector.
            */
            $("#choicePhoto").click(function () {
                $("#fileToUpload").click();
            });
            /*When a file is selected, the change method of the
            file control is started
             */
            $("#fileToUpload").change(function (e) {
                $.ajaxFileUpload({
                    url: '../../fileuploadservlet.do',
                    type: "post",
                    secureuri: false,
                    fileElementId: 'fileToUpload',
                    dataType: 'text',//return data's type
                    data: null,
                    success: function (data) {
                        alert("file upload successfully"); //display messge
                        $("#upload").attr('src', '../../../upload/' + data);
                        $("#photourl").val(data);

                    },
                    error: function (data, status, e) {
                        alert("file upload failed");//display messge
                    }
                });
            });
        });
    </script>

</head>
<body style="background:#e7edfe">
<center>

    <!--begin to system menu -->
    <div class="navbar" style="background:#e7edfe">
        <%@include file="navigationbar.jsp" %>
    </div>
    <!-- end of system menu-->
    <!-- begin to edit form -->
    <div style="float:left;" class="topic">
        Equipment Maintenance
    </div>
    <div style="clear:both"></div>
    <div style="margin-top:10px;width:85%;min-width: 800px;border:0.5px solid #CCC"></div>
    <form action="../../equipmentmanage/save" method="post">
        <table id="table-1">
            <tbody class="body">
            <tr>

                <td>
                    <table width="100%" height="300px;">

                        <tr hidden="hidden">
                            <td class="s1" style="width:120px">EQUIPMENT ID</td>
                            <td><input class="editbox" type="text" name="eqid" readonly="readonly"
                                       value="${equipment.eqid}">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">EQUPMENT NAME</td>
                            <td><input class="editbox" type="text" name="equipmentname"
                                       value="${equipment.equipmentname}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">MANTAINACE DATE</td>
                            <td>
                                <input class="editbox" type="date" name="mantaindate">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">NUMBER</td>
                            <td>
                                <input class="editbox" name="number">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">COST</td>
                            <td><input class="editbox" type="text" name="cost"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">BALANCE</td>
                            <td><input class="editbox" readonly="readonly" name="balance">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">REASON</td>
                            <td><input class="editbox" type="text" name="reason"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">REPAIR NEED</td>
                            <td><input class="editbox" type="text" name="repairneed"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">PERSON RESPONSIBLE</td>
                            <td>
                                <select class="editbox" type="text" name="principal">
                                    <c:forEach items="${userList}" var="user">
                                        <option value="${user.userid}">
                                        ${user.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">PHONE</td>
                            <td><input class="editbox" type="text" name="phone"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">ADDRESS</td>
                            <td><input class="editbox" type="text" name="address"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <input class="bluebuttoncss" type="submit" value="Save" id="choicePhoto">
                                <input class="whitebuttoncss" type="reset" value="Cancel" id="choicePhoto">
                            </td>
                        </tr>

                    </table>

                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <!-- end of edit form -->
</center>
</body>
</html>

