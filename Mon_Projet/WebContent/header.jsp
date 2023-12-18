 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
	<html><head>
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	</head>
	<div class="navbar navbar-inverse" style="background-color: #191970	;color:white ;font-family: Georgia, serif">
		<ul class="nav navbar-nav" style="color:white">
	 	<c:if test="${!empty sessionScope.roles}">
		<li > <a href=index.do style="color:white"><i><i class="fa fa-table" aria-hidden="true"></i> Gestion Articles</i></a></li>
		<li ><a href=allcommandes.do style="color:white"><i><i class="fa fa-shopping-bag" aria-hidden="true"></i> Gestion Commandes</i></a></li>
				<li ><a href=allusers.do style="color:white"><i><i class="fa fa-user" aria-hidden="true"></i> Consulter users</i></a></li>
		<li> <a href=cathalogue.do style="color:white"><i><i class="fa fa-list-alt" aria-hidden="true"></i> Catalogue</i></a></li>
		<li> <a href=logout.jsp  style="color:white"><i><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</i></a></li>
		
		</c:if>
		<c:if test="${empty sessionScope.roles}">
		<li> <a href=cathalogue.do style="color:white"><i>Catalogue</i></a></li>
		<li> <a href=login.do style="color:white"><i>Login</i></a></li>
		<li> <a href=vregister.do  style="color:white"><i><i class="fa fa-user-plus" aria-hidden="true"></i> Créer compte</i></a></li>
		</c:if> 
	
		</ul>
	</div></html>