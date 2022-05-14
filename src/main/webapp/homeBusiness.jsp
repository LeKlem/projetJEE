<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>

<title>Ajout d'un panier</title>
</head>
<body>
<%
if(request.getParameter("success") != null){
	%>
	<div class="alert alert-success" role="alert">
Panier ajouté !</div>
	<%
}

%>
<div class="div2">
		<!--  <form action="deconnexion" method="POST">
                <button class="b2 btn btn-success" type="submit" > Se déconnecter </button> 
           </form>
          -->
		<a href="deconnexion" id="b2" class="btn btn-info" role="button">Déconnexion</a>
	</div>
<div class="form container mt-1">
        <form action="ajout-panier" method="POST">
            <div class="f">
            <fieldset>
                <legend>Ajout d'un panier </legend>
                <label for="nom"> Nom </label>  <input type="text"  name="nom" id="nom" placeholder="Entrez un titre" required><BR><BR><BR>
                <label  for="desc"> Description : </label>  <input type="text"  name="desc" id="desc" placeholder="Entrez une description" required><BR><BR><BR>
                <button class="b2 btn btn-primary" type="submit" > Ajouter </button>
            
            </fieldset>
            
            </div>
        </form>

      </div>
</body>
</html>