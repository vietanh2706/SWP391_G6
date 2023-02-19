/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PhysicalRecord;

/**
 *
 * @author Dong
 */
public class PhysicalRecordDAO extends DBContext {

    public int createPhysical(PhysicalRecord physical) {
        int n = 0;
        ResultSet rs;
        try {
            String sql = "INSERT INTO [dbo].[PhysicalRecord]\n"
                    + "           ([height]\n"
                    + "           ,[weight]\n"
                    + "           ,[BMI]\n"
                    + "           ,[pulse_rate]\n"
                    + "           ,[blood_pressure]\n"
                    + "           ,[physical_type]\n"
                    + "           ,[type_id]\n"
                    + "           ,[code])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?) SELECT @@IDENTITY asLastID";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setDouble(1, physical.getHeight());
            pre.setDouble(2, physical.getWeight());
            pre.setDouble(3, physical.getBMI());
            pre.setInt(4, physical.getPulse_rate());
            pre.setInt(5, physical.getBlood_pressure());
            pre.setString(6, physical.getPhysical_type());
            pre.setInt(7, physical.getType().getId());
            pre.setString(8, physical.getCode());
            n = pre.executeUpdate();
            if (n > 0) {
                rs = pre.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public PhysicalRecord getPhysicalRecord(String code) {
        try {
            String sql = "select PhysicalRecord.* from MedicalRecord join PhysicalRecord on MedicalRecord.eye_id = PhysicalRecord.ID\n"
                    + "where PhysicalRecord.code= ?";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, code);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                PhysicalRecord er = new PhysicalRecord();
                er.setId(rs.getInt(1));
                er.setHeight(rs.getInt(2));
                er.setWeight(rs.getInt(3));
                er.setBMI(rs.getInt(4));
                er.setPulse_rate(rs.getInt(5));
                er.setBlood_pressure(rs.getInt(6));
                er.setPhysical_type(rs.getString(7));
                return er;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PhysicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updatePhysicalRecord(String code, double height, double weight, double BMI, int Pulse, int Blood, String Physical) {

        try {
            String sql = "  UPDATE [dbo].[PhysicalRecord]\n"
                    + "  SET     [height]=?\n"
                    + "          ,[weight]=?\n"
                    + "          ,[BMI]=?\n"
                    + "          ,[pulse_rate]=?\n"
                    + "          ,[blood_pressure]=?\n"
                    + "          ,[physical_type]=?\n"
                    + "  WHERE [PhysicalRecord].code=?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDouble(1, height);
            pre.setDouble(2, weight);
            pre.setDouble(3, BMI);
            pre.setInt(4, Pulse);
            pre.setInt(5, Blood);
            pre.setString(6, Physical);
            pre.setString(7, code);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PhysicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
