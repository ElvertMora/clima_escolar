<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Index Cordinador</title>
    </head>
    <body>

        <div id="status" role="complementary">


        </div>
        <div id="page-body" role="main" class="container">
            <h1>Cordinador</h1>
            <ul>
                <li class="controller"><g:link controller="colegio" action="list">lista de Colegios</g:link></li>
                <li class="controller"><g:link controller="Operario" action="list">lista de Gestores UN</g:link></li>
                <li class="controller"><g:link controller="logout">Cerrar sesión</g:link></li>
                </ul>
            </div>
    </body>
</html>
