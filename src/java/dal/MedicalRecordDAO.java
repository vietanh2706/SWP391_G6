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
import model.MedicalRecord;

/**
 *
 * @author Duc Anh
 */
public class MedicalRecordDAO extends DBContext {

    public void createMedical(MedicalRecord medical) {
        try {

            String sql = "INSERT INTO [dbo].[MedicalRecord]\n"
                    + "           ([doctor_id],[reservation_id],[physical_id]\n"
                    + "           ,[internal_id],[eye_id],[ent_id],[maxillofacial_id]\n"
                    + "           ,[diagnostic],[conclusion],[code],[status])\n"
                    + "     VALUES(?,?,?,?,?,?,?,?,?,?,1)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, medical.getDoctor_id());
            pre.setInt(2, medical.getReservation_id());
            pre.setInt(3, medical.getPhysical_id());
            pre.setInt(4, medical.getInternal_id());
            pre.setInt(5, medical.getEye_id());
            pre.setInt(6, medical.getEnt_id());
            pre.setInt(7, medical.getMaxillofacial_id());
            pre.setString(8, medical.getDiag());
            pre.setString(9, medical.getConclusion());
            pre.setString(10, medical.getCode());
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int id) {
        try {
            String sql = "UPDATE [dbo].[MedicalRecord]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setInt(2, id);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<MedicalRecord> getAllMedicalRecord() {
        ArrayList<MedicalRecord> result = new ArrayList<>();
        PreparedStatement pre = null;
        try {
            String sql = "SELECT * FROM MedicalRecord WHERE status = 1 and reservation_id is NOT NULL";
            pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                result.add(mr);
            }
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(InternalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pre.close();
            } catch (SQLException ex) {
                Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public MedicalRecord getMRbyCodeID(String code, int id) {
        try {
            String sql = "select * from MedicalRecord\n"
                    + "where MedicalRecord.code = ? and reservation_id =?";
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, code);
            pre.setInt(2, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                return mr;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateMedicalRecord(String code, String diag, String conclusion) {
        try {
            String sql = "UPDATE [dbo].[MedicalRecord]\n"
                    + "SET [diagnostic] = ?, [conclusion] = ?\n"
                    + "WHERE MedicalRecord.[code] = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, diag);
            pre.setString(2, conclusion);
            pre.setString(3, code);
            pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public ArrayList<MedicalRecord> SearchById(String keyword) {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * from [dbo].[MedicalRecord]\n"
                    + "WHERE status = 1 AND reservation_id is NOT NULL AND ID like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                list.add(mr);
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
     public ArrayList<MedicalRecord> SearchByDoctorName(String keyword) {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM MedicalRecord m\n" +
            "WHERE m.[status] = 1 AND m.reservation_id is NOT NULL AND m.doctor_id IN \n" +
            "(SELECT u.ID FROM [User] u WHERE u.full_name LIKE ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                list.add(mr);
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<MedicalRecord> SearchByPatientName(String keyword) {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM MedicalRecord m\n" +
            "WHERE m.[status] = 1 AND m.reservation_id is NOT NULL AND m.reservation_id IN \n" +
            "(SELECT r.ID FROM [Reservation] r WHERE r.full_name LIKE ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                list.add(mr);
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<MedicalRecord> SearchByDiagnostic(String keyword) {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[MedicalRecord]\n"
                    + "WHERE status = 1 AND reservation_id is NOT NULL AND diagnostic LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                list.add(mr);
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<MedicalRecord> SearchByConclusion(String keyword) {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[MedicalRecord]\n"
                    + "WHERE status = 1 AND reservation_id is NOT NULL AND conclusion LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                list.add(mr);
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public ArrayList<MedicalRecord> SearchByCode(String keyword) {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[MedicalRecord]\n"
                    + "WHERE status = 1 AND reservation_id is NOT NULL AND code LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt(1));
                mr.setDoctor_id(rs.getInt(2));
                mr.setReservation_id(rs.getInt(3));
                mr.setPhysical_id(rs.getInt(4));
                mr.setInternal_id(rs.getInt(5));
                mr.setEye_id(rs.getInt(6));
                mr.setEnt_id(rs.getInt(7));
                mr.setMaxillofacial_id(rs.getInt(8));
                mr.setDiag(rs.getString(9));
                mr.setConclusion(rs.getString(10));
                mr.setStatus(rs.getInt(11));
                mr.setCode(rs.getString(12));
                list.add(mr);
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
