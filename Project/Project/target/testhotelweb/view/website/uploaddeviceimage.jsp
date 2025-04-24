<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TDevice device = new TDevice();//create empty device object
    request.setAttribute("device", device);
%>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
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
                    url:'../../fileuploadservlet.do',
                    type: "post",
                    secureuri:false,
                    fileElementId:'fileToUpload',
                    dataType: 'text',//return data's type
                    data:null,
                    success: function (data) {
                        alert("file upload successfully"); //display messge
                        $("#upload").attr('src', '../../../upload/' + data);
                        $("#imagelist").val(data);
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
<table  style="width:100%">
    <tr>
        <td>
            <img id="upload" width="450px" height="300px" style="object-fit: cover"
                 src="img/me.jpg">
        </td>
    </tr>
    <tr>
        <td>
            <input id="imagelist" class="editbox2" type="text" name="imagelist"
                   value="/upload/${device.imagelist}" readonly="readonly">
            <input id="btnupload" class="greenbuttoncss" name="upload" type="button" value="Choose Picture" >
            <!-- Hide file tag -->
            <input id="fileToUpload" style="display:none" type="file" name="upfile"/>
        </td>
    </tr>
</table>
</body>
</html>

