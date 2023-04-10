<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update person</title>
</head>
<body>

<h1 th:text="${operation}"></h1>
<form th:method="${method}" action="${path}" th:action="@{/people/{id}(id=${person.getUser_id()})}" th:object="${person}">
    <label for="first_name">Enter first name: </label>
    <input type="text" th:field="*{first_name}" th:value="${user.getFirst_name()}" id="first_name">

    <br/>

    <label for="last_name">Enter last name: </label>
    <input type="text" th:field="*{last_name}" th:value="${user.getLast_name()}" id="last_name">

    <br/>

    <label for="login">Enter login: </label>
    <input type="text" th:field="*{login}" th:value="${user.getLogin()}" th:readonly="${trueOrFalse}" id="login">

    <br/>

    <label for="password">Enter password: </label>
    <input type="text" th:field="*{password}" th:value="${user.getPassword()}" id="password">

    <br/>

    <label for="email">Enter email: </label>
    <input type="text" th:field="*{email}" th:value="${user.getEmail()}" id="email">

    <br/>

    <label for="birthday">Enter birthday: </label>
    <input type="text" th:field="*{birthday}" th:value="${user.getBirthday()}" id="birthday">

    <br/>

    <label for="role">Chose role: </label>
    <select id="role" th:field="*{id_role}" th:value="${user.getId_role()}" name="Role">
        <option value="1">User</option>
        <option value="2">Admin</option>
    </select>

    <br/>

    <input type="submit" th:value="${doOperation}">
</form>
</body>
</html>