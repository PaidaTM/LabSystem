<%@include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    //priority manage
    TLabUser loginUser = (TLabUser) session.getAttribute("loginUser");
//    if (loginUser == null || loginUser.getUtid() != 1) {
//        response.sendRedirect("beikemain.jsp");
//        return;
//    }

    String sd = request.getParameter("dvcid");
    if (sd != null && !sd.equals("")) {
        int dvcid = Integer.parseInt(sd);
        TDevice device = deviceService.getDeviceById(dvcid);
        request.setAttribute("device", device);
    }

    List<TStatusType> statusTypeList = statusTypeService.getStatusTypeList(0,null);
    request.setAttribute("statusTypeList", statusTypeList);

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
        EDIT DEVICE
    </div>
    <div style="clear:both"></div>
    <div style="margin-top:10px;width:85%;min-width: 800px;border:0.5px solid #CCC"></div>
    <form action="../../devicemanage/save" method="post">
        <table >
            <tbody class="body">
            <tr>
                <td>
                    <table width="100%" height="300px;">

                        <tr hidden="hidden">
                            <td class="s1" style="width:120px">Device ID</td>
                            <td><input class="editbox" type="text" name="dvcid" value="${device.dvcid}">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">Device NAME</td>
                            <td><input class="editbox" type="text" name="name" value="${device.name}">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">UDPADTION DATE</td>
                            <td>
                                <input class="editbox" type="date" name="updateddate">
                                <%--                                <div id="p1"><input  class="editbox" type="text" name="updateddate"></div>--%>
                                <%--                                <script>--%>
                                <%--                                    var date = new Date();--%>
                                <%--                                    var current_time = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();--%>
                                <%--                                    document.getElementById("p1").innerHTML = current_time;--%>
                                <%--                                </script>--%>
                            </td>
                        </tr>
                        <tr hidden="hidden">
                            <td class="s1" style="width:120px">UPDATOR</td>
                            <td><input class="editbox" type="text" name="updaterid" value="${loginUser.userid}"
                                       readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">BRAND</td>
                            <td><input class="editbox" type="text" name="brand" value="${device.brand}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">STATUS</td>
                            <td>
                                <select class="editbox"  name="status">
                                    <c:forEach items="${statusTypeList}" var="state">
                                        <option value="${state.sid}">
                                                ${state.status}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">NUMBER</td>
                            <td><input class="editbox" type="number" name="number" value="${device.number}"></td>
                        </tr>

                        <tr>
                            <td class="s1" style="width:120px">UNIT PRICE</td>
                            <td><input class="editbox" type="number" name="unitprice" value="${device.unitprice}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">INSTRUCTIONS</td>
                            <td><input class="editbox" type="text" name="instructions" value="${device.instructions}">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">REMARK</td>
                            <td><input class="editbox" type="text" name="remark" value="${device.remark}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">EXPIRATON DATE</td>
                            <td><input class="editbox" type="date" name="expirationdate"
                                       value="${device.expirationdate}"></td>
                        </tr>

                        <tr>
                            <th class="s1" style="width:120px">
                                LABORATORY
                            </th>
                            <td>
                                Chemistry_Lab<input type="radio" name="labid" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Physics_Lab
                                <input type="radio" name="labid" value="2">

                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td colspan="2" style="text-align: center">
                                <input class="bluebuttoncss" type="submit" value="Save" id="choicePhoto">
                                <input class="whitebuttoncss" type="reset" value="Cancel" id="choicePhoto">
                            </td>
                        </tr>

                    </table>

                </td>
                <td style="width:45%">

                    <%@include file="uploaddeviceimage.jsp" %>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <!-- end of edit form -->
</center>
</body>
</html>

