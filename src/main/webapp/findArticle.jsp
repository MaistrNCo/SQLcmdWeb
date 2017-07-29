<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
    <h1>Find</h1>
    <form action="find" method="post">
        <table>
            <tr>
                <td>
                    Table:
                </td>
                <td><select name="tableName" style="min-width: 15ch; ">
                    <c:forEach items="${tablesList}" var="item">
                        <option value="${item}">${item}</option>
                    </c:forEach>
                </select></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Connect"></td>
            </tr>
        </table>
    </form>
    <jsp:include page="${resultBlock}"/>
</article>
