package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.User;

import Modéle.article;
import Modéle.commande;
import Modéle.user;

public class articledaoimpl implements IArticleDao {

	public articledaoimpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public article save(article a) {
		Connection connection=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("INSERT INTO article (libelle,type,prixUnit,image) VALUES (?,?,?,?)");
			ps.setString(1,a.getLibelle());
			ps.setString(2,a.getType());
			ps.setDouble(3,a.getPrixunit());
			ps.setString(4,a.getImage());
			ps.executeUpdate();
			PreparedStatement ps2=connection.prepareStatement("SELECT MAX(idArticle) AS maxid FROM article");
			ResultSet rs=ps2.executeQuery();
			if (rs.next()) {
				a.setId(rs.getLong("maxid"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public List<article> articleparmc(String mc) {
		List<article> articles=new ArrayList<article>();
		Connection connection=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("select * from article where libelle like ?");
			ps.setString(1, mc);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				article a=new article();
				a.setId(rs.getLong("idArticle"));
				a.setLibelle(rs.getString("libelle"));
				a.setType(rs.getString("type"));
				a.setPrixunit(rs.getDouble("prixUnit"));
				a.setImage(rs.getString("image"));
				articles.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}

	@Override
	public article getarticle(int id) {
		article a=null;
		Connection connection=SingletonConnection.getConnection();
		
		
		try {
			PreparedStatement ps=connection.prepareStatement("select * from article where idArticle=?");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
		a = new article();
		a.setId(id);
		a.setLibelle(rs.getString("libelle"));
		a.setType(rs.getString("type"));
		a.setPrixunit(rs.getDouble("prixUnit"));
		a.setImage(rs.getString("image"));
		}
	
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public article update(article a) {
		Connection connection=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement
					("Update article set libelle=?, type=?, prixUnit=?, image=? where idArticle=?");
		ps.setString(1,a.getLibelle());
		ps.setString(2,a.getType());
		ps.setDouble(3,a.getPrixunit());
		ps.setString(4,a.getImage());
		ps.setLong(5,a.getId());
		ps.executeUpdate();
		ps.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public void delete(int id) {
		Connection connection=SingletonConnection.getConnection();
		try {PreparedStatement ps=connection.prepareStatement("Delete from article where idArticle=?");
		ps.setInt(1, id);
		ps.executeUpdate();
	}
		catch(Exception e) {
		e.printStackTrace();
		}
	}

	@Override
	public user login(String login, String pass) {
		Connection connection=SingletonConnection.getConnection();
		user u=new user();
		try {
			PreparedStatement ps=connection.prepareStatement("select * from utilisateur where login=? and motDePasse=? ");
			ps.setString(1,login);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if (rs.next() )  {
				u.setId(rs.getInt("idUser"));
				u.setNom(rs.getString("nomUser"));
				u.setPrenom(rs.getString("prenomUser"));
				u.setDatenaissance(rs.getDate("dateNaissance"));
				u.setLogin(rs.getString("login"));
				u.setMotdepasse(rs.getString("motDePasse"));
				u.setRole(rs.getString("role"));
				u.setAdresse(rs.getString("adresse"));

				return u ;
			}
			else {
				return null;
			}
			
		
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return u ;
	}

	@Override
	public user register(user u) {
		
		Connection connection=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("INSERT INTO utilisateur (nomUser,prenomUser,dateNaissance,login,motDePasse,role,adresse) VALUES (?,?,?,?,?,?,?)");
			ps.setString(1,u.getNom());
			ps.setString(2,u.getPrenom());
			ps.setDate(3,(Date) u.getDatenaissance());
			ps.setString(4,u.getLogin());
			ps.setString(5,u.getMotdepasse());
			ps.setString(6,u.getRole());
			ps.setString(7,u.getAdresse());
			ps.executeUpdate();
			PreparedStatement ps2=connection.prepareStatement("SELECT MAX(idUser) AS maxid FROM utilisateur");
			ResultSet rs=ps2.executeQuery();
			if (rs.next()) {
				u.setId(rs.getInt("maxid"));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());;
		}
		return u;
	}

	@Override
	public List<article> catalogue() {
		List<article> articles=new ArrayList<article>();
		Connection connection=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("select * from article ");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				article a=new article();
				a.setId(rs.getLong("idArticle"));
				a.setLibelle(rs.getString("libelle"));
				a.setType(rs.getString("type"));
				a.setPrixunit(rs.getDouble("prixUnit"));
				a.setImage(rs.getString("image"));
				articles.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
		
	}
	
	@Override
	public commande nouvelle_commande(commande c) {
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("INSERT INTO commande (idUser,totalPrix,dateCommande,etat,modeLivraison,quantite) VALUES (?,?,?,?,?,?)");
	        ps.setInt(1, c.getIdcl());
	        ps.setDouble(2, c.getTotprix());
	        ps.setDate(3, new java.sql.Date(c.getDatecommande().getTime()));  // Conversion de java.util.Date en java.sql.Date
	        ps.setString(4, c.getEtat());
	        ps.setString(5, c.getModeliv());
	        ps.executeUpdate();
	        PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(idCommande) AS maxid FROM commande");
	        ResultSet rs = ps2.executeQuery();
	        if (rs.next()) {
	            c.setIdc(rs.getInt("maxid"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return c;
	}

	@Override
	public void modifier_etat(int idc, String etat) {
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("UPDATE commande SET etat=? WHERE idCommande=?");
	        ps.setString(1, etat);
	        ps.setInt(2, idc);
	        ps.executeUpdate();
	        ps.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public void delete_commande(int idc) {
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("DELETE FROM commande WHERE idCommande=?");
	        ps.setInt(1, idc);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public List<commande> commandeuser(int iduser) {
	    List<commande> commandes = new ArrayList<commande>();
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("SELECT * FROM commande WHERE idUser=?");
	        ps.setInt(1, iduser);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            commande c = new commande();
	            c.setIdc(rs.getInt("idCommande"));
	            c.setIdcl(rs.getInt("idUser"));
	            c.setTotprix(rs.getDouble("totalPrix"));
	            c.setDatecommande(rs.getDate("dateCommande"));
	            c.setEtat(rs.getString("etat"));
	            c.setModeliv(rs.getString("modeLivraison"));
	            c.setQuantite(rs.getInt("quantite"));

	            commandes.add(c);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return commandes;
	}

	@Override
	public commande getcommande(int id) {
	    Connection connection = SingletonConnection.getConnection();
	    commande c = null;
	    try {
	        PreparedStatement ps = connection.prepareStatement("SELECT c.totalPrix, c.dateCommande, c.etat, c.modeLivraison, c.quantite, a.libelle, a.type, a.prixUnit, a.image, u.nomUser, u.prenomUser " +
	                                                           "FROM commande c " +
	                                                           "INNER JOIN article a ON c.idArticle = a.idArticle " +
	                                                           "INNER JOIN utilisateur u ON c.idUser = u.idUser " +
	                                                           "WHERE c.idArticle = ?");  
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            c = new commande();
	            c.setTotprix(rs.getDouble("totalPrix"));
	            c.setDatecommande(rs.getDate("dateCommande"));
	            c.setEtat(rs.getString("etat"));
	            c.setModeliv(rs.getString("modeLivraison"));
	            c.setQuantite(rs.getInt("quantite"));
	            
	            article a = new article();
	            a.setLibelle(rs.getString("libelle"));
	            a.setType(rs.getString("type"));
	            a.setPrixunit(rs.getDouble("prixUnit"));
	            a.setImage(rs.getString("image"));
	            
	            c.setArticle(a);
	            
	            user u = new user();
	            u.setNom(rs.getString("nomUser"));
	            u.setPrenom(rs.getString("prenomUser"));
	            
	            c.setUser(u);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return c;
	}

	

	@Override
	public List<user> getAllUsers() {
	    List<user> users = new ArrayList<>();
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("SELECT * FROM utilisateur");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            int id = rs.getInt("idUser");
	            String nom = rs.getString("nomUser");
	            String prenom = rs.getString("prenomUser");
	            Date datenaissance = rs.getDate("dateNaissance");
	            String login = rs.getString("login");
	            String motdepasse = rs.getString("motDePasse");
	            String role = rs.getString("role");
	            String adresse = rs.getString("adresse");

	            // Créer une instance de user avec les valeurs récupérées
	            user u = new user(nom, prenom, datenaissance, login, motdepasse, role, adresse);
	            u.setId(id);
	            
	            // Ajouter l'utilisateur à la liste
	            users.add(u);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return users;
	}

	@Override
	public List<commande> getAllCommandes() {
	    List<commande> commandes = new ArrayList<>();
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("SELECT * FROM commande");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            commande c = new commande();
	            c.setIdc(rs.getInt("idCommande"));
	            c.setIdcl(rs.getInt("idUser"));
	            c.setTotprix(rs.getDouble("totalPrix"));
	            c.setDatecommande(rs.getDate("dateCommande"));
	            c.setEtat(rs.getString("etat"));
	            c.setModeliv(rs.getString("modeLivraison"));
	            c.setQuantite(rs.getInt("quantite"));

	            commandes.add(c);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return commandes;
	}


	
	
	

}