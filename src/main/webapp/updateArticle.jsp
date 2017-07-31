<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
    <h1>Update</h1>
    <form action="update" method="post">
        <table>
            <tr>
                <td>Table:</td>
                <td colspan="2"><select name="tableName" style="min-width: 15ch; ">
                    <c:forEach items="${tablesList}" var="item">
                        <option value="${item}">${item}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td>Condition:</td>
                <td>Column:</td>
                <td><input name="condColumnName" ></td>
                <td>Value:</td>
                <td><input name="condValue" ></td>
            </tr>
            <tr>
                <td>Update to:</td>
                <td>Column:</td>
                <td><input name="updateColumnName" ></td>
                <td>Value:</td>
                <td><input name="updateValue" ></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Update"></td>
            </tr>
        </table>
    </form>
    <jsp:include page="${resultBlock}"/>
</article>
