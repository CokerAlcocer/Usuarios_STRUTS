<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String context = request.getContextPath();%>
<html ng-app="gestionUsuarios">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.32/angular.min.js"></script>
    <title>Formularios | Struts</title>
</head>
<body style="font-family: Arial;">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="<s:url action="index" />">Inicio</a>
            </li>
        </ul>
    </div>
</nav>

<div class="mt-3 container">
    <div class="row d-flex">
        <div class="col-8  align-items-center">
            <h1>Lista de Usuarios</h1>
        </div>
        <div class="col-4 align-items-center text-right">
            <button class="btn btn-success" data-target="#modalAdd" data-toggle="modal"><i class="fas fa-plus"></i> Agregar</button>
        </div>
    </div>
    <hr class="mt-0">
    <div class="row">
        <s:if test="users.size <= 0">
            <div class="col-12">
                <div class="alert alert-warning">
                    <strong>No hay usuarios registrados aún</strong>
                </div>
            </div>
        </s:if>
        <s:else>
            <s:iterator value="users" >
                <div class="col-12 col-lg-4 d-flex">
                    <div class="card shadow mb-4 align-items-stretch flex-fill">
                        <div class="card-body">
                            <h4><s:property value="nombre" /> <s:property value="apPaterno" /> <s:property value="apMaterno" /></h4>
                            <div class="row d-flex align-items-center">
                                <div class="col-6">
                                    <span><s:property value="direccion" /></span><br><span><s:property value="telefono" /></span>
                                </div>
                                <div class="col-6 text-right">
                                    <button class="btn btn-outline-danger" data-toggle="modal" data-target="#modalRemove" onclick="setIdOnModal(<s:property value="id" />)"><i class="fas fa-trash"></i></button>
                                    <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modalMod"><i class="fas fa-edit"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </s:iterator>
        </s:else>
    </div>
</div>

<!-- Modal de Eliminación -->
<div class="modal fade" id="modalRemove" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="card-body">
                <h2>¡AVISO!</h2>
                <hr>
                <p>¿Estás seguro de que deseas eliminar a este usuario? Una vez eliminado, la información no podrá recuperarse.</p>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-12 text-right">
                        <form action="<%=context%>/removeUser" method="post">
                            <input type="hidden" id="idRem" name="idRem">
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Registro -->
<div class="modal fade" id="modalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="card">
                <form action="<%=context%>/saveUser" method="post">
                    <div class="card-body">
                        <h2>Registro de usuario</h2>
                        <hr>
                        <div class="row">
                            <div class="col-12 form-group">
                                <label for="nombre">Nombre</label>
                                <input name="nombre" id="nombre" class="form-control" required/>
                            </div>
                            <div class="col-12 col-lg-6 form-group">
                                <label for="apPaterno">Apellido Paterno</label>
                                <input name="apPaterno" id="apPaterno" class="form-control" required/>
                            </div>
                            <div class="col-12 col-lg-6 form-group">
                                <label for="apMaterno">Apellido Materno</label>
                                <input name="apMaterno" id="apMaterno" class="form-control" required/>
                            </div>
                            <div class="col-12 form-group">
                                <label for="direccion">Dirección</label>
                                <input name="direccion" id="direccion" class="form-control" required/>
                            </div>
                            <div class="col-12 form-group">
                                <label for="telefono">Teléfono</label>
                                <input name="telefono" id="telefono" class="form-control" required/>
                            </div>
                            <div class="col-12 form-group">
                                <label>Operation: <s:property value="operation" /></label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Modificacion -->
<div class="modal fade" id="modalMod" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="card">
                <form action="<%=context%>/saveUser" method="post">
                    <div class="card-body">
                        <h2>Modificar usuario</h2>
                        <hr>
                        <div class="row">
                            <div class="col-12 form-group">
                                <label for="nombre">Nombre</label>
                                <input name="nombre" id="nombre" class="form-control" required/>
                            </div>
                            <div class="col-12 col-lg-6 form-group">
                                <label for="apPaterno">Apellido Paterno</label>
                                <input name="apPaterno" id="apPaterno" class="form-control" required/>
                            </div>
                            <div class="col-12 col-lg-6 form-group">
                                <label for="apMaterno">Apellido Materno</label>
                                <input name="apMaterno" id="apMaterno" class="form-control" required/>
                            </div>
                            <div class="col-12 form-group">
                                <label for="direccion">Dirección</label>
                                <input name="direccion" id="direccion" class="form-control" required/>
                            </div>
                            <div class="col-12 form-group">
                                <label for="telefono">Teléfono</label>
                                <input name="telefono" id="telefono" class="form-control" required/>
                            </div>
                            <div class="col-12 form-group">
                                <label>Operation: <s:property value="operation" /></label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Cancelar</button>
                        <button type="submit" class="btn btn-warning">Modifcar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    let flag = false;
    const setIdOnModal = (id) => {
        document.getElementById('idRem').value = id;
    }

    const app = angular.module('gestionUsuarios', []);

    app.controller('editController', [$scope, ($scope) => {

    }]);

</script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</html>