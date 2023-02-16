package controller.update;

import dal.MaxillofacialRecordDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Type;

/**
 *
 * @author asus
 */
@WebServlet(name = "UpdateMaxillo", urlPatterns = {"/update-maxillo"})
public class UpdateMaxilloServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateMaxillo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateMaxillo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MaxillofacialRecordDAO dao = new MaxillofacialRecordDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int select = Integer.parseInt(request.getParameter("select"));
        String upper = request.getParameter("upper");
        String lower = request.getParameter("lower");
        String dental = request.getParameter("dental");
        String code = request.getParameter("code");
        Type type = new Type();
        type = new TypeDAO().getOne(select);
        dao.updateMaxillo(code,upper,lower,dental);
        response.sendRedirect("update_medical_record?id=" + id+"&code="+code);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
