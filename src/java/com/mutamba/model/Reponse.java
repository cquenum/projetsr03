/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.model;

/**
 *
 * @author cquenum
 */
public class Reponse {
    private int id;
    private String valeur;
    private boolean statut;
    private boolean bonne;
    private Question question;
    
    public Reponse(){
        
    }
    
    public Reponse(String valeur){
        this.valeur = valeur;
    }
    
    public int getId(){
        return this.id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getValeur(){
        return this.valeur;
    }
    
    public void setValeur(String valeur){
        this.valeur = valeur;
    }
    
    public void setStatut(boolean statut){
        this.statut = statut;
    }
    
    public boolean getStatut(){
        return this.statut;
    }
    
    public boolean estBonne(){
        return this.bonne;
    }
    
    public void setBonne(boolean bonne){
        this.bonne = bonne;
    }
    
    public Question getQuestion(){
        return this.question;
    }
    
    public void setQuestion(Question question){
        this.question = question;
    }
    
    @Override
    public String toString(){
        return "{id:" + this.id +
                ", valeur:'" + this.valeur + "'" +
                ", statut: " + this.statut +
                ", bonne: " +this.bonne +
                ", question: " + this.question.toString() +
                "}";
    }
}
