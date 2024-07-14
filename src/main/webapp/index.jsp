<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
    Map<String,String> errores = (Map<String,String>)request.getAttribute("errores");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Formulario de Usuarios</title>
</head>
<body>
<h3>Formulario de Usuarios</h3>

<%
    if(errores != null && !errores.isEmpty()){
%>
<ul class="alert alert-danger mx-5 px-5">
    <% for (String error : errores.values()){%>
    <li><%=error%></li>
    <%}%>
</ul>
<%}%>

<div class="px-5">
<form action="/webapp-form/form" method="post">

    <div class="row mb-3">
        <label for="username" class="col-form-label col-sm-2">Nombre</label>
        <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control" value="${param.username}"></div>
        <%
            if(errores != null && errores.containsKey("username")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("username") + "</small>");
            }
        %>
    </div>

    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Contraseña</label>
        <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control" ></div>
        <%
            if(errores != null && errores.containsKey("password")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("password") + "</small>");
            }
        %>
    </div>

    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Email</label>
        <div class="col-sm-4"><input type="text" name="email" id="email" class="form-control" value="${param.email}" ></div>
        <%
            if(errores != null && errores.containsKey("email")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("email") + "</small>");
            }
        %>
    </div>

    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">Pais</label>
        <div class="col-sm-4">
            <select name="pais" id="pais" class="form-select"> class
            <option value="">-- seleccionar --</option>
            <option value="ES" ${param.pais.equals("ES")? "selected":""}>España</option>
            <option value="MX" ${param.pais.equals("MX")? "selected":""}>México</option>
            <option value="EUA" ${param.pais.equals("EUA")? "selected":""}>Estados Unidos</option>
            <option value="CAN" ${param.pais.equals("CAN")? "selected":""}>Canada</option>
            <option value="ARG" ${param.pais.equals("ARG")? "selected":""}>Argentina</option>
            <option value="COL" ${param.pais.equals("COL")? "selected":""}>Colombia</option>
            <option value="VEN" ${param.pais.equals("VEN")? "selected":""}>Venezuela</option>
        </select>
        </div>
        <%
            if(errores != null && errores.containsKey("pais")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("pais") + "</small>");
            }
        %>
    </div>

    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Lenguajes</label>

    <div class="col-sm-4">
        <select name="lenguajes" id="lenguajes" class="form-select" multiple>
            <option value="java" ${paramValues.lenguajes.stream().anyMatch(v-> v.equals("java")).get()?"selected": ""}>Java</option>
            <option value="jakarta" ${paramValues.lenguajes.stream().anyMatch(v-> v.equals("jakarta")).get()?"selected": ""}>Jakarta EE9</option>
            <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v-> v.equals("spring")).get()?"selected": ""}>Spring Boot</option>
            <option value="js" ${paramValues.lenguajes.stream().anyMatch(v-> v.equals("js")).get()?"selected": ""}>JavaScript</option>
            <option value="angular" ${paramValues.lenguajes.stream().anyMatch(v-> v.equals("angular")).get()?"selected": ""}>Angular</option>
        </select>
    </div>
        <%
            if(errores != null && errores.containsKey("lenguajes")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("lenguajes") + "</small>");
            }
        %>
    </div>

    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Roles</label>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_ADMIN"
                   ${paramValues.roles.stream().anyMatch(v-> v.equals("ROLE_ADMIN")).get()?"checked": ""}
                   class="form-check-input">
            <label>Administrador</label>
        </div>
        <div class="form-check col-sm-2" >
            <input type="checkbox" name="roles" value="ROLE_USER"
                   ${paramValues.roles.stream().anyMatch(v-> v.equals("ROLE_USER")).get()?"checked": ""}
                   class="form-check-input">
            <label>Usuario</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_MODERATOR"
                   ${paramValues.roles.stream().anyMatch(v-> v.equals("ROLE_MODERATOR")).get()?"checked": ""}
                   class="form-check-input">
            <label>Moderador</label>
        </div>
        <%
            if(errores != null && errores.containsKey("roles")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("roles") + "</small>");
            }
        %>
    </div>

    <div class="row mb-3">
        <label  class="col-form-label col-sm-2">Idiomas</label>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="ES" class="form-check-input" ${param.idioma.equals("ES")? "checked":""}>
            <label class=form-check-label>Español</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="EN" class="form-check-input" ${param.idioma.equals("EN")? "checked":""}>
            <label class=form-check-label>Inglés</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="FR" class="form-check-input" ${param.idioma.equals("FR")? "checked":""}>
            <label class="form-check-label">Frances</label>
        </div>
        <%
            if(errores != null && errores.containsKey("idioma")){
                out.println("<small class='alert alert-danger' style='color:red;'>" + errores.get("idioma") + "</small>");
            }
        %>
    </div>
    <div class="row mb-3" >
        <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
        </div>
    </div>

    <div class="row mb-3">
        <div>
            <input type="submit" value="Enviar" class="btn btn-primary">
        </div>
    </div>
    <input type="hidden" name="secreto" value="12345">

</form>
</div>
</body>
</html>