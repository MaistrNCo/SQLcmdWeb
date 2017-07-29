<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="resultTab">
    <thead>
    <tr>
        <c:forEach items="${tableColumnsList}" var="column">
            <td>
                    ${column}
            </td>
        </c:forEach>
    </tr>

    </thead>
    <c:forEach items="${table}" var="row">
        <tr>
            <c:forEach items="${row}" var="data">
                <td>
                        ${data}
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>

