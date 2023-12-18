package Modéle;

import java.io.Serializable;
import java.sql.Date;

public class commande implements Serializable {
    private int idc;
    private int idcl;
    private article article;
    private double totprix;
    private Date datecommande;
    private String etat;
    private String modeliv;
    private int quantite;
    private user user;


    public commande(int idcl, double totprix, Date datecommande, String etat, String modeliv, int quantite) {
        super();
        this.idcl = idcl;
        this.totprix = totprix;
        this.datecommande = datecommande;
        this.etat = etat;
        this.modeliv = modeliv;
        this.quantite = quantite;
    }
    public user getUser() {
        return user;
    }

    public void setUser(user user) {
        this.user = user;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public article getArticle() {
        return article;
    }

    public void setArticle(article article) {
        this.article = article;
    }

    @Override
    public String toString() {
        return "commande [idc=" + idc + ", idcl=" + idcl + ", article=" + article + ", totprix=" + totprix + ", datecommande=" + datecommande
                + ", etat=" + etat + ", modeliv=" + modeliv + ", quantite=" + quantite + "]";
    }

    public int getIdc() {
        return idc;
    }

    public void setIdc(int idc) {
        this.idc = idc;
    }

    public int getIdcl() {
        return idcl;
    }

    public void setIdcl(int idcl) {
        this.idcl = idcl;
    }

    public double getTotprix() {
        return totprix;
    }

    public void setTotprix(double totprix) {
        this.totprix = totprix;
    }

    public Date getDatecommande() {
        return datecommande;
    }

    public void setDatecommande(Date datecommande) {
        this.datecommande = datecommande;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getModeliv() {
        return modeliv;
    }

    public void setModeliv(String modeliv) {
        this.modeliv = modeliv;
    }

    public commande() {
        // TODO Auto-generated constructor stub
    }
}
