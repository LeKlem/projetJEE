<%@page import="com.lacgaa.tdsi.ajout"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lacgaa.tdsi.connectionBaseDeDonnees" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>	
<head>
<title>Panneau d'administration</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<style>

.list-group{
    max-height: 300px;
    height : 200px;
    margin-bottom: 10px;
    overflow:scroll;
    -webkit-overflow-scrolling: touch;
}
.
</style>
</head>
<body>

	<%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            if(session.getAttribute("login")==null){
                response.sendRedirect("index.html");
           }else{
        	   System.out.println("Valeur de Id : " + request.getParameter("id")); 
        	   if(request.getParameter("id") != null){
        		   ajout.validerPanier(request.getParameter("id"));
        	   }
           }
        %>
	<div class="div2">
          <!--  <form action="deconnexion" method="POST">
                <button class="b2 btn btn-success" type="submit" > Se déconnecter </button> 
           </form>
          -->
                <a href="deconnexion" id="b2" class="btn btn-info"
			role="button">Déconnexion</a>
           
        </div>

<div class="container">
<h4 style= "color :#337ab7"'>Nombre de paniers achetés : 
<%
try{ 
Connection conn = connectionBaseDeDonnees.connexionBase();
Statement stmt = conn.createStatement();
String sqll ="SELECT COUNT(*) as nb FROM `panier` WHERE idAcheteur != 0 ;";
ResultSet rs= stmt.executeQuery(sqll);
while(rs.next()){
%>
<%=rs.getInt("nb") %></h4>
<%
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
</h2>
</div>
<div class="panel panel-primary container" style="margin-top : 2%" id="result_panel">
    <div class="panel-heading"><h2 class="panel-title">Derniers paniers achetés :</h3>
    </div>
    <div class="panel-body">
        <ul class="list-group ">
<%
try{ 
Connection con = connectionBaseDeDonnees.connexionBase();
Statement statement = con.createStatement();
String sql ="SELECT * FROM panier  WHERE idAcheteur != 0; ";
ResultSet st= statement.executeQuery(sql);
while(st.next()){
%>


 <li class="list-group-item">
 <strong><%=st.getString("titre") %>
<%=st.getString("lienImage") %>
<%=st.getString("description") %></strong>
    </li>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

		 </ul>
    </div>
    
</div>
        <!--  ----------------------- -->   
        <div class="container">
<h4 style= "color :#337ab7"'>Nombre de paniers en vente : 
<%
try{ 
Connection conn = connectionBaseDeDonnees.connexionBase();
Statement stmt = conn.createStatement();
String sqll ="SELECT COUNT(*) as nb FROM `panier` WHERE idAcheteur = 0 AND validated = 1;";
ResultSet rs= stmt.executeQuery(sqll);
while(rs.next()){
%>
<%=rs.getInt("nb") %></h4>
<%
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
</h2>
</div>
<div class="panel panel-primary container" style="margin-top : 2%" id="result_panel">
    <div class="panel-heading"><h2 class="panel-title">Derniers paniers en vente : </h3>
    </div>
    <div class="panel-body">
        <ul class="list-group ">
<%
try{ 
Connection con = connectionBaseDeDonnees.connexionBase();
Statement statement = con.createStatement();
String sql ="SELECT * FROM panier  WHERE idAcheteur = 0 and validated = 1 ";
ResultSet st= statement.executeQuery(sql);
while(st.next()){
%>


 <li class="list-group-item">
 <strong>
<%=st.getString("titre") %> - 
<%=st.getString("description") %></strong>
    </li>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

		 </ul>
    </div>
    
</div>
<!-- ------------------------ -->
 <div class="container">
<h4 style= "color :#337ab7"'>Nombre de paniers à valider : <%
try{ 
Connection conn = connectionBaseDeDonnees.connexionBase();
Statement stmt = conn.createStatement();
String sqll ="SELECT COUNT(*) as nb FROM `panier` WHERE idAcheteur = 0 AND validated = 0;";
ResultSet rs2= stmt.executeQuery(sqll);
while(rs2.next()){
%>
<%=rs2.getInt("nb") %></h4>
<%
}
}
catch (Exception e) {
e.printStackTrace();
}
%>
</h2>
</div>
<div class="panel panel-primary container" style="margin-top : 2%" id="result_panel">
    <div class="panel-heading"><h2 class="panel-title">Paniers à valider : </h3>
    </div>
    <div class="panel-body">
        <ul class="list-group ">
<%
try{ 
Connection con = connectionBaseDeDonnees.connexionBase();
Statement statement = con.createStatement();
String sqlll ="SELECT * FROM `panier` WHERE idAcheteur = 0 AND validated = 0;";
ResultSet st= statement.executeQuery(sqlll);
while(st.next()){
%>


 <li class="list-group-item">
 <strong>
<%=st.getString("titre") %> - 
<%=st.getString("description") %></strong>
<a href="admin.jsp?id=<%=st.getInt("idPanier") %>">valider</a>
    </li>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

		 </ul>
    </div>
    
</div>
    </body>
</html>
	
