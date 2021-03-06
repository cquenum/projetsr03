/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import com.mutamba.model.Parcours;
import com.mutamba.model.Utilisateur;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;

/**
 *
 * @author cquenum
 */
public class ParcoursDao extends Dao<Parcours> {

    @Override
    public Parcours find(int id) {
        Parcours parcours = new Parcours();

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM parcours WHERE id = " + id
                    );

            if (result.first()) {
                parcours = new Parcours(
                        new UtilisateurDao().find(result.getInt("id_utilisateur")),
                        new QuestionnaireDao().find(result.getInt("id_questionnaire"))
                );
                parcours.setId(result.getInt("id"));
                parcours.setDuree(result.getInt("duree"));

                result = this.connect
                        .createStatement(
                                ResultSet.TYPE_SCROLL_INSENSITIVE,
                                ResultSet.CONCUR_UPDATABLE)
                        .executeQuery(
                                "SELECT * FROM parcours_reponse WHERE id_parcours = " + id
                        );

                while (result.next()) {
                    parcours.addReponse(
                            new ReponseDao()
                                    .find(result.getInt("id_reponse")
                                    )
                    );
                }

                parcours.setScore();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parcours;
    }

    @Override
    public Hashtable<Integer, Parcours> find() {
        Hashtable<Integer, Parcours> parcours = new Hashtable<Integer, Parcours>();

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT id FROM parcours"
                    );
            while (result.next()) {
                parcours.put(parcours.size(), this.find(result.getInt("id")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parcours;
    }

    @Override
    public Parcours create(Parcours obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "INSERT INTO parcours (score, duree, id_utilisateur, id_questionnaire) "
                            + "VALUES (?, ?, ?, ?)");

            prepare.setInt(1, obj.getScore());
            prepare.setInt(2, obj.getDuree());
            prepare.setInt(3, obj.getStagiaire().getId());
            prepare.setInt(4, obj.getQuestionnaire().getId());

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
    public Parcours update(Parcours obj) {
        try {

            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "UPDATE parcours SET score = ?, "
                            + "duree = ?, "
                            + "id_utilisateur = ?, "
                            + "id_questionnaire = ? "
                            + "WHERE id = ?"
                    );

            prepare.setInt(1, obj.getScore());
            prepare.setInt(2, obj.getDuree());
            prepare.setInt(3, obj.getStagiaire().getId());
            prepare.setInt(4, obj.getQuestionnaire().getId());
            prepare.setInt(5, obj.getId());

            prepare.executeUpdate();

            obj = this.find(obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public void delete(Parcours obj) {
        try {
            Statement statement = this.connect.createStatement();
            statement.addBatch("DELETE FROM parcours_reponse WHERE id_parcours = " + obj.getId());
            statement.addBatch("DELETE FROM parcours WHERE id_parcours = " + obj.getId());

            statement.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Parcours saveReponse(Parcours obj) {

        for (int i = 0; i < obj.getReponses().size(); i++) {
            try {
                PreparedStatement prepare = this.connect
                        .prepareStatement(
                                "INSERT INTO parcours_reponse(id_parcours, id_reponse)"
                                + " VALUES(?, ?)"
                        );

                prepare.setInt(1, obj.getId());
                prepare.setInt(2, obj.getReponses().get(i).getId());

                prepare.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        obj = this.find(obj.getId());

        return obj;
    }

    public Hashtable<Integer, Parcours> find(Utilisateur utilisateur) {
        Hashtable<Integer, Parcours> parcours = new Hashtable<Integer, Parcours>();

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT id FROM parcours WHERE id_utilisateur = " + utilisateur.getId()
                    );
            while (result.next()) {
                parcours.put(parcours.size(), this.find(result.getInt("id")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return parcours;

    }

}
