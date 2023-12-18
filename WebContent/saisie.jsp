 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<style>
body {
  background-image: url('file:///Users/cocobird/Downloads/images%20JEE/variety-of-olive-oils-with-copy-space-background.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<head>
<meta http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
<title>Articles</title>
<link  type='text/css' href='css/bootstrap.min.css' rel= 'stylesheet' >

</head>

<body  style="background-color:#F5FFFA">
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
<p> </p>
<div class="container col-md-8 col-md-offset-2 col-xs-12" style="font-family:Georgia,serif">
<div class="panel panel-primary">
	<div class="panel-heading" ><center><b style="font-size:17px">Ajout Nouvel Article</b></center></div>
		<div class="panel-body"  style="background-color:#F5FFFA">
			<form action="saveArticle.do" method="POST">
				
				
				
				<div class="form-group">
				<label class="control-label">Libelle</label> 
				<input type="text" name="libelle"  class="form-control" style="height:40px" />
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Prix unitaire</label> 
				<input type="text" name="prix"  class="form-control" style="height:40px" />
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label">Type</label> 
				<input type="text" name="type" class="form-control" style="height:40px" />
				<span></span>
				</div>
				
				<div class="form-group"><label class="control-label" >URL images</label> 
				<input type="text" name="img" class="form-control" style="height:40px" />
				<span></span>
				</div>
				
				<div>
					<button type="submit" class="btn btn-primary" style="background-color:#CD5C5C;width:950px;height:40px;font-size:18px">Ajouter</button>
				</div>
				
				</form>
				
		</div>
		</div>
</div>
</body> 
</html>