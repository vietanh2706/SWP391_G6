package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Biochemical;
import model.BloodCell;
import model.EntRecord;
import model.EyeRecord;
import model.InternalRecord;
import model.MaxillofacialRecord;
import model.MediPatient;
import model.MedicalRecord;
import model.PhysicalRecord;

/**
 *
 * @author HuuTrinh
 */
public class RecordDAO extends DBContext{
    public MedicalRecord GetRecordByCode(String code) {
        try {
            String sql = "SELECT * FROM medicalrecord WHERE [code] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt("id"));
                mr.setDoctor_id(rs.getInt("doctor_id"));
                mr.setReservation_id(rs.getInt("reservation_id"));
                mr.setPhysical_id(rs.getInt("physical_id"));
                mr.setInternal_id(rs.getInt("internal_id"));
                mr.setEye_id(rs.getInt("eye_id"));
                mr.setEnt_id(rs.getInt("ent_id"));
                mr.setMaxillofacial_id(rs.getInt("maxillofacial_id"));
                mr.setDiag(rs.getString("diagnostic"));
                mr.setConclusion(rs.getString("conclusion"));
                
                mr.setCode(rs.getString("code"));
                mr.setStatus(rs.getInt("status"));
                return mr;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public MedicalRecord GetRecordByID(int id) {
        try {
            String sql = "SELECT * FROM medicalrecord WHERE [patient_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt("id"));
                mr.setDoctor_id(rs.getInt("doctor_id"));
//                mr.setPatient_id(rs.getInt("patient_id"));
                mr.setReservation_id(rs.getInt("reservation_id"));
                mr.setPhysical_id(rs.getInt("physical_id"));
                mr.setInternal_id(rs.getInt("internal_id"));
                mr.setEye_id(rs.getInt("eye_id"));
                mr.setEnt_id(rs.getInt("ent_id"));
                mr.setMaxillofacial_id(rs.getInt("maxillofacial_id"));
                mr.setDiag(rs.getString("diagnostic"));
                mr.setConclusion(rs.getString("conclusion"));
                mr.setCode(rs.getString("code"));
                return mr;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MedicalRecord> getAll() {
        ArrayList<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM medicalrecord";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MedicalRecord mr = new MedicalRecord();
                mr.setId(rs.getInt("id"));
                mr.setDoctor_id(rs.getInt("doctor_id"));
                mr.setReservation_id(rs.getInt("reservation_id"));
                mr.setPhysical_id(rs.getInt("physical_id"));
                mr.setInternal_id(rs.getInt("internal_id"));
                mr.setEye_id(rs.getInt("eye_id"));
                mr.setEnt_id(rs.getInt("ent_id"));
                mr.setMaxillofacial_id(rs.getInt("maxillofacial_id"));
                mr.setDiag(rs.getString("diagnostic"));
                mr.setConclusion(rs.getString("conclusion"));
                mr.setCode(rs.getString("code"));
                list.add(mr);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public PhysicalRecord getPhysicalRecordByCode(String code) {
        try {
            String sql = "SELECT * FROM PhysicalRecord WHERE code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                PhysicalRecord r = new PhysicalRecord();
                r.setId(rs.getInt("id"));
                r.setHeight(rs.getDouble("height"));
                r.setWeight(rs.getDouble("weight"));
                r.setBMI(rs.getDouble("BMI"));
                r.setPulse_rate(rs.getInt("pulse_rate"));
                r.setBlood_pressure(rs.getInt("blood_pressure"));
                r.setPhysical_type(rs.getString("physical_type"));
                r.setCode(rs.getString("code"));
                return r;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public EyeRecord getEyeRecordByCode(String code) {
        try {
            String sql = "SELECT * FROM EyeRecord WHERE code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                EyeRecord e = new EyeRecord();
                e.setId(rs.getInt("id"));
                e.setVision_test(rs.getString("vision_test"));
                e.setEye_disease(rs.getString("eye_disease"));
                e.setEye_type(rs.getString("eye_type"));
                e.setCode(rs.getString("code"));
                return e;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public EntRecord getEntRecordByCode(String code) {
        try {
            String sql = "SELECT * FROM ENTRecord WHERE code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                EntRecord e = new EntRecord();
                e.setId(rs.getInt("id"));
                e.setHearing_test(rs.getString("hearing_test"));
                e.setNose_throat_disease(rs.getString("nose_throat_test"));
                e.setCode(rs.getString("code"));
                return e;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public InternalRecord getInByCode(String code) {
        try {
            String sql = "SELECT * FROM InternalRecord WHERE code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                InternalRecord i = new InternalRecord();
                i.setId(rs.getInt("id"));
                i.setBlood_cycle(rs.getString("blood_cycle"));
                i.setRespiratory(rs.getString("respiratory"));
                i.setGI(rs.getString("GI"));
                i.setKidneys_unary(rs.getString("kidneys_unary"));
                i.setMusculoskeletal(rs.getString("musculoskeletal"));
                i.setNeurological(rs.getString("neurological"));
                i.setNeurospychiaric(rs.getString("neuropsychiaric"));
                i.setCode(rs.getString("code"));
                return i;

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public MaxillofacialRecord getMaxiByCode(String code) {
        try {
            String sql = "SELECT * FROM MaxillofacialRecord WHERE code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MaxillofacialRecord m = new MaxillofacialRecord();
                m.setId(rs.getInt("id"));
                m.setUpper(rs.getString("upper_jaw"));
                m.setLower(rs.getString("lower_jaw"));
                m.setDental(rs.getString("dental_disease"));
                m.setCode(rs.getString("code"));
                return m;
            }
        } catch (Exception e) {
        }
        return null;
    }

    
    public ArrayList<MediPatient> getAllMediPatient(){
        ArrayList<MediPatient> list = new ArrayList<>();
        try {
            String sql = "SELECT p.id, p.name, m.diagnostic, m.conclusion, m.code FROM Patient p join MedicalRecord m on p.id = m.patient_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                MediPatient m = new MediPatient();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                m.setDiag(rs.getString("diagnostic"));
                m.setConclu(rs.getString("conclusion"));
                m.setCode(rs.getString("code"));
                list.add(m);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
