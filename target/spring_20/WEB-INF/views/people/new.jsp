<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
        .my_wight{
            margin: 0 auto;
            width: 30%;
        }
    </style>
</head>
<body>
<div align="center" >
    <h1 th:text="${operation}"></h1>
    <form  method='post' action='${path}' th:object="${person}">
        <div class="my_wight">
            <div class="mb-3">
                <label class="form-label" for="login">Enter login: </label>
                <div th:if="${doOperation} == 'Create'">
                    <input class="form-control" type="text" th:field="*{login}" id="login">
                </div>
                <div th:if="${doOperation} == 'Update'">
                    <input class="form-control" type="text" th:field="*{login}" th:readonly="readonly" th:value="${user.getLogin()}" id="login">
                </div>
            </div>
            <br/>
            <div class="mb-3">
                <label class="form-label" for="password">Enter password: </label>
                <div th:if="${doOperation} == 'Create'">
                    <input class="form-control" type="password" th:field="*{password}" id="password">
                </div>
                <div th:if="${doOperation} == 'Update'">
                    <input class="form-control" type="password" th:field="*{password}" th:value="${user.getPassword()}" id="password">
                </div>
            </div>
            <br/>
            <div class="mb-3">
                <label class="form-label" for="first_name">Enter first name: </label>
                <div th:if="${doOperation} == 'Create'">
                    <input width="20%" class="form-control" type="text" th:field="*{first_name}"  id="first_name">
                </div>
                <div th:if="${doOperation} == 'Update'">
                    <input width="20%" class="form-control" type="text" th:field="*{first_name}" th:value="${user.getFirst_name()}" id="first_name">
                </div>

            </div>
            <br/>
            <div class="mb-3">
                <label class="form-label" for="last_name">Enter last name: </label>
                <div th:if="${doOperation} == 'Create'">
                    <input class="form-control" type="text" th:field="*{last_name}" id="last_name">
                </div>
                <div th:if="${doOperation} == 'Update'">
                    <input class="form-control" type="text" th:field="*{last_name}" th:value="${user.getLast_name()}" id="last_name">
                </div>
            </div>
            <br/>
            <div class="mb-3">
                <label class="form-label" for="email">Enter email: </label>
                <div th:if="${doOperation} == 'Create'">
                    <input class="form-control" type="text" th:field="*{email}" id="email">
                </div>
                <div th:if="${doOperation} == 'Update'">
                    <input class="form-control" type="text" th:field="*{email}" th:value="${user.getEmail()}" id="email">
                </div>
            </div>
            <br/>
            <div class="mb-3">
                <label class="form-label" for="birthday">Enter birthday: </label>
                <div th:if="${doOperation} == 'Create'">
                    <input class="form-control" type="date" th:field="*{birthday}" id="birthday">
                </div>
                <div th:if="${doOperation} == 'Update'">
                    <input class="form-control" type="date" th:field="*{birthday}" th:value="${user.getBirthday()}" id="birthday">
                </div>
            </div>

            <br/>
            <label class="form-label" for="role">Chose role: </label>
            <div th:if="${doOperation} == 'Create'">
                <select class="form-select form-select-lg mb-3" id="role" th:field="*{id_role}" name="Role">
                    <option value="1">User</option>
                    <option value="2">Admin</option>
                </select>
            </div>
            <div th:if="${doOperation} == 'Update'">
                <select class="form-select form-select-lg mb-3" id="role" th:value="${user.getId_role()}" th:field="*{id_role}" name="Role">
                    <option value="1">User</option>
                    <option value="2">Admin</option>
                </select>
            </div>

            <br/>
            <input class="btn btn-primary" type="submit" th:value="${doOperation}">
        </div>
    </form>
</div>


</body>
</html>