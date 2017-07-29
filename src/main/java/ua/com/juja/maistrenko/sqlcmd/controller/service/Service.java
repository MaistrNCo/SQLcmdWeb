package ua.com.juja.maistrenko.sqlcmd.controller.service;

import ua.com.juja.maistrenko.sqlcmd.model.ConnectionSettings;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;

import java.util.List;

public interface Service {

    List<String> getMenuList();

    String connectionStatus();

    DBManager connect(List<String> conSettings, String type);

    void closeConnection(DBManager dbManager);
}
