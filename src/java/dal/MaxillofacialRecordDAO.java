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
import model.MaxillofacialRecord;

/**
 *
 * @author Duc Anh
 */
public class MaxillofacialRecordDAO extends DBContext {

    public int createMaxillofacial(MaxillofacialRecord maxi) {
        int n = 0;
        ResultSet rs;
        try {
            String sql = "INSERT INTO [dbo].[MaxillofacialRecord]\n"
                    + "           ([upper_jaw]\n"
                    + "           ,[lower_jaw]\n"
                    + "           ,[dental_disease]\n"
                    + "           ,[type_id]\n"
                    + "           ,[code])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?) SELECT @@IDENTITY asLastID";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, maxi.getUpper());
            pre.setString(2, maxi.getLower());
            pre.setString(3, maxi.getDental());
            pre.setInt(4, maxi.getType().getId());
            pre.setString(5, maxi.getCode());
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

    public MaxillofacialRecord getMaxillofacialRecord(String medical_code) {
        try {
            String sql = "select MaxillofacialRecord.* from MedicalRecord\n"
                    + "join MaxillofacialRecord on MedicalRecord.eye_id = MaxillofacialRecord.ID\n"
                    + "where MaxillofacialRecord.code = ?";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, medical_code);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                MaxillofacialRecord er = new MaxillofacialRecord();
                er.setId(rs.getInt(1));
                er.setUpper(rs.getString(2));
                er.setLower(rs.getString(3));
                er.setDental(rs.getString(4));
                return er;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MaxillofacialRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateMaxillo(String code, String upper, String lower, String dental) {

        try {
            String sql = "  UPDATE [dbo].[MaxillofacialRecord]\n"
                    + "     SET [upper_jaw]=?\n"
                    + "      ,[lower_jaw]=?\n"
                    + "      ,[dental_disease]=?\n"
                    + "      WHERE [MaxillofacialRecord].code=?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, upper);
            pre.setString(2, lower);
            pre.setString(3, dental);
            pre.setString(4, code);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(MaxillofacialRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
