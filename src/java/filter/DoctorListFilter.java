/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author User
 */
@WebFilter(filterName = "DoctorListFilter", urlPatterns = {"/doctorlist"})
public class DoctorListFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        User u = (User) session.getAttribute("acc");
        String url = request.getParameter("url");
        if(u == null){
            httpResponse.sendRedirect("components/accessdenied.jsp");
        }else if(url.equals("client") && (u.getRole_id() == 1 || u.getRole_id() == 3)){
            httpResponse.sendRedirect("components/accessdenied.jsp");
        }else if(url.equals("admin")&&(u.getRole_id()==3)){
            httpResponse.sendRedirect("components/accessdenied.jsp");
        }
        else{
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
    
}
