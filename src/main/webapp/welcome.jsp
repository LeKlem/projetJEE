<%-- 
    Document   : welcome
    Created on : 3 janv. 2019, 01:46:35
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
       
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <style>
            .div1{
                position: fixed;
                margin-top: 200px;
                margin-left: 35%;
                font-size: 30px;;
            }
            
            .div2{
                position: fixed;
                margin-left: 76%;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            if(session.getAttribute("login")==null){
                response.sendRedirect("index.html");
           }
        %>
        <div class="div1">
            <p>
                Bienvenue dans la page d'accueil :)
            </p>
        </div>
        
        <div class="div2">
          <!--  <form action="deconnexion" method="POST">
                <button class="b2 btn btn-success" type="submit" > Se déconnecter </button> 
           </form>
          -->
                <a href="deconnexion" id="b2" class="btn btn-info" role="button">Déconnexion</a>
           
        </div>
        
        
    </body>
</html>

