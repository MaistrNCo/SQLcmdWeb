package ua.com.juja.maistrenko.sqlcmd.controller.service;

import ua.com.juja.maistrenko.sqlcmd.model.ConnectionSettings;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;

import java.util.List;

public interface Service {

    List<String> getMenuList();

    DBManager connect(ConnectionSettings conSettings, String type);

    void closeConnection(DBManager dbManager);

    List<String> list(DBManager dbManager);

    List<List<String>> find(DBManager dbManager, String tableName);

    List<String> getColumns(DBManager dbManager, String tableName);
}
