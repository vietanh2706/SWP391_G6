/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reservation;
import model.Service;
import model.Type;
import model.User;

/**
 *
 * @author Duc Anh
 */
public class TypeDAO extends DBContext {

    private PreparedStatement pre;
    private ResultSet rs;

    public ArrayList<Type> getAll() {
        ArrayList<Type> list = new ArrayList<>();
        try {
            String sql = "select * from Type";
            pre = connection.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                Type type = new Type(rs.getInt(1), rs.getString(2));
                list.add(type);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Type> getAllByReservation(Reservation re) {
        ArrayList<Type> list = new ArrayList<>();
        try {
            String sql = "select Type. * from Type inner join Reservation_Type on Type.id = Reservation_Type.type_id\n"
                    + "where reservation_id = ?";

            pre = connection.prepareStatement(sql);
            pre.setInt(1, re.getId());
            rs = pre.executeQuery();

            while (rs.next()) {
                Type type = new Type(rs.getInt(1), rs.getString(2));
                list.add(type);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Type getOne(int select) {

        try {
            String sql = "select * from Type"
                    + " Where id = ?";

            pre = connection.prepareStatement(sql);
            pre.setInt(1, select);
            rs = pre.executeQuery();

            while (rs.next()) {
                Type type = new Type(rs.getInt(1), rs.getString(2));

                return type;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Type> getListType() {
        ArrayList<Type> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Type]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Type r = new Type(
                        rs.getInt("id"),
                        rs.getString("name"));
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void insertReservationType(int id, int id0) {
        String sql = "Insert into Reservation_Type "
                + "values (?,?);";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, id0);

            stm.executeUpdate();

        } catch (SQLException e) {
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
