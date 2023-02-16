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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;
import model.User;

/**
 *
 * @author Duc Anh
 */
public class ServiceDAO extends DBContext {

    private PreparedStatement pre;
    private ResultSet rs;

    public ArrayList<Service> getListService() {
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "select * from Service";
            pre = connection.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                User u = new User();
                u = new UserDAO().getUserByUserId(rs.getInt(4));
                Service s = new Service(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3), u,
                        rs.getString(5));
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        ArrayList<Service> s = new ArrayList<>();
        s = new ServiceDAO().getListService();
        for (Service service : s) {
            System.out.println(service);
        }

    }
}
