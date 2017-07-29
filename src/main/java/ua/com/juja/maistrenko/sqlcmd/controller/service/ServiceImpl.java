package ua.com.juja.maistrenko.sqlcmd.controller.service;

import ua.com.juja.maistrenko.sqlcmd.model.ConnectionSettings;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;
import ua.com.juja.maistrenko.sqlcmd.model.impl.MySQLdbManager;
import ua.com.juja.maistrenko.sqlcmd.model.impl.PostgresDBManager;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

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
    public String connectionStatus() {
        return null;
    }

    @Override
    public DBManager connect(List<String> conSettings, String type) {
        DBManager dbManager;
        if (type.contains("MySQL")){
            dbManager = new MySQLdbManager();
        }else{
            dbManager = new PostgresDBManager();
        }
        ConnectionSettings connectionSettings = new ConnectionSettings(conSettings, dbManager);
        dbManager.connect(connectionSettings);
        return dbManager;
    }

    @Override
    public void closeConnection(DBManager dbManager) {
        dbManager.disconnect();
    }
}
