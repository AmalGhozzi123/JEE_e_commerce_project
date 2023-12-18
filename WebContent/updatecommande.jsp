<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Commande</title>
</head>
<body>
    <h1>Update Commande</h1>

    <form action="updatecommande" method="POST">
        <label for="commandeId">Commande ID:</label>
        <input type="text" name="commandeId" id="commandeId">
        <br><br>
        <label for="etat">New Status:</label>
        <input type="text" name="etat" id="etat">
        <br><br>
        <input type="submit" value="Update Commande">
    </form>

    <h2>All Commands</h2>
    <table>
        <tr>
            <th>Commande ID</th>
            <th>User ID</th>
            <th>Total Price</th>
            <th>Date Commande</th>
            <th>Status</th>
            <th>Delivery Mode</th>
        </tr>
        <c:forEach var="commande" items="${commandes}">
            <tr>
                <td>${commande.idc}</td>
                <td>${commande.idcl}</td>
                <td>${commande.totprix}</td>
                <td>${commande.datecommande}</td>
                <td>${commande.etat}</td>
                <td>${commande.modeliv}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
