<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
    <h1>List</h1>
    <form action="list" method="post">
        <input type="submit" value="Get tables">
    </form>

    <jsp:include page="${resultBlock}"/>
</article>
