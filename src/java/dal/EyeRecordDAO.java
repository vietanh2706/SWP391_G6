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
import model.EyeRecord;

/**
 *
 * @author Dong
 */
public class EyeRecordDAO extends DBContext {

    public int createEye(EyeRecord eye) {
        int n = 0;
        ResultSet rs;
        try {
            String sql = "INSERT INTO [dbo].[EyeRecord]\n"
                    + "           ([vision_test]\n"
                    + "           ,[eye_disease]\n"
                    + "           ,[eye_type]\n"
                    + "           ,[type_id]\n"
                    + "           ,[code])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?) SELECT @@IDENTITY asLastID";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, eye.getVision_test());
            pre.setString(2, eye.getEye_disease());
            pre.setString(3, eye.getEye_type());
            pre.setInt(4, eye.getType().getId());
            pre.setString(5, eye.getCode());

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

    public EyeRecord getEyeRecord(String medical_code) {
        try {
            String sql = "select EyeRecord.* from MedicalRecord\n"
                    + "join EyeRecord on MedicalRecord.eye_id = EyeRecord.ID\n"
                    + "where MedicalRecord.code = ?";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, medical_code);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                EyeRecord er = new EyeRecord();
                er.setId(rs.getInt(1));
                er.setVision_test(rs.getString(2));
                er.setEye_disease(rs.getString(3));
                er.setEye_type(rs.getString(4));
                return er;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void UpdateEye(String code, String vision, String eye1, String eye2) {

        try {
            String sql = "UPDATE [dbo].EyeRecord\n"
                    + "SET    [vision_test]=?\n"
                    + "      ,[eye_disease]=?\n"
                    + "      ,[eye_type]= ?\n"
                    + "WHERE EyeRecord.[code] = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, vision);
            pre.setString(2, eye1);
            pre.setString(3, eye2);
            pre.setString(4, code);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EyeRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
