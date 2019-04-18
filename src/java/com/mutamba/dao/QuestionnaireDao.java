/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import com.mutamba.model.Questionnaire;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

/**
 *
 * @author cquenum
 */
public class QuestionnaireDao extends Dao<Questionnaire>{

    @Override
    public Questionnaire find(int id) {
        Questionnaire questionnaire = new Questionnaire();
        
        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                    "SELECT * FROM questionnaire WHERE id = " + id
                    );
            if (result.first()){
                questionnaire = new Questionnaire(
                        result.getString("valeur")
                );
                
                questionnaire.setId(result.getInt("id"));
                questionnaire.setStatut(result.getBoolean("statut"));
                questionnaire.setCompetence(
                        new CompetenceDao()
                                .find(
                                        result.getInt("id_competence")
                                )
                );
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return questionnaire;
    }

    @Override
    public Hashtable<Integer, Questionnaire> find() {
        Hashtable<Integer, Questionnaire> questionnaires = new Hashtable<Integer, Questionnaire>();
        Questionnaire questionnaire;
        
        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM questionnaire"
                    );
            
            while(result.next()){
                questionnaire = new Questionnaire(
                        result.getString("valeur")
                );
                questionnaire.setId(result.getInt("id"));
                questionnaire.setStatut(result.getBoolean("statut"));
                questionnaire.setCompetence(
                        new CompetenceDao()
                                .find(
                                        result.getInt("id_competence")
                                )
                );
                questionnaires.put(questionnaires.size(), questionnaire);
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return questionnaires;
    }

    @Override
    public Questionnaire create(Questionnaire obj) {
        try{
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                    "INSERT INTO questionnaire (valeur, statut, id_competence) "
                    + "VALUES (?, ?, ?)");
            
            prepare.setString(1, obj.getValeur());
            prepare.setBoolean(2, obj.getStatut());
            prepare.setInt(3, obj.getCompetence().getId());
            
            prepare.executeUpdate();
            
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    )
                    .executeQuery("SELECT LAST_INSERT_ID() as id");
            
            if (result.first())
                obj = this.find(result.getInt("id"));
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return obj;
    }

    @Override
    public Questionnaire update(Questionnaire obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "UPDATE questionnaire SET valeur = ?, "
                            + "statut = ?, "
                            + "id_competence = ? "
                            + "WHERE id = ?"
                    );
            
            prepare.setString(1, obj.getValeur());
            prepare.setBoolean(2, obj.getStatut());
            prepare.setInt(3, obj.getCompetence().getId());
            prepare.setInt(4, obj.getId());
            
            prepare.executeUpdate();
            
            obj = this.find(obj.getId());
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return obj;
    }

    @Override
    public void delete(Questionnaire obj) {
        try {
            this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    ).executeUpdate(
                            "DELETE FROM questionnaire WHERE id = " + obj.getId()
                    );

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
