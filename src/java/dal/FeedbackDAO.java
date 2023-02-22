/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.chart.PieChart;
import model.Doctor;
import model.Feedback;
import model.User;


public class FeedbackDAO extends DBContext {

    /**
     * Get list of feedback base on doctor_id or rate or both
     *
     * @param doctor_id
     * @param rate
     * @return
     */

    public void giveFeedback(Feedback f) {

        String sql = "INSERT INTO Feedback VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, f.getId());
            stm.setInt(2, f.getUser().getId());
            stm.setInt(3, f.getDoctor().getId());
            stm.setString(4, f.getFeedback());
            stm.setDate(5, f.getDate_created());
            stm.setInt(6, f.getRate());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int greatestID() {
        int max = 0;
        try {
            String sql = "SELECT ID FROM Feedback ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (max < rs.getInt("ID")) {
                    max = rs.getInt("ID");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return max;
    }

    public static void main(String[] args) {
        System.out.println(new FeedbackDAO().getList(0, -1).get(0).getDoctor().getUser().getFull_name());
    }
}
