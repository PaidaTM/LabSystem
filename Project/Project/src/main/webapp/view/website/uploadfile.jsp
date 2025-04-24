<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../view/website/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../view/website/js/ajaxfileupload.js"></script>
<html>
    <head>
        <title>upload file</title>
        <script type="text/javascript">
            $(function(){
                /*After the upload button is clicked, the
                file control is invoked to open the file selector.
                */
                $("#btnupload").click(function(){
                    $("#fileToUpload").click();
                });
                /*When a file is selected, the change method of the
                file control is started
                 */
                $("#fileToUpload").change(function(e){
                    $.ajaxFileUpload({
                        url:'../fileuploadservlet.do',
                        type: "post",
                        secureuri:false,
                        fileElementId:'fileToUpload',
                        dataType: 'text',//return data's type
                        data:null,
                        success: function (data) {
                            alert("file upload successfully"); //display messge
                            $("#filename").text(data);
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
    <input id="btnupload" name="upload" type="button" value="upload photo"/>
    <!-- Don't display -->
    <input id="fileToUpload" style="display:none" type="file" name="upfile"/>
    <br>
    file name：<span id="filename"></span><br>
    </body>
</html>

