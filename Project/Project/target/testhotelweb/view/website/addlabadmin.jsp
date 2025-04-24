<%@include file="importtop.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //priority manage
    TLabUser loginUser = (TLabUser) session.getAttribute("loginUser");

    String s = request.getParameter("userid");
    if (s != null && !s.equals("")) {
        int userid = Integer.parseInt(s);
        TLabUser user = labUserService.getUserByid(loginUser.getUserid());
        request.setAttribute("user", user);
    } else {
        TLabUser user = new TLabUser(); //create new admin object
        request.setAttribute("user", user);
    }


%>
<!DOCTYPE html>
<html>
<head>
    <!--begin to css of page-->
    <style type="text/css">
        body {
            background-image: url(img/hotelback2.jpg);
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-attachment: fixed;
            postion: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        .table {
            background: #ffffff;
            padding: 10px;
            border: #cccccc solid 1px;
            border-radius: 10px;
        }

        tr {
            height: 45px;
        }

        .editbox {
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width: 180px;
            height: 23px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top: 2px;
            margin-bottom: 2px;
            margin-left: 10px;
        }

        .orangebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #FF8000 solid;
            background-color: #FF8000;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
            margin-left: 30px;
        }


        .bluebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #81BEF7 solid;
            background-color: #81BEF7;
            cursor: hand;
            font-style: normal;
            width: 80px;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
            margin-left: 30px;
        }

        .dp {
            border-radius: 50%;
            object-fit: cover;
        }

        .t {
            display: inline-block;
        }

        #pp {
            margin-bottom: 250px;
            padding-left: 50px;
        }

        .uploaduttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt;
            color: #ffffff;
            border: 0px #81BEF7 solid;
            background-color: #00CC99;
            cursor: hand;
            font-style: normal;
            width: auto;
            height: 30px;
            border-radius: 5px 5px 5px 5px;
        }
        .navbar {
            padding-bottom: 20px;
        }
    </style>
    <!--end of page css-->
    <meta charset="utf-8">
    <title>Register Laboratory administrator</title>
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
<div class="navbar" style="background:#e7edfe">
    <%@include file="navigationbar.jsp" %>
</div>
<!-- begin to edit form -->
<div style="margin-top: 100px; ">
    <center>
        <form action="../../usermanage/addadmin" method="post">
            <div colspan="4" style="border-bottom: #666666 1px solid; text-align: center; padding-left: 85px; padding-right: 85px ">REGISTER LABORATORY
                ADMINISTRATOR
            </div>
            <div class="t">
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td style="padding-left: 20px;">ACCOUNT NAME</td>
                                    <td><input type="text" class="editbox" name="name"  value="${loginUser.name}">
                                    <p>
                                        <input type="text" class="editbox" name="userid" value="${loginUser.userid}" hidden="hidden">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">FIRST NAME</td>
                                    <td><input type="text" class="editbox" name="firstname" placeholder="Given_Name" ></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">LAST NAME</td>
                                    <td><input type="text" class="editbox" name="lastname" placeholder="Last_Name"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">LOGIN PASSWORD</td>
                                    <td><input type="password" class="editbox" name="password" value="${loginUser.password}"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">RE_ENTER PASSWORD</td>
                                    <td><input type="password" class="editbox" name="password2" value="${loginUser.password}"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">GENDER</td>
                                    <td><input type="text" class="editbox" name="gender"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">MOBILE NUMBER</td>
                                    <td><input type="text" class="editbox" name="phone"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">SCIENCE FIELD</td>
                                    <td><input type="text" class="editbox" name="educaton"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">COLLEGE NAME</td>
                                    <td><input type="text" class="editbox" name="collegename"></td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 20px;">MAIL</td>
                                    <td><input type="text" class="editbox" name="mail"></td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                </table>
            </div>
            <div id="pp" class="t">
                <table>
                    <%@include file="uploaduserimage.jsp"%>
                </table>
            </div>
                <div colspan="4" style="text-align: center;">
                    <input type="submit" class="orangebuttoncss" name="login" value="REGISTER" id="choicePhoto">
                    <input type="button" class="bluebuttoncss" name="reset" value="CLEAR">
                </div>
        </form>
    </center>
</div>
<!-- end of edit form -->
</body>
</html>

