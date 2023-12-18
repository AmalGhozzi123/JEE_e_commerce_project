<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-image: url('file:///Users/cocobird/Downloads/images%20JEE/variety-of-olive-oils-with-copy-space-background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            font-family: Georgia, serif;
        }

        .panel-heading {
            background-color: #337ab7;
            color: white;
            padding: 10px;
        }

        .panel-body {
            padding: 20px;
        }

        .table {
            margin-bottom: 0;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #337ab7;
            border-color: #337ab7;
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background-color: #286090;
            border-color: #286090;
        }

        .text-center {
            text-align: center;
        }
    </style>
    <meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
    <title>Articles</title>
    <link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="font-family:Georgia,serif;background-color:#F5FFFA">
    <c:if test="${!empty sessionScope.roles}">
        <c:choose>
            <c:when test="${sessionScope.roles eq 'admin'}">
                <%@ include file="header.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="headeruser.jsp" %>
            </c:otherwise>
        </c:choose>
        <p class="text-center"><!--  Vous êtes bien connecté ${sessionScope.roles} !--></p>
    </c:if>
    <br><br>
    <p></p>
    <br><bR><br>	
    <br><div class="container" style="width:700px;position:absolute;top:130px;left:430px">
        	<h2 style="color:#483D8B;font-family:Georgia,serif"><center><b>Information sur Votre commande</b></center></h2><br><br>
    
        <div class="panel panel-primary">
            <div class="panel-heading">
                <center><b style="font-size:17px"><i></i></b></center>
            </div>
            <div class="panel-body" style="background-color:#F5FFFA">
                <form action="commandeconf.do" method="post">
                    <table class="table">
                        <tr>
                            <th style="color:#778899">Prix:</th>
                            <td>
						<input type="number"  name="prix" value="${prix}">

                            </td>
                        </tr>
                        <tr>
                            <th style="color:#778899">Quantité:</th>
                            <td>
                                <select name="quantite" size="1">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th style="color:#778899">Mode livraison:</th>
                            <td>
                                <select name="modeliv" size="1">
                                    <option>Sur place</option>
                                    <option>A domicile</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="date" style="color:#778899">Date de commande:</label>
                            </td>
                            <td>
                                <input type="date" name="date" value="2021-07-22">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Confirmer" class="btn btn-primary"
                                    style="background-color:#2E8B57;width:180px;height:30px;font-size:12px">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
