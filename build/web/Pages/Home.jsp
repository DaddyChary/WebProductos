<%@page import="model.Producto"%>
<%@page import="service.Dao_Producto"%>
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
        <title>Crud Java Web</title>
        <!-- Material Icon CDN -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Materialize CSS CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Your custom styles -->
        <link rel="stylesheet" href="css/style.css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                            <li><a href="../Controller_Logout.do">Logout</a></li>
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
        <%ConexionSingleton oConexionSingleton = ConexionSingleton.getIntance();%>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col s12 m6 l6">
                        <div class="card-panel">
                            <div class="card-content">
                                <h4>Crear Producto</h4>
                                <div class="row">
                                    <div class="row">
                                        <form action="../insertProduct" method="post" class="col s12">
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input id="nombre" name="nombre" type="text" class="validate" required>
                                                    <label for="nombre">Nombre</label>
                                                </div>
                                                <div class="input-field col s6">
                                                    <input id="descripcion" name="descripcion" type="text" class="validate" required>
                                                    <label for="descripcion">Descripcion</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input id="precio" name="precio" type="text" class="validate" required>
                                                    <label for="precio">Precio</label>
                                                </div>
                                            </div>
                                            <button type="submit" class="waves-effect waves-light btn">Crear</button>
                                        </form>
                                    </div>
                                    <!--<img src="IMG/Create.jpg">-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m6 l6">
                        <div class="card-panel">
                            <div class="card-content">
                                <h4>Lista de Productos</h4>
                                <div class="row">
                                    <table class = "striped responsive-table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Precio</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Dao_Producto oDao_Producto = new Dao_Producto(oConexionSingleton);
                                                List<Producto> oList = oDao_Producto.getAll().get();
                                                for (Producto oProducto : oList) {
                                            %>
                                            <tr>
                                                <td><%= oProducto.getId()%></td>
                                                <td><%= oProducto.getNombre()%></td>
                                                <td><%= oProducto.getDescripcion()%></td>
                                                <td><%= oProducto.getPrecio()%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <!--<img src="IMG/Read.jpg">-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 l6">
                        <div class="card-panel">
                            <div class="card-content">
                                <h4>Actualizar Productos</h4>
                                <div class="row">
                                    <form action="../updateProduct" method="post" class="col s12">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <input id="id" name="id" type="text" class="validate" required>
                                                <label for="id">ID</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input id="nombre" name="nombre" type="text" class="validate" required>
                                                <label for="nombre">Nombre</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <input id="descripcion" name="descripcion" type="text" class="validate" required>
                                                <label for="descripcion">Descripcion</label>
                                            </div>
                                            <div class="input-field col s6">
                                                <input id="precio" name="precio" type="text" class="validate" required>
                                                <label for="precio">Precio</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="waves-effect waves-light btn">Actualizar</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m6 l6">
                        <div class="card-panel">
                            <div class="card-content">
                                <h4>Eliminar Producto</h4>
                                <div class="row">
                                    <form action="../deleteProduct" method="post" class="col s12">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                <input id="id" name="id" type="text" class="validate" required>
                                                <label for="id">ID</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="waves-effect waves-light btn">Eliminar</button>
                                    </form>
                                </div>
                                <!--<img src="IMG/Delete.jpg">-->
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>
        <%@include file="../Layouts/footer.jsp" %>
        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <!-- Materialize JS CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <!--  <script src="JS/validarut.js"></script>
        <script src="JS/jquery.rut.js"></script>-->
        <!--  <script>
            $("document").ready(function () {
                $(".button-collapse").sideNav();
            });
            $(function () {
                $("input#rut_Profe").rut({
                    formatOn: 'keyup',
                    minimumLength: 8, // validar largo mínimo; default: 2
                    validateOn: 'change' // si no se quiere validar, pasar null
                });
                var input = document.getElementById('rut_Profe');
                input.addEventListener('input', function () {
                    if (this.value.length >= 13)
                        this.value = this.value.slice(0, 12);
                })
            });
        </script>-->
    </body>
</html>