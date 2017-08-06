<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<article>
    <h1>Create</h1>
    <form action="create" method="post">
        Table name: <input name="newTableName"> <br>
        <table id="newTable">

            <tr>
                <td >field name</td>
                <td><input style="width:23px;height:25px" type="button" id="addRowBtn" value="+" onclick="insRow()"/> <br></td>
            </tr>

            <tr>
                <%--<td> <input type="hidden" name="id" value="1" /></td>--%>
                <td><input size=25 name="fieldname1" id="fieldname"></td>
                <td><input style="width:23px;height:25px" type="button" id="delRowBtn" value="-" onclick="deleteRow(this)"/></td>
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
            if (i>1) {
                table.deleteRow(i);
                for (ind = i; ind < table.rows.length;ind++){
                    var row = table.rows[ind];
                    var inp = row.cells[0].getElementsByTagName('input')[0];
                    inp.name = "fieldname" + ind;
                    inp.id = ind;
                }
            }
        }


        function insRow() {
            //console.log('hi');
            var x = document.getElementById('newTable');
            var new_row = x.rows[1].cloneNode(true);
            var len = x.rows.length;
//            new_row.cells[0].value = len;
//            new_row.cells[0].name += len;
            var inp1 = new_row.cells[0].getElementsByTagName('input')[0];
            inp1.id += len;
            inp1.name = "fieldname" + len;
            inp1.value = '';
            x.appendChild(new_row);
        }
    </script>
</article>
