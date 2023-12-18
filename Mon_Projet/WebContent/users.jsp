<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des utilisateurs</title>
    <link  type='text/css' href='css/bootstrap.min.css' rel= 'stylesheet' >
    	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
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
</head>
<body style="background-color:#F5FFFA">
    <div class="navbar navbar-inverse" style="background-color: #191970; color: white; font-family: Georgia, serif">
        <ul class="nav navbar-nav" style="color: white">
           <li > <a href=index.do style="color:white"><i><i class="fa fa-table" aria-hidden="true"></i> Gestion Articles</i></a></li>
		<li ><a href=allcommandes.do style="color:white"><i><i class="fa fa-shopping-bag" aria-hidden="true"></i> Gestion Commandes</i></a></li>
				<li ><a href=allusers.do style="color:white"><i><i class="fa fa-user" aria-hidden="true"></i> Consulter users</i></a></li>
		<li> <a href=cathalogue.do style="color:white"><i><i class="fa fa-list-alt" aria-hidden="true"></i> Catalogue</i></a></li>
		<li> <a href=logout.jsp  style="color:white"><i><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</i></a></li>
        </ul>
    </div><br><br>
    <h2 style="color:#483D8B;font-family:Georgia,serif"><center><b>Liste des utilisateurs</b></center></h2><br><br><br>
    <table>
        <tr style="color:#483D8B;font-family:Georgia,serif">
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de naissance</th>
            <th>Adresse</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr style="color:#483D8B;font-family:Georgia,serif">
                <td>${user.id}</td>
                <td>${user.nom}</td>
                <td>${user.prenom}</td>
                <td>${user.datenaissance}</td>
                <td>${user.adresse}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
