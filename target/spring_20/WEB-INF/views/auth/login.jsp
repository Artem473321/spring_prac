<html xmlns:th="http://www.thymeleaf.org" lang="en">
<html lang="en">
<head>
    <title>Authorisation</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">


</head>
<body>


<div align="center">
    <form action="/process_login" th:method="POST">
        <h1 class="mt-1 mb-1 pb-1">Auth Form</h1>
        <table style="with: 100% ">
            <tr>
                <td>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="username">Login</label>
                        <input class="form-control" type="text" id="username" name="username"/>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="password">Password</label>
                        <input class="form-control" type="password" id="password" name="password"/>
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
</form>
</body>
</html>