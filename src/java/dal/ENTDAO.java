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
import model.EntRecord;

/**
 *
 * @author Dong
 */
public class ENTDAO extends DBContext {

    public int createENT(EntRecord ent) {
        int n = 0;
        ResultSet rs;
        try {
            String sql = "INSERT INTO [dbo].[ENTRecord]\n"
                    + "           ([hearing_test]\n"
                    + "           ,[nose_throat_test]\n"
                    + "           ,[type_id]"
                    + "           ,[code])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?) SELECT @@IDENTITY asLastID";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, ent.getHearing_test());
            pre.setString(2, ent.getNose_throat_disease());
            pre.setInt(3, ent.getType().getId());
            pre.setString(4, ent.getCode());
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

    public EntRecord getEntRecord(String medical_code) {
        try {
            String sql = "select EntRecord.* from MedicalRecord\n"
                    + "join EntRecord on MedicalRecord.eye_id = EntRecord.ID\n"
                    + "where EntRecord.code = ?";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, medical_code);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                EntRecord er = new EntRecord();
                er.setId(rs.getInt(1));
                er.setHearing_test(rs.getString(2));
                er.setNose_throat_disease(rs.getString(3));
                return er;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void UpdateEnt(String code, String hearing, String nose) {

        try {
            String sql = "UPDATE [dbo].[ENTRecord]\n"
                    + "SET    [hearing_test]\n"
                    + "      ,[nose_throat_test]"
                    + "WHERE [ENTRecord].[code] = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, hearing);
            pre.setString(2, nose);
            pre.setString(3, code);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ENTDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
