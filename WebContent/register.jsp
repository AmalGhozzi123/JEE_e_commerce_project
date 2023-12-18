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
</style>
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
<title>Articles</title>
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
		<p class="text-center" style="color:white;"> Vous etes bien connecté ${sessionScope.names} !</p>
				</c:if>
<p> </p><br><bR>
<div class="container col-md-8 col-md-offset-2 col-xs-12" style="font-family:Georgia,serif">
<div class="panel panel-primary">
	<div class="panel-heading" ><center><b style="font-family:Georgia,serif;font-size:18px">Création d'un compte</b></center></div>
		<div class="panel-body" style="background-color:#F5FFFA">
			<form action="confirmationReg.do" method="POST">
				
				
				
				
				<div class="form-group"><label class="control-label">Prenom</label> 
				<input type="text" name="prenom" class="form-control"/>
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Nom</label> 
				<input type="text" name="nom" class="form-control"/>
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Date de Naissance</label> 
				<input type="date" name="naissance" class="form-control"/>
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Adresse</label> 
				<input type="text" name="adresse" class="form-control"/>
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Login</label> 
				<input type="text" name="login" class="form-control"/>
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Mot de passe</label> 
				<input type="password" name="pass" class="form-control"/>
				<span></span>
				</div>
				<br>
				<div>
					<button type="submit" class="btn btn-primary" style="background-color:#F08080;width:950px;height:40px;font-size:18px">Créer</button>
				</div>
				
				</form>
				
		</div>
		</div>
</div>
</body> 
</html>