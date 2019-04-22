/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import com.mutamba.model.Utilisateur;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Hashtable;

/**
 *
 * @author cquenum
 */
public class UtilisateurDao extends Dao<Utilisateur> {

    @Override
    public Utilisateur find(int id) {
        Utilisateur utilisateur = new Utilisateur();
        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM utilisateur WHERE id = " + id
                    );

            if (result.first()) {
                utilisateur = new Utilisateur(
                        result.getString("nom"),
                        result.getString("prenom"),
                        result.getString("email"),
                        result.getString("pwd"),
                        result.getString("role")
                );
                utilisateur.setId(result.getInt("id"));
                utilisateur.setDateCreation(result.getTimestamp("dateCreation").toLocalDateTime());
                utilisateur.setTelephone(result.getString("telephone"));
                utilisateur.setStatut(result.getBoolean("statut"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return utilisateur;
    }

    @Override
    public Utilisateur create(Utilisateur obj) {
        try {
            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "INSERT INTO utilisateur (nom, "
                            + "prenom, "
                            + "email, "
                            + "pwd, "
                            + "statut, "
                            + "telephone, "
                            + "dateCreation, "
                            + "role) "
                            + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)"
                    );

            prepare.setString(1, obj.getNom());
            prepare.setString(2, obj.getPrenom());
            prepare.setString(3, obj.getEmail());
            prepare.setString(4, obj.getPwd());
            prepare.setBoolean(5, obj.getStatut());
            prepare.setString(6, obj.getTelephone());
            prepare.setTimestamp(7, Timestamp.valueOf(obj.getDateCreation()));
            prepare.setString(8, obj.getRole());

            prepare.executeUpdate();
            
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    )
                    .executeQuery("SELECT LAST_INSERT_ID() as id");
            
            if (result.first())
                obj = this.find(result.getInt("id"));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return obj;

    }

    @Override
    public Utilisateur update(Utilisateur obj) {
        try {

            PreparedStatement prepare = this.connect
                    .prepareStatement(
                            "UPDATE utilisateur SET nom = ?, "
                            + "prenom = ?, "
                            + "email = ?, "
                            + "pwd = ?, "
                            + "statut = ?, "
                            + "telephone = ?, "
                            + "dateCreation = ?, "
                            + "role = ? "
                            + "WHERE id = ?"
                    );
            
            prepare.setString(1, obj.getNom());
            prepare.setString(2, obj.getPrenom());
            prepare.setString(3, obj.getEmail());
            prepare.setString(4, obj.getPwd());
            prepare.setBoolean(5, obj.getStatut());
            prepare.setString(6, obj.getTelephone());
            prepare.setTimestamp(7, Timestamp.valueOf(obj.getDateCreation()));
            prepare.setString(8, obj.getRole());
            prepare.setInt(9, obj.getId());

            prepare.executeUpdate();

            obj = this.find(obj.getId());
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return obj;
    }

    @Override
    public void delete(Utilisateur obj) {
        try {
            this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE
                    ).executeUpdate(
                            "DELETE FROM utilisateur WHERE id = " + obj.getId()
                    );

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Hashtable<Integer, Utilisateur> find() {
        Hashtable<Integer, Utilisateur> utilisateursTable = new Hashtable<Integer, Utilisateur>();
        Utilisateur utilisateur;

        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT * FROM utilisateur "
                    );

            while (result.next()) {
                utilisateur = new Utilisateur(
                        result.getString("nom"),
                        result.getString("prenom"),
                        result.getString("email"),
                        result.getString("pwd"),
                        result.getString("role")
                );
                utilisateur.setId(result.getInt("id"));
                utilisateur.setDateCreation(result.getTimestamp("dateCreation").toLocalDateTime());
                utilisateur.setTelephone(result.getString("telephone"));
                utilisateur.setStatut(result.getBoolean("statut"));

                utilisateursTable.put(utilisateursTable.size(), utilisateur);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return utilisateursTable;
    }

    public Utilisateur checkLogin(String email, String pwd) {
        Utilisateur utilisateur = null;
        try {
            ResultSet result = this.connect
                    .createStatement(
                            ResultSet.TYPE_SCROLL_INSENSITIVE,
                            ResultSet.CONCUR_UPDATABLE)
                    .executeQuery(
                            "SELECT id FROM utilisateur WHERE "
                                    + "email='" + email.trim() + "' " 
                                    + "AND pwd='" + pwd + "'"
                    );

            if (result.first()) {
                utilisateur = this.find(result.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return utilisateur;
    }
}
