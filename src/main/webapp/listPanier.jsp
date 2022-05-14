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
	<div class="div2">
		<!--  <form action="deconnexion" method="POST">
                <button class="b2 btn btn-success" type="submit" > Se d�connecter </button> 
           </form>
          -->
		<a href="deconnexion" id="b2" class="btn btn-info" role="button">D�connexion</a>
		<a href="Panier.jsp" id="b3" class="btn btn-info" role="button">Panier</a>
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
			<tr bgcolor="blue">
				<td><b>titre</b></td>
				<td><b>image</b></td>
				<td><b>description</b></td>
				<td><b>vendeur</b></td>
				<td><b>Ville</b></td>
				<td><b>Action</b></td>
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
sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE idAcheteur=0";
}
else if(!nomP.equals("") && nomR.equals("") && ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE titre = '" + nomP + "' AND idAcheteur=0";
	} 
else if(nomP.equals("") && !nomR.equals("") && ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.nom = '" + nomR + "' AND idAcheteur=0";
	}
else if(nomP.equals("") && nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND idAcheteur=0";
	}
else if(!nomP.equals("") && nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND titre = '" + nomP + "' AND idAcheteur=0";
	}
else if(nomP.equals("") && !nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND panier.idResto = restaurant.idResto AND restaurant.nom = '" + nomR + "' AND idAcheteur=0";
	}
else if(!nomP.equals("") && !nomR.equals("") && !ville.equals("")){
	sql ="SELECT DISTINCT * FROM panier INNER JOIN restaurant ON panier.idResto = restaurant.idResto WHERE panier.idResto = restaurant.idResto AND restaurant.adresse = '" + ville + "' AND panier.idResto = restaurant.idResto AND restaurant.nom = '" + nomR + "' AND titre = '" + nomP + "' AND idAcheteur=0" ;
	}
ResultSet st= statement.executeQuery(sql);
while(st.next()){
%>
			<tr bgcolor="#DEB887">

				<td><%=st.getString("titre") %></td>
				<td><%=st.getString("lienImage") %></td>
				<td><%=st.getString("description") %></td>
				<td><%=st.getString("nom") %></td>
				<td><%=st.getString("adresse") %></td>
				<td><form action="list" method="POST">
						<input type="submit" value="ajouter dans le panier" name="valide" />
					</form></td>
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