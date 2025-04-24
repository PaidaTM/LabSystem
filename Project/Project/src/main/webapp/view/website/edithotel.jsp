<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<%@include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //priority manage
    TLabUser loginUser = (TLabUser) session.getAttribute("loginUser");
//    if (loginUser == null || loginUser.getUtid() != 1) {
//        response.sendRedirect("beikemain.jsp");
//        return;
//    }

    String s = request.getParameter("dvcId");
    if (s != null && !s.equals("")) {
        int dvcId = Integer.parseInt(s);
        TDevice device = deviceService.getDeviceById(dvcId);
        request.setAttribute("device", device);
    }


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
        $(function(){
            /*After the upload button is clicked, the
            file control is invoked to open the file selector.
            */
            $("#choicePhoto").click(function(){
                $("#fileToUpload").click();
            });
            /*When a file is selected, the change method of the
            file control is started
             */
            $("#fileToUpload").change(function(e){
                $.ajaxFileUpload({
                    url:'../../fileuploadservlet.do',
                    type: "post",
                    secureuri:false,
                    fileElementId:'fileToUpload',
                    dataType: 'text',//return data's type
                    data:null,
                    success: function (data) {
                        alert("file upload successfully"); //display messge
                        $("#upload").attr('src','../../../upload/'+data);
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
        <table id="table-1">
            <tbody class="body">
            <tr>
                <td style="width:45%">
                    <table style="width:100%">
                        <tr>
                            <td><img id="upload" width="450px" height="300px" src="img/hotelcase1.jpg"></td>
                        </tr>
                        <tr>
                            <td>
                                <input id="photourl" class="editbox2" type="text" name="photourl" value="/upload/${device.imagelist}" readonly="readonly">
                                <input class="greenbuttoncss" type="button" value="Choice Picture" id="choicePhoto">
                                <!-- Hide file tag -->
                                <input id="fileToUpload" style="display:none" type="file" name="upfile"/>
                            </td>
                        </tr>
                    </table>
                </td>

                <td>
                    <table width="100%" height="300px;">

                        <tr>
                            <td class="s1" style="width:120px">Device ID</td>
                            <td><input class="editbox" type="text" name="dvcid" value="${device.dvcid}">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">Device NAME</td>
                            <td><input class="editbox" type="text" name="name">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">UDPADTION DATE</td>
                            <td><input class="editbox"  type="date"  name="createddate" >
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">UPDATOR </td>
                            <td><input class="editbox" type="text" name="creatorid" value="${loginUser.userid}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">BRAND</td>
                            <td><input class="editbox" type="text" name="brand" value="${device.brand}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">STATUS</td>
                            <td><input class="editbox" type="text" name="status" value="${device.status}"></td>
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
                            <td><input class="editbox" type="text" name="instructions" value="${device.instructions}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">REMARK</td>
                            <td><input class="editbox" type="text" name="remark" value="${device.remark}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">EXPIRATON DATE</td>
                            <td><input class="editbox" type="date" name="expirationdate" value="${device.expirationdate}"></td>
                        </tr>
                        <tr>
                            <td class="s1" style="width:120px">IMAGE</td>
                            <td><input class="editbox" type="text" name="imagelist" value="${device.imagelist}"></td>
                        </tr>
                        <tr>
                            <th class="s1" style="width:120px">
                                LABORATORY
                            </th>
                            <td >
                                Chemistry_Lab<input type="radio" name="labid" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Physics_Lab <input type="radio" name="labid" value="2">
                            </td>
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

