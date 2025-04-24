<%@ include file="importtop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String s_userid = request.getParameter("userid");
    int userid = 0;
    if (s_userid != null && !s_userid.equals("")) {
        userid = Integer.parseInt(s_userid); //Convert string to integer
    }
    TLabUser user = labUserService.getUserByid(userid);
    request.setAttribute("user", user);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>


        :root {
            font-size: 10px;
        }

        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        body {
            font-family: "Open Sans", Arial, sans-serif;
            min-height: 100vh;
            background-color: #fafafa;
            color: #262626;
            padding-bottom: 3rem;
        }

        img {
            display: block;
        }

        .container {
            max-width: 93.5rem;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .btn {
            display: inline-block;
            font: inherit;
            background: none;
            border: none;
            color: inherit;
            padding: 0;
            cursor: pointer;
        }

        .btn:focus {
            outline: 0.5rem auto #4d90fe;
        }

        .visually-hidden {
            position: absolute !important;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(1px, 1px, 1px, 1px);
        }

        /* Profile Section */

        .profile{
            padding-top: 100px;
        }

        .profile::after {
            content: "";
            display: block;
            clear: both;
        }

        .profile-image {
            float: left;
            width: calc(33.333% - 1rem);
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 3rem;
        }

        .profile-image img {
            border-radius: 50%;
        }

        .profile-user-settings,
        .profile-stats,
        .profile-bio {
            float: left;
            width: calc(66.666% - 2rem);
        }

        .profile-user-settings {
            margin-top: 1.1rem;
        }

        .profile-user-name {
            display: inline-block;
            font-size: 3.2rem;
            font-weight: 300;
        }

        .profile-settings-btn {
            font-size: 2rem;
            margin-left: 1rem;
        }

        .profile-stats li {
            display: inline-block;
            font-size: 1.6rem;
            line-height: 1.5;
            margin-right: 4rem;
            cursor: pointer;
        }

        .profile-stats li:last-of-type {
            margin-right: 0;
        }

        .profile-bio {
            font-size: 1.6rem;
            font-weight: 400;
            line-height: 1.5;
            margin-top: 2.3rem;
        }

        .gallery-item:hover .gallery-item-info,
        .gallery-item:focus .gallery-item-info {
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3);
        }


        .gallery-item-info li {
            display: inline-block;
            font-size: 1.7rem;
            font-weight: 600;
        }


        @media screen and (max-width: 40rem) {
            .profile {
                display: flex;
                flex-wrap: wrap;
            }

            .profile::after {
                display: none;
            }

            .profile-image,
            .profile-user-settings,
            .profile-bio,
            .profile-stats {
                float: none;
                width: auto;
            }

            .profile-image img {
                width: 7.7rem;
            }

            .profile-user-settings {
                flex-basis: calc(100% - 10.7rem);
                display: flex;
                flex-wrap: wrap;
                margin-top: 1rem;
            }

            .profile-user-name {
                font-size: 2.2rem;
            }

            .profile-edit-btn {
                order: 1;
                padding: 0;
                text-align: center;
                margin-top: 1rem;
            }

            .profile-edit-btn {
                margin-left: 0;
            }

            .profile-bio {
                font-size: 1.4rem;
                margin-top: 1.5rem;
            }

            .profile-edit-btn,
            .profile-bio,
            .profile-stats {
                flex-basis: 100%;
            }

            .profile-stats {
                order: 1;
                margin-top: 1.5rem;
            }

            .profile-stats ul {
                display: flex;
                text-align: center;
                padding: 1.2rem 0;
                border-top: 0.1rem solid #dadada;
                border-bottom: 0.1rem solid #dadada;
            }

            .profile-stats li {
                font-size: 1.4rem;
                flex: 1;
                margin: 0;
            }

            .profile-stat-count {
                display: block;
            }
        }

        /* Spinner Animation */

        @keyframes loader {
            to {
                transform: rotate(360deg);
            }
        }

        /*

        The following code will only run if your browser supports CSS grid.

        Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling.

        */

        @supports (display: grid) {
            .profile {
                display: grid;
                grid-template-columns: 1fr 2fr;
                grid-template-rows: repeat(3, auto);
                grid-column-gap: 3rem;
                align-items: center;
            }

            .profile-image {
                grid-row: 1 / -1;
            }

            .gallery {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
                grid-gap: 2rem;
            }

            .profile-image,
            .profile-user-settings,
            .profile-stats,
            .profile-bio,
            .gallery-item,
            .gallery {
                width: auto;
                margin: 0;
            }

            @media (max-width: 40rem) {
                .profile {
                    grid-template-columns: auto 1fr;
                    grid-row-gap: 1.5rem;
                }

                .profile-image {
                    grid-row: 1 / 2;
                }

                .profile-user-settings {
                    display: grid;
                    grid-template-columns: auto 1fr;
                    grid-gap: 1rem;
                }

                .profile-edit-btn,
                .profile-stats,
                .profile-bio {
                    grid-column: 1 / -1;
                }

                .profile-user-settings,
                .profile-edit-btn,
                .profile-settings-btn,
                .profile-bio,
                .profile-stats {
                    margin: 0;
                }
            }
        }

    </style>
    <style>

        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

        body {
            font-family: 'Open Sans', sans-serif;
            font-weight: 300;
            line-height: 1.42em;
        }

        tr {
            line-height: 30px;
        }

        h1 {
            font-size: 3em;
            font-weight: 300;
            line-height: 1em;
            text-align: center;
            color: #4DC3FA;
        }


        .blue {
            color: #185875;
        }

        .yellow {
            color: #FFF842;
        }

        .container th h1 {
            font-weight: bold;
            font-size: 2em;
            text-align: left;
            color: #185875;
        }

        .container td {

            font-size: 2em;
            -webkit-box-shadow: 0 2px 2px -2px #0E1119;
            -moz-box-shadow: 0 2px 2px -2px #0E1119;
            box-shadow: 0 2px 2px -2px #0E1119;
        }

        .container {
            text-align: left;
            overflow: hidden;
            width: 80%;
            margin: 0 auto;
            display: table;
        }

        .container td, .container th {
            padding-bottom: 2%;
            padding-top: 2%;
            padding-left: 2%;
        }

        /* Background-color of the odd rows */
        .container tr:nth-child(odd) {
            background-color: #e6ebf5;
        }

        /* Background-color of the even rows */
        .container tr:nth-child(even) {
            background-color: #e0e9ff;
        }

        .container th {
            background-color: #1F2739;
        }

        .container td:first-child {
            color: #000000;
        }

        .container tr:hover {
            background-color: #ffffff;
            -webkit-box-shadow: 0 6px 6px -6px #0E1119;
            -moz-box-shadow: 0 6px 6px -6px #0E1119;
            box-shadow: 0 6px 6px -6px #0E1119;
        }

        .tdy {
            font-weight: bold;
        }

        .tdy:hover {
            background-color: #ffffff;
            color: #403E10;
            font-weight: bold;

            box-shadow: #e7edfe -1px 1px, #c7cddd -2px 2px, #e7edfe -3px 3px, #a4a8b4 -4px 4px, #e7edfe -5px 5px, #a0a5b3 -6px 6px;
            transform: translate3d(6px, -6px, 0);

            transition-delay: 0s;
            transition-duration: 0.4s;
            transition-property: all;
            transition-timing-function: line;
        }

        .tdx {
            text-align: center;
        }

        @media (max-width: 800px) {
            .container td:nth-child(4),
            .container th:nth-child(4) {
                display: none;
            }
        }

    </style>
