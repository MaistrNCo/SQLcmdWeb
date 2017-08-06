package ua.com.juja.maistrenko.sqlcmd.controller.service;

import ua.com.juja.maistrenko.sqlcmd.model.ConnectionSettings;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;
import ua.com.juja.maistrenko.sqlcmd.model.RowData;

import java.util.List;

public interface Service {

    List<String> getMenuList();

    DBManager connect(ConnectionSettings conSettings, String type);

    void closeConnection(DBManager dbManager);

    List<String> list(DBManager dbManager);

    List<List<String>> find(DBManager dbManager, String tableName);

    List<String> getColumns(DBManager dbManager, String tableName);

    String clearTable(DBManager dbManager, String tableName);

    String dropTable(DBManager dbManager, String tableName);

    String delete(DBManager dbManager, String tableName, String columnName, String value);

    String update(DBManager dbManager, String tableName, String condColumnName, String condValue, RowData setValues);

    String create(DBManager dbManager,String newTableName, List<String> fields);
}
