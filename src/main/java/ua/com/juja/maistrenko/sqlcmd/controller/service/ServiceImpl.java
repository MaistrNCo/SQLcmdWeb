package ua.com.juja.maistrenko.sqlcmd.controller.service;

import org.springframework.stereotype.Component;
import ua.com.juja.maistrenko.sqlcmd.model.ConnectionSettings;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;
import ua.com.juja.maistrenko.sqlcmd.model.RowData;
import ua.com.juja.maistrenko.sqlcmd.model.impl.MySQLdbManager;
import ua.com.juja.maistrenko.sqlcmd.model.impl.PostgresDBManager;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@Component
public class ServiceImpl implements Service {

    @Override
    public List<String> getMenuList() {
        return new LinkedList<String>(Arrays.asList(
                "connect",
                "list",
                "create",
                "find",
                "insert",
                "update",
                "delete",
                "clear",
                "drop"));
    }

    @Override
    public DBManager connect(ConnectionSettings conSettings, String type) {
        DBManager dbManager;
        if (type.contains("MySQL")) {
            dbManager = new MySQLdbManager();
        } else {
            dbManager = new PostgresDBManager();
        }
        dbManager.connect(conSettings);
        return dbManager;
    }

    @Override
    public void closeConnection(DBManager dbManager) {
        dbManager.disconnect();
    }

    @Override
    public List<String> list(DBManager dbManager) {
        List<String> result = new LinkedList<>();
        result.addAll(dbManager.getTablesList());
        return result;
    }

    @Override
    public List<List<String>> find(DBManager dbManager, String tableName) {
        List<List<String>> result = new LinkedList<>();
        for (RowData row : dbManager.selectAllFromTable(tableName)) {
            List<String> listRow = new LinkedList<>();
            result.add(listRow);
            for (Object value : row.getValues()) {
                listRow.add((String) value);
            }

        }
        return result;
    }

    @Override
    public List<String> getColumns(DBManager dbManager, String tableName) {
        List<String> result = new LinkedList<>();
        result.addAll(dbManager.getColumnsNames(tableName));
        return result;
    }

    @Override
    public String clearTable(DBManager dbManager, String tableName) {
        return "Deleted " + dbManager.clear(tableName) + " rows in table '" + tableName + "'";
    }

    @Override
    public String update(DBManager dbManager, String tableName, RowData conditions, RowData insertData) {
         return "Updated " + dbManager.update(tableName,conditions,insertData) + "rows in table '"+ tableName + "'";
    }

    @Override
    public String create(DBManager dbManager,String newTableName, List<String> fields) {
        dbManager.create(newTableName,fields);
        return "Created table " + newTableName;
    }

    @Override
    public String insert(DBManager dbManager, String tableName, RowData insertData) {
        dbManager.insert(tableName,insertData);
        return "Inserted row: " + insertData.toString() + "in table '" + tableName + "'";
    }


    @Override
    public String delete(DBManager dbManager, String tableName, RowData conditions) {
        return "Deleted " + dbManager.delete(tableName,conditions) + " rows in table '" + tableName + "'";
    }

    @Override
    public String dropTable(DBManager dbManager, String tableName) {
        dbManager.drop(tableName);
        return "Table:'" +  tableName + "' dropped successfully";
    }
}
