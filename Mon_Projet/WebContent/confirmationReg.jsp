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
</style>
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
<title>Articles</title>
<link type='text/css' href='css/bootstrap.min.css' rel='stylesheet'>
</head>
<body style="font-family:Georgia,serif;background-color:#F5FFFA">
<br><br><br>
<c:if test="${!empty sessionScope.roles}">
  <% 
  if("admin".equals(session.getAttribute("roles"))) {
    %> 
    <%@ include file="header.jsp" %>
  <% } else { %>
    <%@ include file="headeruser.jsp" %>
  <% } %>
  <p class="text-center" style="color:white;">Vous êtes bien connecté ${sessionScope.names}!</p>
</c:if>

<p></p>
<h3 style="font-family:Georgia,serif;color:#5F9EA0"><i><center><b>Votre compte à éte créer avec succés</b></center></i></h3><br>
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-heading"><center><b style="font-size:16px">Confirmation</b></center></div>
    <div class="panel-body" style="background-color:#F5FFFA">
      <form action="login.jsp" style="text-align:center">
        <div class="form-group">
          <label></label>
          <input type="hidden" name="id" value="${user.id}">
        </div>
        <div class="form-group">
          <label>Nom:</label>
          <label>${user.nom}</label>
        </div><br>
        <div class="form-group">
          <label>Prénom:</label>
          <label>${user.prenom}</label>
        </div><br>
        <div class="form-group">
          <label>Date de naissance:</label>
          <label>${user.datenaissance}</label>
        </div><br>
        <div class="form-group">
          <button type="submit" class="btn btn-primary" style="background-color:#CD5C5C;width:950px;height:40px;font-size:18px">Se connecter</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
