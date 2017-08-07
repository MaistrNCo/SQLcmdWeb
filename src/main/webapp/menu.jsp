<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        div.container {
            width: 100%;
            border: 1px solid gray;
            font-family: "Segoe UI",Arial,sans-serif;
        }
        header, footer {
            padding: 1em;
            color: white;
            background-color: steelblue;
            clear: left;
            text-align: center;
            /*text-shadow: 2px 2px 3px #ccc;*/
        }
        nav {
            float: left;
            max-width: 160px;
            margin: 0;
            padding: 1em;
            border-left: 1px solid gray;
        }
        nav ul {
            list-style-type: none;
            right: 16px;
            padding: 8px 12px;
        }
        nav ul a {
            text-decoration: none;
        }
        article {
            margin-left: 170px;
            border-left: 1px solid gray;
            padding: 1em;
            overflow: hidden;
        }
        table caption {
            padding: 2px;
            text-align: left;
        }
        table td {
            padding: 2px;
        }

        table#DBtable {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        table#DBtable  tr  {
        }

        table#DBtable  td  {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        table#DBtable td :nth-child(even) {
            background-color: #dddddd;
        }

        table#DBtable th {
            background-color: black;
            color: white;
            padding: 8px;
        }

    </style>
</head>
<body>

<div class="container">
    <header>
        <h1>SQL client</h1>
        Connected to: ${connectionStatus}
    </header>
    <nav>
        <div>Commands:</div>
        <ul>
            <c:forEach items="${menuItems}" var="item">
                <li><a href="${item}">${item}</a></li>
            </c:forEach>
        </ul>
    </nav>
    <jsp:include page="${article}"/>


    <footer>
        Copyright &copy; MaistrNCo <br/>
        <p>Today's date: <%= (new java.util.Date()).toLocaleString()%></p>
    </footer>
</div>
<script>
    function deleteRow(row,tableName,pref) {
        var i = row.parentNode.parentNode.rowIndex;
        var table = document.getElementById(tableName);
        if (table.rows.length > 2) {
            table.deleteRow(i);
            for (ind = i; ind < table.rows.length; ind++) {
                var row = table.rows[ind];
                var inp = row.cells[0].getElementsByTagName('input')[0];
                inp.name = pref + "FieldName" + ind;
                inp.id = ind;
                var val = row.cells[1].getElementsByTagName('input')[0];
                val.name = pref + "Value" + ind;
                val.id = ind;
            }
        }
    }

    function insRow(tableName,pref) {
        var x = document.getElementById(tableName);
        var new_row = x.rows[1].cloneNode(true);
        var len = x.rows.length;
        var inp1 = new_row.cells[0].getElementsByTagName('input')[0];
        inp1.id += len;
        inp1.name = pref + "FieldName" + len;
        inp1.value = '';
        var inp2 = new_row.cells[1].getElementsByTagName('input')[0];
        inp2.id += len;
        inp2.name = pref + "Value" + len;
        inp2.value = '';
        x.appendChild(new_row);
    }
</script>
</body>
</html>