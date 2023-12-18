<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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
  margin-top: 120px;
}

.panel {
  max-width: 500px;
  margin: 0 auto;
  background-color: #f5f5f5;
  border: 1px solid #ddd;
  border-radius: 10px;
}

.panel-heading {
  background-color: #337ab7;
  color: #fff;
  padding: 15px;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

.panel-body {
  padding: 20px;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  font-weight: bold;
}

.form-control {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#b {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#b:hover {
  background-color: #3CB371;
}

.text-center {
  text-align: center;
  color: #fff;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
<title>Articles</title>
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="font-family:Georgia,serif;background-color:#F5FFFA">

<c:if test="${empty sessionScope.roles}">
  <%@ include file="headeruser.jsp" %>
  <% 
  if("admin".equals(session.getAttribute("roles"))) {
    %> 
    <%@ include file="headeruser.jsp" %>
  <% 	} %> 
</c:if>

<c:if test="${!empty sessionScope.roles}">
  <% 
  if("admin".equals(session.getAttribute("roles"))) {
    %> 
    <%@ include file="header.jsp" %>
  <% 	} %> 
  <p class="text-center">Vous êtes bien connecté ${sessionScope.names} !</p>
</c:if>

<p> </p>

<div class="container" style="font-family:Georgia,serif" >
  <div class="panel panel-primary" >
    <div class="panel-heading"><b style="color:white">Connexion</b></div>
    <div class="panel-body" style="font-family:Georgia,serif;background-color:#F5FFFA">
      <form action="sublogin.do" method="POST">
        <div class="form-group">
          <label class="control-label">Login</label>
          <input type="text" name="loginR" placeholder="Entrer Votre Login" class="form-control" style="height:40px"/>
          <span></span>
        </div>
        <div class="form-group">
          <label class="control-label">Mot de passe</label>
          <input type="password" name="passR" class="form-control" placeholder="Entrer Votre Mot de Passe" style="height:40px"/>
          <span></span>
        </div>
        <div>
          <button type="submit" id="b" class="btn btn-primary" style="color:white;background-color:#191970" >Se connecter</button>
        </div>
      </form>
    </div>
  </div>
</div>

</body> 
</html>
