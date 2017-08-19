<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<article>
    <h1>Create</h1>
    <form action="create" method="post">
        Table name: <input name="newTableName"> <br>
        <table id="newTable">

            <tr>
                <td >field name</td>
            </tr>

            <tr>
                <td><input size=30 name="FieldName1" id="FieldName"></td>
                <td><input size=1 hidden="hidden" name="Value1" id="Value"></td>
                <td><input style="width:23px;height:25px" type="button" id="addRowBtn" value="+" onclick="insRow('newTable','')"/></td>
                <td><input style="width:23px;height:25px" type="button" id="delRowBtn" value="-" onclick="deleteRow(this,'newTable','')"/></td>
            </tr>


        </table>
        <input type="submit" value="Create">

    </form>
    <br>
    <jsp:include page="${resultBlock}"/>

</article>
