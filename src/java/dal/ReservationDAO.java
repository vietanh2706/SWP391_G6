package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reservation;
import model.User;

/**
 *
 * @author HuuTrinh
 */
public class ReservationDAO extends DBContext {

    public List<Reservation> getAllReservation() {
        List<Reservation> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Reservation]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
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
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void insert(Reservation r) {
        String sql = "Insert into Reservation(full_name,email,examination_date,examination_department,phone,insurance_code,detail_note,user_id,dob,gender,status,created_date) "
                + "values (?,?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, r.getFull_name());
            stm.setString(2, r.getEmail());
            stm.setDate(3, r.getExam_date());
            stm.setString(4, "0");
            stm.setString(5, r.getPhone());
            stm.setString(6, r.getInsurance_code());
            stm.setString(7, r.getDetail_note());
            stm.setInt(8, r.getUser_id());
            stm.setDate(9, r.getDob());
            stm.setBoolean(10, r.isGender());
            stm.setInt(11, r.getStatus());
            stm.setDate(12, r.getCreated_date());

            stm.executeUpdate();

        } catch (SQLException e) {
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    
    
    public List<Reservation> getAllReservationByID(int id) {
        List<Reservation> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Reservation] where [user_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

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
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    
    
    public Reservation getReservationByID(int id) {
        try {
            String sql = "SELECT * FROM [Reservation] where [ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

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
                return r;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Reservation getNewReservation() {
        try {
            String sql = "SELECT top 1 * FROM [Reservation] "
                    + "ORDER BY ID DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

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
                return r;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void UpdateStatusByID(int status, int user_id, int id) {

        try {
            String sql = "update [Reservation] set status =? where user_id = ? and ID=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, user_id);
            stm.setInt(3, id);
            stm.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public void AdminUpdateStatusByID(int status, int id) {

        try {
            String sql = "update [Reservation] set status =? where ID=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public String ReserStatistic(int year) {
        String result="";
        PreparedStatement stm =null;
        int i=1;
        try {
            String sql = "select count(ID) as number, Year(examination_date) as Year,Month(examination_date) as Month from Reservation\n"
                    + "group by Year(examination_date),Month(examination_date)\n"
                    + "Order by Year(examination_date)";

            stm= connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                int month = rs.getInt(3);
                int yearDB= rs.getInt(2);
                int numberOfReser=rs.getInt(1);
                if(yearDB==year&&i==month){
                    i++;
                    result = result + numberOfReser +",";
                }else{
                    while(yearDB==year&&i!=month){
                        result += "0,";
                        i++;
                    }
                    if(yearDB==year&&i==month){
                        result = result + numberOfReser+",";
                    }
                }
            }
            stm.executeUpdate();
        } catch (SQLException e) {
        }finally{
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
    
    
    public void insertConfirmSchedule(int reservationId, int Doctor, int userid, int department_time_hours, int department_time_minutes){
        String sql = "Insert into ConfirmedSchedule(reservation_id,doctor_id,staff_id,time_start) "
                + "values (?,?,?,?);";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, reservationId);
            stm.setInt(2, Doctor);
            stm.setInt(3, userid);
            stm.setString(4, department_time_hours+":"+department_time_minutes);
            stm.executeUpdate();

        } catch (SQLException e) {
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
    public static void main(String[] args) {
        System.out.println(new ReservationDAO().ReserStatistic(2022));
    }

    public Reservation getOne(int id) {
        try {
            //mo ket noi
            String sql = "select * from Reservation where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
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
                return r;
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public List<Reservation> getAllReservationByStatus() {
        List<Reservation> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Reservation] left join MedicalRecord\n"
                    + "on Reservation.ID = MedicalRecord.reservation_id \n"
                    + "Where MedicalRecord.ID IS NULL\n"
                    + "and Reservation.[status] = 2 ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
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
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
    }

}
