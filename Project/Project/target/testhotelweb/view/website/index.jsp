<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="assets/css/meyawo.css">
</head>
<body data-target=".navbar" data-offset="40" id="home" style="background: #6c757d">
<!-- Page Navbar -->
<nav class="custom-navbar" data-spy="affix" data-offset-top="20">
    <div class="container">
        <a class="logo" href="#" style="color: black">LABORATORY</a>
        <ul class="nav" style="flex-direction: column">
            <c:if test="${loginUser!=null && loginUser.utid==1}">
                <li class="item">
                    <a  href="equipmentdamaged.jsp" class="link" >Damages</a>
                </li>
                <li class="item">
                    <a  href="studentslist.jsp" class="link" >Stu_list</a>
                </li>
                <li class="item">
                    <a  href="equipmentmanagement.jsp" class="link">My Hotels</a>
                </li>
                <li class="item">
                    <a href="addlabadmin.jsp" class="link">My Infor</a>
                </li>
                <li class="item">
                    <a  href="../../usermanage/logout" class="link">Logout</a>
                </li>
                <li class="item">
                    <a class="link" href="#contact">Contact</a>
                </li>
            </c:if>
        </ul>
        <a href="javascript:void(0)" id="nav-toggle" class="hamburger hamburger--elastic">
            <div class="hamburger-box">
                <div class="hamburger-inner">A</div>
            </div>
        </a>
    </div>
</nav><!-- End of Page Navbar -->
<script src="assets/vendors/jquery/jquery-3.4.1.js"></script>
<script src="assets/js/meyawo.js"></script>

</body>
</html>
