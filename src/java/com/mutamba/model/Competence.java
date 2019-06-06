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
public class Competence {
    private int id;
    private String sujet;
    
    public Competence(){
        
    }
    
    public Competence(String sujet){
        this.sujet = sujet;
    }
    
    
    public void setId(int id){
        this.id = id;
    }
    
    public int getId(){
        return this.id;
    }
    
    public void setSujet(String sujet){
        this.sujet = sujet;
    }
    
    public String getSujet(){
        return this.sujet;
    }
    
    @Override
    public String toString(){
        return "{id:" + this.id + 
                ", sujet: '" + this.sujet + "'" +
                "}";
    }
    
    @Override
    public boolean equals(Object obj){
                
        if ((obj != null) && (obj.getClass() == Competence.class)){
            if (((Competence) obj).getId() == this.id )
                return true;
        }
        return false;
    }
    
}
