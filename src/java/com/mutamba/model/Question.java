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
public class Question {
    private int id;
    private String valeur;
    private boolean statut;
    private Questionnaire questionnaire;
    
    public Question(){
        
    }
    
    public Question(String valeur){
        this.valeur = valeur;
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
    
    public void setQuestionnaire(Questionnaire questionnaire){
        this.questionnaire = questionnaire;
    }
    
    public Questionnaire getQuestionnaire(){
        return this.questionnaire;
    }
    
    @Override
    public String toString(){
        return "{id: " + this.id +
                ", valeur: '" + this.valeur + "'" +
                ", questionnaire: " + this.questionnaire.toString() +
                "}";
    }
}
