<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des commandes</title>
    <link  type='text/css' href='css/bootstrap.min.css' rel= 'stylesheet' >
        	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
<body style="background-color:#F5FFFA">
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
<div class="navbar navbar-inverse" style="background-color: #191970; color: white; font-family: Georgia, serif">
    <ul class="nav navbar-nav" style="color: white">
    <li > <a href=index.do style="color:white"><i><i class="fa fa-table" aria-hidden="true"></i> Gestion Articles</i></a></li>
		<li ><a href=allcommandes.do style="color:white"><i><i class="fa fa-shopping-bag" aria-hidden="true"></i> Gestion Commandes</i></a></li>
				<li ><a href=allusers.do style="color:white"><i><i class="fa fa-user" aria-hidden="true"></i> Consulter users</i></a></li>
		<li> <a href=cathalogue.do style="color:white"><i><i class="fa fa-list-alt" aria-hidden="true"></i> Catalogue</i></a></li>
		<li> <a href=logout.jsp  style="color:white"><i><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</i></a></li>
    </ul>
</div><br><br>
<h2 style="color:#483D8B;font-family:Georgia,serif"><center><b>Liste des commandes</b></center></h2><br><br><br>

<!-- Ajoutez le code JavaScript jQuery avant le code HTML -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Le reste du code HTML reste le même -->

<table style="font-family:Georgia,serif">
    <tr>
        <th>ID</th>
        <th>ID Utilisateur</th>
        <th>Total Prix</th>
        <th>Date de commande</th>
        <th>État</th>
        <th>Mode de livraison</th>
        <th>Quantité</th>
        <th>Action</th> <!-- Nouvelle colonne pour le bouton d'action -->
    </tr>
    <c:forEach var="commande" items="${commandes}">
        <tr>
            <td>${commande.idc}</td>
            <td>${commande.idcl}</td>
            <td>${commande.totprix}</td>
            <td>${commande.datecommande}</td>
            <td id="etat-${commande.idc}">${commande.etat}</td>
            <td>${commande.modeliv}</td>
            <td>${commande.quantite}</td>
            <td>
                <button type="button" class="button" onclick="modifieretat(${commande.idc}, '${commande.etat}')">Modifier État</button>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
function modifieretat(commandeId, etatActuel) {
    var nouvelEtat = etatActuel === 'En attente' ? 'Confirmée' : 'Confirmée';

    // Demander confirmation à l'utilisateur
    var confirmation = confirm("Êtes-vous sûr de vouloir modifier l'état de cette commande ?");

    if (confirmation) {
        // Effectuer la modification de l'état localement
        document.getElementById('etat-' + commandeId).innerText = nouvelEtat;

        // Envoyer une requête AJAX pour mettre à jour l'état côté serveur
        $.ajax({
            url: 'modifieretat.do',
            type: 'POST',
            data: { commandeId: commandeId, nouvelEtat: nouvelEtat },
            success: function(response) {
                // Traitement en cas de succès de la requête
                console.log('État de la commande mis à jour avec succès.');
            },
            error: function(xhr, status, error) {
                // Traitement en cas d'erreur de la requête
                console.log('Erreur lors de la mise à jour de l\'état de la commande:', error);
            }
        });
    }
}

</script>



</body>
</html>
