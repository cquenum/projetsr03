/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.model;
import java.time.LocalDate;
import java.text.SimpleDateFormat;

/**
 *
 * @author cquenum
 */
public class Utilisateur {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String pwd;
    private boolean statut;
    private String telephone;
    private LocalDate dateCreation;
    private String role;
    
    public Utilisateur(){
        
    }
    
    public Utilisateur(String nom, String prenom, String email, 
            String pwd, String role){
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.pwd = pwd;
        this.role = role;
    }
    
    public String getNom(){
        return this.nom;
    }
    
    public void setNom(String nom){
        this.nom = nom;
    }
    
    public String getPrenom(){
        return this.prenom;
    }
    
    public void setPrenom(String prenom){
        this.prenom = prenom;
    }
    
    public String getEmail(){
        return this.email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getPwd(){
        return this.pwd;
    }
    
    public void setPwd(String pwd){
        this.pwd = pwd;
    }
    
    public void setStatut(boolean statut){
        this.statut = statut;
    }
    
    public boolean getStatut(){
        return this.statut;
    }
    
    public LocalDate getDateCreation(){
        return this.dateCreation;
    }
    
    public void setDateCreation(LocalDate dateCreation){
        this.dateCreation = dateCreation;
    }
    
    public String getTelephone(){
        return this.telephone;
    }
    
    public void setTelephone(String telephone){
        this.telephone = telephone;
    }
    public String getRole(){
        return this.role;
    }
    
    public void setRole(String role){
        this.telephone = role;
    }
    
    public void setId(int id){
        this.id =id;
    }
    
    public int getId() {
        return this.id;
    }    
    @Override
    public String toString(){
        SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        return "{id:" + this.id + ", "
                + "nom:\""+ this.nom  + "\","
                + "prenom:\"" + this.prenom + "\","
                + "email:\"" + this.email + "\","
                + "pwd:\"" + this.pwd + "\","
                + "statut:\"" + this.statut + "\","
                + "dateCreation:\"" + ft.format(this.dateCreation) + "\","
                + "role:\"" + this.role + "\","
                + "}";
    }
}
