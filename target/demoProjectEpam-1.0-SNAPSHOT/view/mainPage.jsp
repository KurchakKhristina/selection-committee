<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link media="all" rel="stylesheet" href="view/style1.css">
    <title>Приймальна комісія</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../header.jsp"%>
<header>
    <div class="section" id="home">
        <div class="row">
            <div class="center">
<c:choose>
    <c:when test="${username == null}">

                <a href="#faculty" class="button button2  btn-lg" data-toggle="modal">Обрати факультет</a>
            </div>
            <!--Grid column-->
        </div>
        <!-- Modal -->
        <div class="modal fade" id="faculty" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Попередження</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Щоб обрати факультет потрібно увіти в систему
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        </c:when>
        <c:when test="${temp_user.blocked == 1 }">

        <a href="#faculty" class="button button2  btn-lg" data-toggle="modal">Обрати факультет</a>
    </div>
    <!--Grid column-->
    </div>
    <!-- Modal -->
    <div class="modal fade" id="faculty" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLongTitle">Помилка</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   Ваш акаунт заблокований адміністратором!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    </c:when>
        <c:otherwise>
        <a href="facultyList#faculty" class="button button2  btn-lg" >Обрати факультет</a>
    </div>
    </c:otherwise>
    </c:choose>

</header>
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
