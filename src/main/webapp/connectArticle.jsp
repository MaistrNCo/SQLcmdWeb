<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<article>
    <h1>Connect</h1>
    <form action="connect" method="post">
    <table>
        <tr>
            <td>
                Server type:
            </td>
            <td><select name="type">
                <option value="PostgreSQL">PostgreSQL</option>
                <option value="MySQL">MySQL</option>
            </select></td>
        </tr>
        <tr>
            <td>Server:</td>
            <td><input name="servername" ></td>
        </tr>
        <tr>
            <td>Port:</td>
            <td><input name="port" ></td>
        </tr>
        <tr>
            <td>DBase:</td>
            <td><input name="database" ></td>
        </tr>
        <tr>
            <td>user:</td>
            <td><input name="username" ></td>
        </tr>
        <tr>
            <td>pass:</td>
            <td><input type="password" name="password" ></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Connect"></td>
        </tr>
    </table>
</form>
    <jsp:include page="${resultBlock}"/>
</article>
