<%@include file="importtop.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //priority manage
//    TUser loginUser = (TUser)session.getAttribute("loginUser");
//    if(loginUser==null || loginUser.getUtid()!=1){
//        response.sendRedirect("beikemain.jsp");
//        return;
//    }

    String s = request.getParameter("hotelid");
    if(s!=null && !s.equals("")){
        int hotelid = Integer.parseInt(s);
        TDevice hotel = deviceService.getDeviceById(hotelid);
        request.setAttribute("hotel",hotel);
    }else{
        TDevice hotel = new TDevice(); //create empty hotel object
        request.setAttribute("hotel",hotel);
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <!--begin to css of page-->
    <style type="text/css">
        /* Border styles */
        .title{
            width:100%; height: 40px;
        }

        .sysmenu{
            width:100%; height: 40px;
            border-bottom: #0033FF 1px solid;
            background: #0033FF;
        }
        .sysmenu a{
            color:#fff;
        }

        .sysmenu span{
            color:#fff;
        }
        #table-1{
            width:85%;
            margin-top:10px;
        }
        .s1{
            font-size: 16px;
            font-weight: 400;
            color:#575757;
        }
        .editbox{
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width:400px;
            height: 24px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top:2px;
            margin-bottom:2px;
            padding:3px;
        }

        .editbox2{
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
        }

        .editbox3{
            background: #ffffff;
            border: 1px solid #b7b7b7;
            color: #003366;
            cursor: text;
            font-family: "arial";
            font-size: 11pt;
            width:400px;
            height: 30px;
            padding: 3px;
            border-radius: 5px 5px 5px 5px;
            margin-top:4px;
            margin-bottom:4px;
            padding:3px;
        }

        .bluebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt; color: #ffffff;
            border: 0px #93bee2 solid;
            background-color:#66B3FF;
            cursor: hand;
            font-style: normal ;
            width:80px;
            height:30px;
            border-radius: 5px 5px 5px 5px;
        }

        .whitebuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt; color: #99999;
            border: 1px #A9A9A9 solid;
            background-color:#ffffff;
            cursor: hand;
            font-style: normal ;
            width:80px;
            height:30px;
            border-radius: 5px 5px 5px 5px;
        }

        .greenbuttoncss {
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 11pt; color: #ffffff;
            border: 0px #93bee2 solid;
            background-color:#009393;
            cursor: hand;
            font-style: normal ;
            width:120px;
            height:30px;
            border-radius: 5px 5px 5px 5px;
        }
        .topic{
            margin-left:100px;
            margin-top:10px;
            width:280px;
            height:40px;
            border:#FF8000 solid 1px;
            border-radius: 5px;
            color:#FF8000;
            font-family: "tahoma", "宋体"; /*www.52css.com*/
            font-size: 20pt;
            padding:20px 20px;
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
<body>
<center>

    <!--begin to system menu -->
    <%@include file="navigationbar.jsp"%>
    <!-- end of system menu-->
    <!-- begin to edit form -->
    <div style="float:left;" class="topic">
        Edit Hotel Information
    </div>
    <div style="clear:both"></div>
    <div style="margin-top:10px;width:85%;min-width: 800px;border:0.5px solid #CCC"></div>

<div>
    <?php if (isset($_GET['error'])): ?>
    <p><?php echo $_GET['error']; ?></p>
    <?php endif ?>
    <form action="assets/php/upload.php"
          method="post"
          enctype="multipart/form-data">

        <input type="file"
               name="my_image">

        <input type="submit"
               name="submit"
               value="Upload">

    </form>
</div>
    <!-- end of edit form -->
</center>
</body>
</html>

