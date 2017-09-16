<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <link type="text/css" rel="stylesheet" href="<c:url value="css/MyStyle.css" />" />
    <script type="text/javascript" src="js/tablesScripts.js"></script>

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


    <footer>
        Copyright &copy; MaistrNCo <br/>
        <p>Today's date: <%= (new java.util.Date()).toLocaleString()%></p>
    </footer>
</div>

</body>
</html>