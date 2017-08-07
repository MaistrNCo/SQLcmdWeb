<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
    <h1>Delete</h1>
    <form action="delete" method="post">
        <table>
            <tr>
                <td>Table:</td>
                <td colspan="2"><select name="tableName" style="min-width: 15ch; ">
                    <c:forEach items="${tablesList}" var="item">
                        <option value="${item}">${item}</option>
                    </c:forEach>
                </select></td>
            </tr>
        </table>
        <table id="conditions">
            <caption>Conditions:</caption>
            <tr>
                <td>field name</td>
                <td>field value</td>
                <br></td>
            </tr>
            <tr>
                <td><input size=20 name="FieldName1" id="FieldName"></td>
                <td><input size=20 name="Value1" id="Value"></td>
                <td><input style="width:23px;height:25px" type="button" id="addRowBtn" value="+" onclick="insRow('conditions','')"/>
                <td><input style="width:23px;height:25px" type="button" id="delRowBtn" value="-" onclick="deleteRow(this,'conditions','')"/></td>
            </tr>
        </table>
        <td><input type="submit" value="Delete"></td>
    </form>
    <jsp:include page="${resultBlock}"/>

</article>
