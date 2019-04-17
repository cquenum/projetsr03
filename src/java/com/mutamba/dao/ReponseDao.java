/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import com.mutamba.model.Reponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

/**
 *
 * @author cquenum
 */
public class ReponseDao extends Dao<Reponse>{
    
   @Override
    public Reponse find(int id) {
        Reponse reponse = new Reponse();

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM reponse WHERE id = " + id
                    );
            if (result.first()) {
                reponse = new Reponse(
                        result.getString("valeur")
                );

                reponse.setId(result.getInt("id"));
                reponse.setStatut(result.getBoolean("statut"));
                reponse.setQuestion(
                        new QuestionDao()
                                .find(
                                        result.getInt("id_question")
                                )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reponse;
    }

    @Override
    public Hashtable<Integer, Reponse> find() {
        Hashtable<Integer, Reponse> reponses = new Hashtable<Integer, Reponse>();
        Reponse reponse;

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM reponse"
                    );

            while (result.next()) {
                reponse = new Reponse(
                        result.getString("valeur")
                );
                reponse.setId(result.getInt("id"));
                reponse.setStatut(result.getBoolean("statut"));
                reponse.setQuestion(
                        new QuestionDao()
                                .find(
                                        result.getInt("id_question")
                                )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reponses;
    }

    @Override
    public Reponse create(Reponse obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "INSERT INTO reponse (valeur, statut, id_question) "
                            + "VALUES (?, ?, ?)");

            prepare.setString(1, obj.getValeur());
            prepare.setBoolean(2, obj.getStatut());
            prepare.setInt(3, obj.getQuestion().getId());

            prepare.executeUpdate();

            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    )
                    .executeQuery("SELECT LAST_INSERT_ID() as id");

            if (result.first()) {
                obj = this.find(result.getInt("id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return obj;
    }

    @Override
    public Reponse update(Reponse obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "UPDATE reponse SET valeur = ?, "
                            + "statut = ?, "
                            + "id_question = ?, "
                            + "WHERE id = ?"
                    );

            prepare.setString(1, obj.getValeur());
            prepare.setBoolean(2, obj.getStatut());
            prepare.setInt(3, obj.getQuestion().getId());
            prepare.setInt(4, obj.getId());

            obj = this.find(obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public void delete(Reponse obj) {
        try {
            this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    ).executeUpdate(
                            "DELETE FROM reponse WHERE id = " + obj.getId()
                    );

        } catch (SQLException e) {
            e.printStackTrace();
        }
    } 
    
}
