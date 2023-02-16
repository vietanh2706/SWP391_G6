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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reservation;

/**
 *
 * @author HaBui
 */
public class ConfirmScheduleDAO extends DBContext {

    public List<Reservation> getDoctorIdByReservationId(int did) {
        List<Reservation> lisst=new ArrayList<>();
        try {
            String sql = "SELECT * from Reservation left join ConfirmedSchedule on Reservation.ID = ConfirmedSchedule.reservation_id\n"
                    + " where doctor_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, did);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation(
                        rs.getInt("ID"),
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getDate("dob"),
                        rs.getBoolean("gender"),
                        rs.getString("insurance_code"),
                        rs.getDate("examination_date"),
                        rs.getString("examination_department"),
                        rs.getInt("status"),
                        rs.getString("detail_note"),
                        rs.getDate("created_date"),
                        rs.getString("email"));
                lisst.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lisst;
    }

}
