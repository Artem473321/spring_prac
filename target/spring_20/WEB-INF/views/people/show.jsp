<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Человек</title>
</head>
<body>
<p th:text="${person.getFirst_name()}">VALUE</p>
<p th:text="${person.getLast_name()}">VALUE</p>
<p th:text="${person.getId()}">VALUE</p>
<p th:text="${ person.getAge()}">VALUE</p>
<p th:text="${person.getEmail()}">VALUE</p>
<a th:href="@{/people/{id}/edit(id=${person.getId()})}">Edit</a>
<form th:method="DELETE" th:action="@{/people/{id}/(id=${person.getId()})}">
    <input type="submit" value="Delete">
</form>
</body>
</html>