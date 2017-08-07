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
        </table>
        <table id="conditions">
            <caption>Conditions:</caption>
            <tr>
                <td>field name</td>
                <td>field value</td>
                <br></td>
            </tr>
            <tr>
                <td><input size=20 name="condFieldName1" id="condFieldName"></td>
                <td><input size=20 name="condValue1" id="condValue"></td>
                <td><input style="width:23px;height:25px" type="button" id="addRowBtn" value="+" onclick="insRow('conditions','cond')"/>
                <td><input style="width:23px;height:25px" type="button" id="delRowBtn" value="-" onclick="deleteRow(this,'conditions','cond')"/></td>
            </tr>
        </table>

        <table id="values">
            <caption>New values:</caption>
            <tr>
                <td>field name</td>
                <td>field value</td>
                <br></td>
            </tr>
            <tr>
                <td><input size=20 name="newFieldName1" id="newFieldName"></td>
                <td><input size=20 name="newValue1" id="newValue"></td>
                <td><input style="width:23px;height:25px" type="button" id="addRowValueBtn" value="+" onclick="insRow('values','new')"/>
                <td><input style="width:23px;height:25px" type="button" id="delRowValueBtn" value="-" onclick="deleteRow(this,'values','')"/></td>
            </tr>
        </table>

        <td><input type="submit" value="Update"></td>
    </form>
    <jsp:include page="${resultBlock}"/>

</article>
