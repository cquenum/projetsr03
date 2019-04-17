/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import com.mutamba.model.Competence;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;import java.util.Hashtable;

/**
 *
 * @author albertmutamba
 */
public class CompetenceDao extends Dao<Competence> {

    @Override
    public Competence find(int id) {
        Competence competence = new Competence();
        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM competence WHERE id = " + id
                    );

            if (result.first()) {
                competence = new Competence(
                        result.getString("sujet"));
                competence.setId(result.getInt("id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return competence;
    }

    @Override
    public Competence create(Competence obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "INSERT INTO competence (sujet)"
                            + "VALUES(?)"
                    );

            prepare.setString(1, obj.getSujet());

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
    public Competence update(Competence obj) {
        try {

            PreparedStatement prepare = this.connect
                    .prepareStatement(
                                  "UPDATE competence SET sujet = ? "
                            + "WHERE id = ?"
                    );

            prepare.setString(1, obj.getSujet());
            prepare.setInt(2, obj.getId());

            prepare.executeUpdate();

            obj = this.find(obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public void delete(Competence obj) {
        try {
            this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    ).executeUpdate(
                            "DELETE FROM competence WHERE id = " + obj.getId()
                    );

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Hashtable<Integer, Competence> find() {
        Hashtable<Integer, Competence> competencesTable = new Hashtable<Integer, Competence>();
        Competence competence;

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM competence "
                    );

            while (result.next()) {
                competence = new Competence(
                        result.getString("sujet"));
                competence.setId(result.getInt("id"));
                competencesTable.put(competencesTable.size(), competence);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return competencesTable;
    }

}
