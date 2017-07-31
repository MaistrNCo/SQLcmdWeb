<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table id="DBtable">
    <thead>
    <tr>
        <c:forEach items="${tableColumnsList}" var="column">
            <th>${column}</th>
        </c:forEach>
    </tr>

    </thead>
    <c:forEach items="${table}" var="row">
        <tr>
            <c:forEach items="${row}" var="data">
                <td>${data}</td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>

