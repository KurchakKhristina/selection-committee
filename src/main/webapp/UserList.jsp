<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 28.05.2021
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="view/style1.css">
</head>
<body>

    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("id") != session.getId() || !session.getAttribute("role").equals("Admin")) {
        response.sendRedirect("index.jsp");
    }
%>

<%@ include file="header.jsp" %>
    <div class="section" id="users" >
        <h2 class="site-title">Список Користувачів</h2>

        <div class="m-2" style="margin-top:100px">
            <table style="margin-top:60px" class="table table-hover" id="customersTable">
                <thead>
                <tr>
                    <td>Абітурієнт</td>
                    <td>Прізвище</td>
                    <td>Ім'я</td>
                    <td>По-батькові</td>
                    <td>Роль</td>
                </tr>
                </thead>
                <c:forEach items="${user_list}" var="user_list">
                    <tbody>
                    <tr>
                        <c:url var="userLink" value="UserInfo">
                            <c:param name="userId" value="${user_list.id}"/>
                        </c:url>

                        <td>
                            <a style="text-decoration: blue" href="${userLink}">
                                <button class="btn btn-light but">
                                        ${user_list.id}
                                </button>
                            </a>
                        </td>
                        <td><c:out value="${user_list.lastName}"/></td>
                        <td><c:out value="${user_list.firstName}"/></td>
                        <td><c:out value="${user_list.surName}"/></td>
                        <td><c:out value="${user_list.role}"/></td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
<footer class="bg-dark text-center text-white "> <!--'fixed-bottom'-->
    <!-- Grid container -->
    <div class="container p-2">
        <!-- Section: Social media -->
        <section class="mb-2">
            <!-- Facebook -->

            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button">
                <i  class="fab fa-facebook-f"></i>
            </a>

            <!-- Twitter -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-twitter"></i
            ></a>

            <!-- Google -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-google"></i
            ></a>

            <!-- Instagram -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-instagram"></i
            ></a>

            <!-- Linkedin -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-linkedin-in"></i
            ></a>

        </section>

    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2021 Copyright:
        <a class="text-white" href="/">SelectionCommittee.com</a>
    </div>
    <!-- Copyright -->
</footer>

</html>
