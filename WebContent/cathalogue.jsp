<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.panel {
  width: 300px;
  margin: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: white;
  padding: 10px;
  text-align: center;
}

.panel-heading {
  background-color: #191970	;
  color: white;
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 5px 5px 0 0;
}

.panel-body {
  padding: 10px;
  background-color:#F08080		;
}

.table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  padding: 8px;
  text-align: left;
}

th {
  background-color: #483D8B;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

img {
  width: 100%;
  height: auto;
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
<link type='text/css' href='css/bootstrap.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="font-family:Georgia,serif;background-color:#F5FFFA">
<c:choose>
  <c:when test="${sessionScope.roles == 'admin' || sessionScope.roles == 'user'}">
    <%@ include file="headeruser.jsp" %>
  </c:when>
  <c:otherwise>
    <%@ include file="header.jsp" %>
  </c:otherwise>
</c:choose>

<c:if test="${!empty sessionScope.roles}">
  <p class="text-center" style="color:white;">Vous êtes bien connecté ${sessionScope.names}!</p>
</c:if>
<p> </p>
<div class="container" style="font-family:Georgia,serif">
  <c:forEach items="${model.articles}" var="p"> 
    <div class="panel">
      <div class="panel-heading">${p.libelle}</div>
      <div class="panel-body">
        <img src="${p.image}" alt="image">
        <b><i><p>Type: ${p.type}</p></i></b>
        <b><i><p>Prix: ${p.prixunit} DT</p></i></b>
        <button  type="submit" id="b" style="background-color:#2E8B57"><a href="commande.do?id=${p.id}"><u style="font-family:Georgia,serif;color:white" class="link">Commander <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        </u></a></button>
      </div>
    </div>
  </c:forEach>
</div>
</body>
</html>
