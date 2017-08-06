package ua.com.juja.maistrenko.sqlcmd.controller.web;

import ua.com.juja.maistrenko.sqlcmd.controller.service.Service;
import ua.com.juja.maistrenko.sqlcmd.controller.service.ServiceImpl;
import ua.com.juja.maistrenko.sqlcmd.model.ConnectionSettings;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;
import ua.com.juja.maistrenko.sqlcmd.model.RowData;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class MainServlet extends HttpServlet {
    Service service;

    @Override
    public void init() throws ServletException {
        super.init();
        service = new ServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = getAction(req);
        req.setAttribute("resultBlock", "result.jsp");
        String article;
        req.setAttribute("tablesList", req.getSession().getAttribute("tablesList"));
        //req.setAttribute("tableName", req.getParameter("tableName"));
        if (action.startsWith("/list")) {
            article = "listArticle.jsp";
        } else if (action.startsWith("/find")) {
            article = "findArticle.jsp";
        } else if (action.startsWith("/create")) {
            article = "createArticle.jsp";
        } else if (action.startsWith("/insert")) {
            article = "insertArticle.jsp";
        } else if (action.startsWith("/update")) {
            article = "updateArticle.jsp";
        } else if (action.startsWith("/delete")) {
            article = "deleteArticle.jsp";
        } else if (action.startsWith("/clear")) {
            article = "clearArticle.jsp";
        } else if (action.startsWith("/drop")) {
            article = "dropArticle.jsp";
        } else {  //(action.startsWith("/connect")){
            article = "connectArticle.jsp";
        }
        drawMainPage(req, resp, article);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = getAction(req);
        DBManager dbManager = (DBManager) req.getSession().getAttribute("db_manager");
        //req.setAttribute("tablesList", req.getSession().getAttribute("tablesList"));
        req.setAttribute("tableName", req.getParameter("tableName"));
        req.setAttribute("resultBlock", "result.jsp");
        String article = "connectArticle.jsp";
        List<String> tablesList = (List<String>) req.getSession().getAttribute("tablesList");
        if ((dbManager == null || !dbManager.isConnected()) && !action.startsWith("/connect")) {
            req.setAttribute("result", "Not connected yet.  Please use 'connect' command first");
            req.setAttribute("article", article);
            resp.sendRedirect(resp.encodeRedirectURL("menu"));
            return;
        }

        if (action.startsWith("/connect")) {
            if (dbManager != null) {
                service.closeConnection(dbManager);
                req.getSession().setAttribute("conn_settings", null);
                req.getSession().setAttribute("tablesList", null);
            }
            String type = req.getParameter("type");
            ConnectionSettings settings = new ConnectionSettings(getConnectionParameters(req));
            try {
                dbManager = service.connect(settings, type);
                req.getSession().setAttribute("db_manager", dbManager);
                req.getSession().setAttribute("conn_settings", settings);
                req.setAttribute("result", "Done");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (action.startsWith("/list")) {
            article = "listArticle.jsp";
            try {
                List<String> list = service.list(dbManager);
                List<String> columns = new LinkedList<>();
                columns.add("Table");
                req.getSession().setAttribute("tablesList", list);
                req.setAttribute("tableColumnsList", columns);
                req.setAttribute("table", list);
                req.setAttribute("resultBlock", "table.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (action.startsWith("/create")) {
            article = "createArticle.jsp";
            try {
                String newTableName = req.getParameter("newTableName");
                List<String> fields = new LinkedList<>();
                int ind = 1;
                String field  = req.getParameter("fieldname" + ind);
                while (field != null) {
                    fields.add(field);
                    field  = req.getParameter("fieldname" + ++ind);
                }
                String result = service.create(dbManager,newTableName,fields);
                req.setAttribute("result", result);
                req.setAttribute("resultBlock", "result.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (tablesList == null || tablesList.isEmpty()) {
            article = "listArticle.jsp";
            req.setAttribute("result", "Tables list is empty.  Use 'list' command to get it");
        } else if (action.startsWith("/find")) {
            article = "findArticle.jsp";
            try {
                List<List<String>> list = service.find(dbManager, req.getParameter("tableName"));
                List<String> columns = service.getColumns(dbManager, req.getParameter("tableName"));
                req.setAttribute("tableColumnsList", columns);
                req.setAttribute("table", list);
                req.setAttribute("resultBlock", "table.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (action.startsWith("/clear")) {
            article = "clearArticle.jsp";
            try {
                String tableName = req.getParameter("tableName");
                String result = service.clearTable(dbManager, tableName);
                req.setAttribute("result", result);
                req.setAttribute("resultBlock", "result.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (action.startsWith("/drop")) {
            article = "dropArticle.jsp";
            try {
                String tableName = req.getParameter("tableName");
                String result = service.dropTable(dbManager, tableName);
                req.getSession().setAttribute("tablesList", service.list(dbManager));
                req.setAttribute("result", result);
                req.setAttribute("resultBlock", "result.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (action.startsWith("/delete")) {
            article = "deleteArticle.jsp";
            try {
                String tableName = req.getParameter("tableName");
                String condColumnName = req.getParameter("condColumnName");
                String condValue = req.getParameter("condValue");
                String result = service.delete(dbManager, tableName, condColumnName,condValue);
                req.setAttribute("result", result);
                req.setAttribute("resultBlock", "result.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        } else if (action.startsWith("/update")) {
            article = "updateArticle.jsp";
            try {
                String tableName = req.getParameter("tableName");
                String condColumnName = req.getParameter("condColumnName");
                String condValue = req.getParameter("condValue");
                String columnName = req.getParameter("updateColumnName");
                String value = req.getParameter("updateValue");
                RowData setValues = new RowData();
                setValues.put(columnName,value);
                String result = service.update(dbManager, tableName, condColumnName,condValue,setValues);
                req.setAttribute("result", result);
                req.setAttribute("resultBlock", "result.jsp");
            } catch (Exception e) {
                req.setAttribute("result", e.getMessage());
            }
        }

        drawMainPage(req, resp, article);
    }

    private List<String> getConnectionParameters(HttpServletRequest req) {
        List<String> settings = new LinkedList<>();
        settings.add(req.getParameter("servername"));
        settings.add(req.getParameter("port"));
        settings.add(req.getParameter("database"));
        settings.add(req.getParameter("username"));
        settings.add(req.getParameter("password"));
        return settings;
    }

    private String createConnectionInfo(ConnectionSettings settings) {
        if (settings != null) {
            StringBuilder connectionInfo = new StringBuilder();
            connectionInfo.append(settings.getAddress());
            connectionInfo.append(" user=");
            connectionInfo.append(settings.getUsername());
            return connectionInfo.toString();
        } else {
            return "None";
        }
    }

    private void drawMainPage(HttpServletRequest req, HttpServletResponse resp, String article) throws ServletException, IOException {
        String conInfo = createConnectionInfo((ConnectionSettings) req.getSession().getAttribute("conn_settings"));
        req.setAttribute("article", article);
        req.setAttribute("connectionStatus", conInfo);
        req.setAttribute("menuItems", service.getMenuList());
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();

    }

    private String getAction(HttpServletRequest req) {
        String requestURI = req.getRequestURI();
        return requestURI.substring(req.getContextPath().length(), requestURI.length());
    }
}
