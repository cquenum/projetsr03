/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import com.mutamba.model.Question;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

/**
 *
 * @author cquenum
 */
public class QuestionDao extends Dao<Question> {

    @Override
    public Question find(int id) {
        Question question = new Question();

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM question WHERE id = " + id
                    );
            if (result.first()) {
                question = new Question(
                        result.getString("valeur")
                );

                question.setId(result.getInt("id"));
                question.setStatut(result.getBoolean("statut"));
                question.setQuestionnaire(
                        new QuestionnaireDao()
                                .find(
                                        result.getInt("id_questionnaire")
                                )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return question;
    }

    @Override
    public Hashtable<Integer, Question> find() {
        Hashtable<Integer, Question> questions = new Hashtable<Integer, Question>();
        Question question;

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM question"
                    );

            while (result.next()) {
                question = new Question(
                        result.getString("valeur")
                );
                question.setId(result.getInt("id"));
                question.setStatut(result.getBoolean("statut"));
                question.setQuestionnaire(
                        new QuestionnaireDao()
                                .find(
                                        result.getInt("id_questionnaire")
                                )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questions;
    }

    @Override
    public Question create(Question obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "INSERT INTO question (valeur, statut, id_questionnaire) "
                            + "VALUES (?, ?, ?)");

            prepare.setString(1, obj.getValeur());
            prepare.setBoolean(2, obj.getStatut());
            prepare.setInt(3, obj.getQuestionnaire().getId());

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
    public Question update(Question obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "UPDATE question SET valeur = ?, "
                            + "statut = ?, "
                            + "id_questionnaire = ?, "
                            + "WHERE id = ?"
                    );

            prepare.setString(1, obj.getValeur());
            prepare.setBoolean(2, obj.getStatut());
            prepare.setInt(3, obj.getQuestionnaire().getId());
            prepare.setInt(4, obj.getId());

            obj = this.find(obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public void delete(Question obj) {
        try {
            this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    ).executeUpdate(
                            "DELETE FROM question WHERE id = " + obj.getId()
                    );

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
