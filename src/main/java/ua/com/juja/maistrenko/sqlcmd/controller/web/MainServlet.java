package ua.com.juja.maistrenko.sqlcmd.controller.web;

import ua.com.juja.maistrenko.sqlcmd.controller.service.Service;
import ua.com.juja.maistrenko.sqlcmd.controller.service.ServiceImpl;
import ua.com.juja.maistrenko.sqlcmd.model.DBManager;

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
        if (action.startsWith("/list")) {
            req.setAttribute("article","listArticle.jsp");
        } else if (action.startsWith("/find")) {
            req.setAttribute("article","findArticle.jsp");
        } else if (action.startsWith("/create")) {
            req.setAttribute("article","createArticle.jsp");
        } else if (action.startsWith("/insert")) {
            req.setAttribute("article","insertArticle.jsp");
        } else if (action.startsWith("/update")) {
            req.setAttribute("article","updateArticle.jsp");
        } else if (action.startsWith("/delete")) {
            req.setAttribute("article","deleteArticle.jsp");
        } else if (action.startsWith("/clear")) {
            req.setAttribute("article","clearArticle.jsp");
        } else if (action.startsWith("/drop")) {
            req.setAttribute("article", "dropArticle.jsp");
        } else {  //(action.startsWith("/connect")){
            req.setAttribute("article","connectArticle.jsp");
        }
        drawMainPage(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = getAction(req);
        if (action.startsWith("/connect")){
            DBManager dbManager = (DBManager) req.getSession().getAttribute("db_manager");
            if (dbManager!=null) {
                service.closeConnection(dbManager);
                req.getSession().setAttribute("conn_settings","");
            }
            List<String> settings = new LinkedList<>();
            String type = req.getParameter("type");

            settings.add(req.getParameter("servername"));
            settings.add(req.getParameter("port"));
            settings.add(req.getParameter("database"));
            settings.add(req.getParameter("username"));
            settings.add(req.getParameter("password"));

            try {
                dbManager = service.connect(settings,type);
                req.getSession().setAttribute("db_manager",dbManager);
                req.getSession().setAttribute("conn_settings",settings.toString());
                req.setAttribute("result","OK");
            } catch (Exception e) {
                req.setAttribute("result",e.getMessage());
            }
            req.setAttribute("article","connectArticle.jsp");
            drawMainPage(req, resp);
        }
        //        req.setAttribute("menuItems",service.getMenuList());
//        req.getRequestDispatcher("menu.jsp").forward(req, resp);
        //doGet(req,resp);
    }

    private void drawMainPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("connectionStatus",req.getSession().getAttribute("conn_settings"));
        req.setAttribute("menuItems",service.getMenuList());
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
        //TODO close open connection
    }

    private String getAction(HttpServletRequest req) {
        String requestURI = req.getRequestURI();
        return requestURI.substring(req.getContextPath().length(), requestURI.length());
    }
}
