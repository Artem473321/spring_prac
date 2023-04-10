<%--
  Created by IntelliJ IDEA.
  User: Aser
  Date: 15.02.2023
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <h1 class="mt-1 mb-5 pb-1">Auth Form</h1>
    <form action="/process_login" th:method="POST" th:object="${person}">
        <table style="with: 100% ">
            <tr>
                <td>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="username">Login</label>
                        <input class="form-control" type="text" th:field="*{login}" id="username" name="username"/>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="password">Password</label>
                        <input class="form-control" type="password" th:field="*{password}" id="password" name="password"/>
                    </div>

                </td>
            </tr>

        </table>
        <div th:if="${param.error}" style="color: red">
            <p>Error password or username</p>
        </div>

        <input class="btn btn-outline-success" type="submit" value="Sign in"/>
        <a class="btn btn-outline-dark" href="/people/new">Sign up</a>
    </form>

</div>
</body>
</html>
