<%@page import="java.util.Optional"%>
<%@page import="java.util.List"%>
<%@page import="db.ConexionSingleton"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Login</title>
        <!-- Material Icon CDN -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Materialize CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Your custom styles -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Used as an example only to position the footer at the end of the page.
        You can delete these styles or move it to your custom css file -->
        <style>
            body {
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }
            main {
                flex: 1 0 auto;
            }
            .container {
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="cyan">
                <div class="nav-wrapper">
                    <div class="container">
                        <a href="#" class="brand-logo">Productos</a>
                        <a href="#" data-activates="mobile-menu" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="#">Home</a></li>
                        </ul>
                        <ul class="side-nav" id="mobile-menu">
                            <li>
                                <div class="userView">
                                    <div class="background">
                                        <img src="http://lorempixel.com/output/abstract-q-c-640-480-10.jpg" alt="Background Sidenav">
                                    </div>
                                    <a href="#!user"><img class="circle" src="http://lorempixel.com/output/people-q-c-640-480-9.jpg" alt="User Image Sidenav"></a>
                                    <a href="#!name"><span class="white-text name">John Doe</span></a>
                                    <a href="#!email"><span class="white-text email">jdandturk@gmail.com</span></a>
                                </div>
                            </li>
                            <li><a href="#">item1</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col s12 m6 offset-m3">
                        <div class="card-panel">
                            <div class="card-content">
                                <h4 class="center-align">Login</h4>
                                <div class="row">
                                    <form action="Controller_Login.do" method="post" class="col s12">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="username" name="txt_username" type="text" class="validate" required>
                                                <label for="username">Nombre de Usuario</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="password" name="txt_password" type="password" class="validate" required>
                                                <label for="password">Contraseña</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 center-align">
                                                <button type="submit" class="waves-effect waves-light btn">Iniciar Sesión</button>
                                            </div>
                                        </div>
                                    </form>
                                    <%
                                        String error = request.getParameter("error");
                                        if (error != null) {
                                    %>
                                    <p style="color: red;">Credenciales invalidas intentalo denuevo</p>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="Layouts/footer.jsp" %>
        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <!-- Materialize JS CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                // Initialize Materialize components
                M.updateTextFields();
            });
        </script>
    </body>
</html>
