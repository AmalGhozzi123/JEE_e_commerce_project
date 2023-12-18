<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
          color: white;
          border: none;
          padding: 5px 10px;
          border-radius: 3px;
          text-decoration: none;
        }
          


</style>
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
<title>Articles</title>
<link  type='text/css' href='css/bootstrap.min.css' rel= 'stylesheet' >
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
		<p class="text-center" style="color:white;" > Vous etes bien connecté ${sessionScope.names} !</p>
				</c:if>

<p> </p>

<h2 style="color:#483D8B;font-family:Georgia,serif"><center><b>Liste des Articles</b></center></h2><br><br>
<button type="submit"  style="font-family:Georgia,serif;background-color:#4B0082;position:absolute;left:190px;top:150px" ><a href=saisie.do  class="link" style="color:white">Ajouter Nouveau  Article <i class="fa fa-plus-square" aria-hidden="true"></i></a></button>

<div class="container">
<div class="panel panel-primary">
	<div class="panel-heading" style="font-family:Georgia,serif;background-color:#F0F8FF"></div>
		<div class="panel-body" style="background-color:#F5FFFA">
		<form action="chercher.do" method="get">
			<label style="font-family:Georgia,serif">Mot clé</label>
			<input style="font-family:Georgia,serif" type="text" placeholder="Entrer nom article" name="motcle" value="${model.motcle}"/>
			<button type="submit" class="btn btn-primary" style="font-family:Georgia,serif;background-color:#C71585	"> chercher <i class="fa fa-search-plus" aria-hidden="true"></i> </button>
		</form><br>
		
		<table class="table">
			
			<tr style="font-family:Georgia,serif">
			
				<th>ID</th><th>Libelle</th><th>Type</th><th>Prix</th><th colspan="2">Actions</th>
			<c:forEach items="${model.articles}" var="p"> 
				<tr style="font-family:Georgia,serif"> 
					<td>${p.id}</td>
					<td>${p.libelle}</td>
					<td>${p.type}</td>
					<td>${p.prixunit}</td>
					<td><button  id="b" style="background-color:#800000"><a onclick="return confirm('Etes vous sure de supprimer cette article ?')" href="supprime.do?id=${p.id}" class="link" id="b"><u style="font-family:Georgia,serif;color:white" class="link">Supprimer</u></a></button></td>
					<td><button type="submit" id="b" style="background-color:#2E8B57"><a href="edit.do?id=${p.id}" class="link" id="b"><u style="font-family:Georgia,serif;color:white" class="link">Modifier</u></a></button></td>
				</tr>
				</c:forEach>
		</table> 
		</div>
		</div>
</div>
</body> 
</html>