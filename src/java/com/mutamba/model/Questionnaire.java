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
public class Questionnaire {
    private int id;
    private String valeur;
    private boolean statut;
    private Competence competence;
    
    public Questionnaire(){
        
    }
    
    public Questionnaire(String valeur){
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
    
    public Competence getCompetence(){
        return this.competence;
    }
    
    public void setCompetence(Competence competence){
        this.competence = competence;
    }
    
    @Override
    public String toString(){
        return "{id:" + this.id + 
                ", valeur: '" + this.valeur + "'" +
                ", statut: '" + this.statut + "'" +
                ", competence: " + this.competence.toString() +
                "}";
    }
}
