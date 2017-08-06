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
                <td><input size=20 name="fieldname1" id="fieldname"></td>
                <td><input size=20 name="value1" id="value"></td>
                <td><input style="width:23px;height:25px" type="button" id="addRowBtn" value="+" onclick="insRow()"/>
                <td><input style="width:23px;height:25px" type="button" id="delRowBtn" value="-"
                           onclick="deleteRow(this)"/></td>
            </tr>
        </table>
        <input type="submit" value="Create">
    </form>
    <br>

    <jsp:include page="${resultBlock}"/>

    <script>
        function deleteRow(row) {
            var i = row.parentNode.parentNode.rowIndex;
            var table = document.getElementById('newTable');
            if (i > 1) {
                table.deleteRow(i);
                for (ind = i; ind < table.rows.length; ind++) {
                    var row = table.rows[ind];
                    var inp = row.cells[0].getElementsByTagName('input')[0];
                    inp.name = "fieldname" + ind;
                    inp.id = ind;
                    var val = row.cells[1].getElementsByTagName('input')[0];
                    val.name = "value" + ind;
                    val.id = ind;
                }
            }
        }


        function insRow() {
            var x = document.getElementById('newTable');
            var new_row = x.rows[1].cloneNode(true);
            var len = x.rows.length;
            var inp1 = new_row.cells[0].getElementsByTagName('input')[0];
            inp1.id += len;
            inp1.name = "fieldname" + len;
            inp1.value = '';
            var inp2 = new_row.cells[1].getElementsByTagName('input')[0];
            inp2.id += len;
            inp2.name = "value" + len;
            inp2.value = '';
            x.appendChild(new_row);
        }
    </script>
</article>
