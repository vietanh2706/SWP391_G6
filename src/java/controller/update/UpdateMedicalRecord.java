/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.update;

import dal.ENTDAO;
import dal.EyeRecordDAO;
import dal.InternalRecordDAO;
import dal.MaxillofacialRecordDAO;
import dal.MedicalRecordDAO;
import dal.PhysicalRecordDAO;
import dal.ReservationDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecord;
import model.Reservation;
import model.Type;

/**
 *
 * @author Duc Anh
 */
@WebServlet(name = "update_medical_record", urlPatterns = {"/update_medical_record"})
public class UpdateMedicalRecord extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        int id = Integer.parseInt(request.getParameter("id"));
        Reservation re = new ReservationDAO().getOne(id);

        ArrayList<Type> type = new ArrayList<>();
        // lấy ra hết những type mà patient đã chọn trong reservation
        type = new TypeDAO().getAllByReservation(re);

        System.out.println(code);
        //truyền sang jsp
        request.setAttribute("type", type);
        request.setAttribute("re", re);
        request.setAttribute("code", code);
        request.getRequestDispatcher("view/update-medical-record.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String select = request.getParameter("select");
        if (select == null) {
            select = "-1";
        } else {
            Integer.parseInt(select);
        }
        String code = request.getParameter("code");

        Reservation re = new ReservationDAO().getOne(id);
        ArrayList<Type> type = new ArrayList<>();
        type = new TypeDAO().getAllByReservation(re);
        System.out.println(code);
        for (Type type_id : type) {
            if (type_id.getId() == 1) {
                request.setAttribute("internal", new InternalRecordDAO().getInternalRecord(code));
            }
            if (type_id.getId() == 2) {
                request.setAttribute("eye", new EyeRecordDAO().getEyeRecord(code));
            }
            if (type_id.getId() == 3) {
                request.setAttribute("ent", new ENTDAO().getEntRecord(code));
            }
            if (type_id.getId() == 4) {
                request.setAttribute("physical", new PhysicalRecordDAO().getPhysicalRecord(code));
            }
            if (type_id.getId() == 5) {
                request.setAttribute("maxillo", new MaxillofacialRecordDAO().getMaxillofacialRecord(code));
            }
        }

        request.setAttribute("type", type);
        request.setAttribute("re", re);
        request.setAttribute("select", select);
        request.setAttribute("code", code);
        request.setAttribute("mr", new MedicalRecordDAO().getMRbyCodeID(code, re.getId()));
        request.getRequestDispatcher("view/update-medical-record.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
