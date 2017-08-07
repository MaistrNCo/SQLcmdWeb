<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
    <h1>Insert</h1>
    <form action="insert" method="post">
        Table name:
        <select name="tableName" style="min-width: 15ch; ">
            <c:forEach items="${tablesList}" var="item">
                <option value="${item}">${item}</option>
            </c:forEach>
        </select> <br>
        <table id="newTable">
            <tr>
                <td>field name</td>
                <td>field value</td>
                    <br></td>
            </tr>
            <tr>
                <td><input size=20 name="FieldName1" id="FieldName"></td>
                <td><input size=20 name="Value1" id="Value"></td>
                <td><input style="width:23px;height:25px" type="button" id="addRowBtn" value="+" onclick="insRow('newTable','')"/>
                <td><input style="width:23px;height:25px" type="button" id="delRowBtn" value="-" onclick="deleteRow(this,'newTable','')"/></td>
            </tr>
        </table>
        <input type="submit" value="Insert">
    </form>
    <br>

    <jsp:include page="${resultBlock}"/>

</article>
