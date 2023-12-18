package web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IArticleDao;
import dao.articledaoimpl;
import Modéle.article;
import Modéle.commande;
import Modéle.user;





public class ControleurServlet extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private IArticleDao metier;
  	
@Override
	public void init() throws ServletException {
		metier=new articledaoimpl();
	} 

@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String path=request.getServletPath();
	if(path.equals("/index.do")) {
		request.getRequestDispatcher("article.jsp").forward(request, response);
	}
	else if(path.equals("/chercher.do")){
		String motcle=request.getParameter("motcle");
		articlemodele model=new articlemodele();
		model.setMotcle(motcle);
		List<article> articles=metier.articleparmc("%"+motcle+"%");
		model.setArticles(articles);
		request.setAttribute("model", model);
		request.getRequestDispatcher("article.jsp").forward(request, response);
	
	}else if(path.equals("/saisie.do")){
		request.getRequestDispatcher("saisie.jsp").forward(request, response);
	}
	else if(path.equals("/saveArticle.do")&&(request.getMethod().equals("POST"))) {
		String lib=request.getParameter("libelle");
		String type=request.getParameter("type");
		double prix=Double.parseDouble(request.getParameter("prix"));
		String image=request.getParameter("img");
		article a= metier.save(new article(lib,prix,type,image)); ;
		
		request.setAttribute("article", a);
		request.getRequestDispatcher("confirmationarticle.jsp").forward(request, response);
		
		
	}else if(path.equals("/login.do")){
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	else if(path.equals("/sublogin.do")){
		String login=request.getParameter("loginR");
		String password=request.getParameter("passR");
		user u=metier.login(login, password);
		
		
		
		if(u.getId()==-1){
			request.getRequestDispatcher("login.jsp");
		}
		
		
		else if(u!=null && u.getRole().equals("admin")) {
			HttpSession session=request.getSession();
			String roles=u.getRole();
			String names=u.getNom();
			String cid=String.valueOf(u.getId());
			Cookie c=new Cookie("userid",cid);
			session.setAttribute("roles", roles);
			session.setAttribute("names", names);
			response.addCookie(c);
			response.sendRedirect("article.jsp");
			
			
			
		}
		else if(u!=null && u.getRole().equals("user")) {
			HttpSession session=request.getSession();
			String roles=u.getRole();	
			String names=u.getNom();
			String cid=String.valueOf(u.getId());
			Cookie c=new Cookie("userid",cid);
			session.setAttribute("roles",roles);
			session.setAttribute("names", names);
			response.addCookie(c);
			response.sendRedirect("cathalogue.do");
			

			
			
		}else if(path.equals("/logout.do")){
			response.sendRedirect("logout.jsp");
		}
		
		
	}else if(path.equals("/vregister.do")){
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}
	else if (path.equals("/confirmationReg.do") && (request.getMethod().equals("POST"))) {
	    String nom = request.getParameter("nom");
	    String prenom = request.getParameter("prenom");
	    String datenaissanceString = request.getParameter("naissance");
	    String login = request.getParameter("login");
	    String motdepasse = request.getParameter("pass");
	    String role = "user";
	    String adresse = request.getParameter("adresse");

	    Date datenaissance = Date.valueOf(datenaissanceString);

	    user u = metier.register(new user(nom, prenom, datenaissance, login, motdepasse, role, adresse));
	    request.setAttribute("user", u);
	    request.getRequestDispatcher("confirmationReg.jsp").forward(request, response);
	}
	else  if(path.equals("/cathalogue.do")){
		
		articlemodele model=new articlemodele();
		List<article> articles=metier.catalogue();
		model.setArticles(articles);
		request.setAttribute("model", model);
		request.getRequestDispatcher("cathalogue.jsp").forward(request, response);
	
	}else if(path.equals("/supprime.do")){
		int id=Integer.parseInt(request.getParameter("id"));
		metier.delete(id);
		response.sendRedirect("article.jsp?motcle=");

	}else if(path.equals("/edit.do")){
		int id=Integer.parseInt(request.getParameter("id"));
		article a=metier.getarticle(id);
		request.setAttribute("article", a);
		request.getRequestDispatcher("editproduit.jsp").forward(request,response);
	}
	else if(path.equals("/updatearticle.do")&&(request.getMethod().equals("POST"))) {
		int id=Integer.parseInt(request.getParameter("id"));
		String lib=request.getParameter("libelle");
		String type=request.getParameter("type");
		double prix=Double.parseDouble(request.getParameter("prix"));
		String image=request.getParameter("img");
		article a= new article(lib,prix,type,image);
		a.setId(id);
		metier.update(a);
		request.setAttribute("article", a);
		request.getRequestDispatcher("confirmationarticle.jsp").forward(request, response);

		
		
	}else if (path.equals("/commande.do")) {
	    int ida = Integer.parseInt(request.getParameter("id"));
	    article a = metier.getarticle(ida);
	    request.setAttribute("prix", a.getPrixunit());
	    request.getRequestDispatcher("commander.jsp").forward(request, response);
	}
	else if (path.equals("/commandeconf.do") && request.getMethod().equals("POST")) {
	    Cookie[] cookies = request.getCookies();
	    int idc = 0;
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("userid")) {
	                idc = Integer.parseInt(cookie.getValue());
	                break;
	            }
	        }
	    }
	    int quantite = Integer.parseInt(request.getParameter("quantite")); 

	    double prix = Double.parseDouble(request.getParameter("prix"));
	    double prixtot = prix * quantite;
	    String modeliv = request.getParameter("modeliv");
	    String date = request.getParameter("date");

	    Date dateCommande = Date.valueOf(date);

	    commande c = metier.nouvelle_commande(new commande(idc, prixtot, dateCommande, "en attente", modeliv, quantite)); 

	    
	    String message = "La commande a été traitée avec succès. Merci !";
	    request.setAttribute("message", message);
	    response.sendRedirect("mescommandes.do");
	}

	else if (path.equals("/mescommandes.do")) {
	    Cookie ck[] = request.getCookies();
	    int idc = Integer.parseInt(ck[0].getValue());
	    
	    // Retrieve the list of commands for the user
	    List<commande> commandes = metier.commandeuser(idc);
	    
	    // Set the list of commands as a request attribute
	    request.setAttribute("commandes", commandes);
	    
	    request.getRequestDispatcher("mescommandes.jsp").forward(request, response);
	}else if (path.equals("/allusers.do")) {
	    List<user> users = metier.getAllUsers();
	    request.setAttribute("users", users);
	    request.getRequestDispatcher("users.jsp").forward(request, response);
	}
	else if (path.equals("/allcommandes.do")) {
	    List<commande> commandes = metier.getAllCommandes();
	    request.setAttribute("commandes", commandes);
	    request.getRequestDispatcher("commandes.jsp").forward(request, response);
	}


	else if(path.equals("/supprimecommande.do")){
		int id=Integer.parseInt(request.getParameter("idc"));
		metier.delete_commande(id);
		response.sendRedirect("mescommandes.jsp");}
	else if (path.equals("/modifieretat.do")) {
	    int id = Integer.parseInt(request.getParameter("commandeId"));
	    String nouvelEtat = request.getParameter("nouvelEtat");
	    
	    // Appel à la méthode de modification d'état dans votre couche de métier
	    metier.modifier_etat(id, nouvelEtat);
	    
	    // Redirection vers la page commandes.jsp
	    response.sendRedirect("commandes.jsp");
	}

	
	else if(path.equals("/updatecommande.do")&&(request.getMethod().equals("POST"))) {
		int id=Integer.parseInt(request.getParameter("id"));
		String lib=request.getParameter("libelle");
		String type=request.getParameter("type");
		double prix=Double.parseDouble(request.getParameter("prix"));
		String image=request.getParameter("image");
		article a= new article(lib,prix,type,image);
		a.setId(id);
		metier.update(a);

		request.setAttribute("article", a);
		request.getRequestDispatcher("confirmationarticle.jsp").forward(request, response);

	}
	

	else {
		response.sendError(HttpServletResponse.SC_NOT_FOUND);
	
}
	
		}
		
	
	@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
			
			
		}
}
