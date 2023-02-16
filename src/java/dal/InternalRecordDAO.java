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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.InternalRecord;
import model.Type;

/**
 *
 * @author Duc Anh
 */
public class InternalRecordDAO extends DBContext {

    public int createInternal(InternalRecord internal) {
        ResultSet rs;
        int n = 0;
        try {

            String sql = "INSERT INTO [dbo].[InternalRecord]\n"
                    + "           ([blood_cycle]\n"
                    + "           ,[respiratory]\n"
                    + "           ,[GI]\n"
                    + "           ,[kidneys_unary]\n"
                    + "           ,[musculoskeletal]\n"
                    + "           ,[neurological]\n"
                    + "           ,[neuropsychiaric]\n"
                    + "           ,[type_id]\n"
                    + "           ,[code])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?) SELECT @@IDENTITY asLastID";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, internal.getBlood_cycle());
            pre.setString(2, internal.getRespiratory());
            pre.setString(3, internal.getGI());
            pre.setString(4, internal.getKidneys_unary());
            pre.setString(5, internal.getMusculoskeletal());
            pre.setString(6, internal.getNeurological());
            pre.setString(7, internal.getNeurospychiaric());
            pre.setInt(8, internal.getType().getId());
            pre.setString(9, internal.getCode());
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

    public InternalRecord getInternalRecord(String medical_code) {
        try {
            String sql = "select InternalRecord.* from MedicalRecord\n"
                    + "join InternalRecord on MedicalRecord.eye_id = InternalRecord.ID\n"
                    + "where MedicalRecord.code = ?";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, medical_code);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                InternalRecord er = new InternalRecord();
                er.setId(rs.getInt(1));
                er.setBlood_cycle(rs.getString(2));
                er.setRespiratory(rs.getString(3));
                er.setGI(rs.getString(4));
                er.setKidneys_unary(rs.getString(5));
                er.setMusculoskeletal(rs.getString(6));
                er.setNeurological(rs.getString(7));
                er.setNeurospychiaric(rs.getString(8));
                er.setCode(rs.getString(9));
                return er;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//    public static void main(String[] args) {
//        Type type = new TypeDAO().getOne(1);
//        InternalRecord in = new InternalRecord("blood_cycle", "respiratory", "GI", "kidneys_unary", "musculoskeletal", "neurological", "neurospychiaric" ,type);
//        int id = new InternalRecordDAO().createInternal(in);
//        System.out.println(id);
//    }

    public void updateInternalRecord(String code, int blood, int respiratory, int GI, String kidneys, String musculo, String logical, String psychiaric) {

        try {
            String sql = "UPDATE [dbo].[InternalRecord]\n"
                    + "SET    [blood_cycle]=?\n"
                    + "      ,[respiratory]=?\n"
                    + "      ,[GI]=?\n"
                    + "      ,[kidneys_unary]=?\n"
                    + "      ,[musculoskeletal]=?\n"
                    + "      ,[neurological]=?\n"
                    + "      ,[neuropsychiaric]=?"
                    + "WHERE [InternalRecord].[code] = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, blood);
            pre.setInt(2, respiratory);
            pre.setInt(3, GI);
            pre.setString(4, kidneys);
            pre.setString(5, musculo);
            pre.setString(6, logical);
            pre.setString(7, psychiaric);
            pre.setString(8, code);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
