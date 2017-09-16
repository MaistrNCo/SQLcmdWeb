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
