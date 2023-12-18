<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-image: url('file:///Users/cocobird/Downloads/images%20JEE/variety-of-olive-oils-with-copy-space-background.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
        table {
          border-collapse: collapse;
          width: 100%;
        }

        th, td {
          text-align: left;
          padding: 8px;
        }

        th {
          background-color: #483D8B;
          color: white;
        }

        tr:nth-child(even) {
          background-color: #f2f2f2;
        }

        tr:hover {
          background-color: #c9e2ff;
        }

        .button {
          background-color: #dc3545;
          border: none;
          color: white;
          padding: 6px 12px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 14px;
          margin: 4px 2px;
          cursor: pointer;
        }

        .button:hover {
          background-color: #c82333;
        }

        .link {
          color: #007bff;
          text-decoration: none;
        }

        .link:hover {
          text-decoration: underline;
        }

        button[type="submit"] {
          background-color: #dc3545; /* rouge */
          color: white;
          border: none;
          padding: 5px 10px;
          border-radius: 3px;
        }

        #b {
          background-color: #28a745; /* vert */
          color: white;
          border: none;
          padding: 5px 10px;
          border-radius: 3px;
          text-decoration: none;
        }
          
</style>
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
<title>Ma commande</title>
<link  type='text/css' href='css/bootstrap.min.css' rel= 'stylesheet' >

</head>
<body style="background-color:#F5FFFA">
<c:if test="${!empty sessionScope.roles}">
			<% 
			if("admin".equals(session.getAttribute("roles"))) {
				%> 
				<%@ include file="header.jsp" %>
	<% 	}else{
		%>	
		<%@ include file="headeruser.jsp" %>
		
		<% }
			%>
		<br><br><p class="text-center"> <!--  Vous etes bien connecté ${sessionScope.names} !--></p>
				</c:if>
<p> </p>
<h3><center><b style="color:#483D8B;font-family:Georgia,serif">Mes Commandes</b></center></h3><br>
<div class="container" style="font-family:Georgia,serif">

		<div class="panel-body" style="background-color:#F5FFFA">
		
		<table class="table">
			<tr>
			<th>Quantité Commandé</th>
			<th>Prix</th>
			<th>Date Commande</th>
			<th>Etat de commande</th>
			<th>Mode de Livraison</th>
			<th>Action</th>
			</tr>
			<c:forEach items="${commandes}" var="commande"> 
    <tr> 
        <td>${commande.quantite}</td>
        <td>${commande.totprix}</td>
        <td>${commande.datecommande}</td>
        <td>${commande.etat}</td>
        <td>${commande.modeliv}</td>
       <!-- <td>${commande.article.libelle}</td> 
        <td>${commande.article.type}</td> 
        <td>${commande.article.prixunit}</td> 
        <td>${commande.article.image}</td>
        <td>${commande.user.nomUser}</td>
        <td>${commande.user.prenomUser}</td>  -->
    
        <td><button id="b" style="background-color:#800000"><a href="supprimecommande.do?idc=${commande.idc}"><u style="font-family:Georgia,serif;color:white" class="link">Supprimer</u></a></button></td>
    </tr>
</c:forEach>
			
		</table> 
		
</div>
</body> 
</html>