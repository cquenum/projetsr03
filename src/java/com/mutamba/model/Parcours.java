/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.model;

import java.util.Hashtable;

/**
 *
 * @author cquenum
 */
public class Parcours {
    private int id = 0;
    private int duree = 0;
    private int score = 0;
    private Utilisateur stagiaire;
    private Questionnaire questionnaire;
    private Hashtable<Integer, Reponse> reponses;
    
    public Parcours(){
        
    }
    
    public Parcours(Utilisateur stagiaire, Questionnaire questionnaire){
        this.stagiaire = stagiaire;
        this.questionnaire = questionnaire;
        this.reponses = new Hashtable<>();
    }
    
    public int getId(){
        return this.id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public int getDuree(){
        return this.duree;
    }
    
    public void setDuree(int duree){
        this.duree = duree;
    }
    
    public void updateDuree(int duree){
        this.duree += duree;
    }
    
    public int getScore(){
        this.setScore();
        return this.score;
    }
    
    public void setScore(){
        this.score = 0;
        if (this.reponses != null)
            for (int i = 0; i < this.reponses.size(); i++)
                if (this.reponses.get(i).isBonne())
                    this.score += 1;
    }
    
    public Utilisateur getStagiaire(){
        return this.stagiaire;
    }
    
    public void setSagiaire(Utilisateur stagiaire){
        this.stagiaire = stagiaire;
    }
    
    public Questionnaire getQuestionnaire(){
        return this.questionnaire;
    }
    
    public void setQuestionnaire(Questionnaire questionnaire){
        this.questionnaire = questionnaire;
    }
    
    public Hashtable<Integer, Reponse> getReponses(){
        return this.reponses;
    }
    
    public void addReponse(Reponse reponse){
        this.reponses.put(reponses.size(), reponse);
    }
    
    @Override
    public String toString(){
        String s_reponses = "[";
        if (reponses != null)
            for (int i = 0; i < this.reponses.size(); i++){
                s_reponses += this.reponses.get(i).toString() + " ,";
            }
        
        s_reponses = s_reponses.replaceAll(",$", "");
        
        s_reponses += "]";
        
        return "{id: " + this.id + 
                ", duree: " + this.duree + 
                ", score: " + this.score + 
                ", stagiaire: " + this.stagiaire.toString() + 
                ", questionnaire: " + this.questionnaire.toString() + 
                ", reponses: " + s_reponses + 
                "}";
    }
    
    @Override
    public boolean equals(Object obj){
                
        if ((obj != null) && (obj.getClass() == Parcours.class)){
            if (((Parcours) obj).getId() == this.id )
                return true;
        }
        return false;
    }
}
