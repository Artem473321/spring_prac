<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>People</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<br/>
<form th:action="@{/} " method="get">
    <div align="right">
        <input type="submit" value="Logout" class="btn btn-outline-secondary" />
    </div>
</form>



<a class="btn btn-outline-danger" href="/people/new">Create new person</a>
<hr/>
<table class="table">
    <thead  class="thead-light">
    <tr>
        <th scope="col">id</th>
        <th scope="col">First name</th>
        <th scope="col">Last name</th>
        <th scope="col">Password</th>
        <th scope="col">Login</th>
        <th scope="col">Email</th>
        <th scope="col">Birthday</th>
        <th scope="col">Role</th>
        <th colspan=2 align="center" scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <div th:each="person : ${people}">
        <tr>
            <th scope="row" th:text="${person.getUser_id()}"></th>
            <td th:text="${person.getFirst_name()}"></td>
            <td th:text="${person.getLast_name()}"></td>
            <td th:text="${person.getPassword()}"></td>
            <td th:text="${person.getLogin()}"></td>
            <td th:text="${person.getEmail()}"></td>
            <td th:text="${#dates.year(localDate) - #dates.year(person.getBirthday())}">VALUE</td>
            <td th:text=" ${roleDAO.findById(person.getId_role()).getName()}">VALUE</td>
            <td><a th:href="@{/people/{id}/edit(id=${person.getUser_id()})}" >Edit</a></td>
            <td>
                <form th:method="DELETE" th:action="@{/people/{id}/(id=${person.getUser_id()})}">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
    </div>
    </tbody>
</table>
<hr/>
<h1 th:hidden="t"></h1>
</body>
</html>