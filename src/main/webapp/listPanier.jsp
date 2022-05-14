<%@page import="java.util.Calendar"%>
<%@page import="entities.paniers"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.paniersDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lacgaa.tdsi.connectionBaseDeDonnees"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
<title>liste de paniers</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
.div2 {
	position: fixed;
	margin-left: 76%;
	margin-top: 10px;
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
        <%
if(request.getParameter("success") != null){
	%>
	<div class="alert alert-success" role="alert">
Panier acheté avec succès !</div>
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

	<div class="div1">
		<form action="" method="">
			Nom du panier : <input type="text" name="nomP" /> <br /> Nom
			du Restaurant: <input type="text" name="nomR" /> <br />
			Ville : <input type="text" name="ville" /> 
			<input type="submit" value="rechercher" name="recherche">
		</form>
		<p>
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr>

			</tr>
			<tr bgcolor="#5bc0de">
				<td><b>&nbspTitre</b></td>
				<td><b>&nbspDescription</b></td>
				<td><b>&nbspVendeur</b></td>
				<td><b>&nbspVille</b></td>
				<td><b>&nbspAction</b></td>
			</tr>
			<%
			String recherche = request.getParameter("recherche");
if(recherche!=null){
try{ 
Connection con = connectionBaseDeDonnees.connexionBase();
Statement statement = con.createStatement();
String nomP = request.getParameter("nomP");
String nomR = request.getParameter("nomR");
String ville = request.getParameter("ville");
String sql = null;
if(nomP.equals("") && nomR.equals("") && ville.equals("")){
sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE idAcheteur=0 AND validated = 1";
}
else if(!nomP.equals("") && nomR.equals("") && ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE titre = '" + nomP + "' AND idAcheteur=0 AND validated = 1";
	} 
else if(nomP.equals("") && !nomR.equals("") && ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.nom = '" + nomR + "' AND idAcheteur=0 AND validated = 1";
	}
else if(nomP.equals("") && nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND idAcheteur=0 AND validated = 1";
	}
else if(!nomP.equals("") && nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND titre = '" + nomP + "' AND idAcheteur=0 AND validated = 1";
	}
else if(nomP.equals("") && !nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND panier.idResto = restaurant.idResto AND restaurant.nom = '" + nomR + "' AND idAcheteur=0 AND validated = 1";
	}
else if(!nomP.equals("") && !nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND panier.idResto = restaurant.idResto AND restaurant.nom = '" + nomR + "' AND titre = '" + nomP + "' AND idAcheteur=0 AND validated = 1" ;
	}
ResultSet st= statement.executeQuery(sql);
while(st.next()){
%>
			<tr bgcolor="white">

				<td>&nbsp<%=st.getString("titre") %>&nbsp</td>
				<td>&nbsp<%=st.getString("description") %>&nbsp</td>
				<td>&nbsp<%=st.getString("nom") %>&nbsp</td>
				<td>&nbsp<%=st.getString("adresse") %>&nbsp</td>
				<td>&nbsp<a href="list?idPanier=<%=st.getInt("idPanier") %>">Acheter</a>&nbsp</td>
			</tr>
			<% 
}

} catch (Exception e) {
e.printStackTrace();
}
}
%>
		</table>

		</p>


	</div>




</body>