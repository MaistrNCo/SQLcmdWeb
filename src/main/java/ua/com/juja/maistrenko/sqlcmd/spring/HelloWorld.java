package ua.com.juja.maistrenko.sqlcmd.spring;

public class HelloWorld {
    private String name;
    public void setName(String name){
        this.name = name;
    }
    void hello(){
        System.out.println("Hello " + name);
    }
}
