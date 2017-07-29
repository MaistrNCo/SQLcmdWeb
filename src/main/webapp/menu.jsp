<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        div.container {
            width: 100%;
            border: 1px solid gray;
            font-family: "Segoe UI",Arial,sans-serif;
        }
        header, footer {
            padding: 1em;
            color: white;
            background-color: steelblue;
            clear: left;
            text-align: center;
            /*text-shadow: 2px 2px 3px #ccc;*/
        }
        nav {
            float: left;
            max-width: 160px;
            margin: 0;
            padding: 1em;
            border-left: 1px solid gray;
        }
        nav ul {
            list-style-type: none;
            right: 16px;
            padding: 8px 12px;
        }
        nav ul a {
            text-decoration: none;
        }
        article {
            margin-left: 170px;
            border-left: 1px solid gray;
            padding: 1em;
            overflow: hidden;
        }
        table.resultTab {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td.resultTab, th.resultTab {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr.resultTab:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>SQL client</h1>
        Connected to: ${connectionStatus}
    </header>
    <nav>
        <div>Commands:</div>
        <ul>
            <c:forEach items="${menuItems}" var="item">
                <li><a href="${item}">${item}</a></li>
            </c:forEach>
        </ul>
    </nav>
    <jsp:include page="${article}"/>


    <footer>Copyright &copy; MaistrNCo</footer>
</div>
</body>
</html>