package ua.com.juja.maistrenko.sqlcmd.spring;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("WEB-INF/application-context.xml");
        HelloWorld hw = (HelloWorld) ac.getBean("HelloWorld");
        hw.hello();
    }
}