</head>
<body style="background:#e7edfe">
<div>
    <%@include file="navigationbar.jsp" %>
</div>
<header>
    <div class="container">

        <div class="profile">

            <div class="profile-image">

                <img src="img/${user.profilephoto}" height="200px" width="200px">

            </div>

            <div class="profile-user-settings">

                <h1 class="profile-user-name"
                    style="font-weight: bold; font-size: 50px">${user.firstname} ${user.lastname}</h1>

                <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog"
                                                                                          aria-hidden="true"></i>
                </button>

            </div>


            <div class="profile-bio">


            </div>

        </div>
        <!-- End of profile section -->

    </div>
    <!-- End of container -->

</header>

<main>
    <table class="container">
        <tbody>
        <tr>
            <td class="tdy">User_Name</td>
            <td class="tdx">${user.name}</td>
        </tr>
        <tr>
            <td class="tdy">First Name</td>
            <td class="tdx">${user.firstname}</td>
        </tr>
        <tr>
            <td class="tdy">Last Name</td>
            <td class="tdx">${user.lastname}</td>
        </tr>
        <tr>
            <td class="tdy">Gender</td>
            <td class="tdx">${user.gender}</td>
        </tr>
        <tr>
            <td class="tdy">Mobile</td>
            <td class="tdx">${user.lastname}</td>
        </tr>
        <tr>
            <td class="tdy">Email</td>
            <td class="tdx">${user.mail}</td>
        </tr>
        <tr>
            <td class="tdy">Education</td>
            <td class="tdx">${user.educaton}</td>
        </tr>
        <tr>
            <td class="tdy">College</td>
            <td class="tdx">${user.collegename}</td>
        </tr>
        </tbody>
    </table>
    <!-- End of container -->

</main>
</body>
</html>