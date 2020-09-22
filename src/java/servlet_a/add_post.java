
package servlet_a;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class add_post extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        String title=request.getParameter("title");
        String company=request.getParameter("company");
        String address=request.getParameter("address");
        String type=request.getParameter("type");
        String salary=request.getParameter("salary");
        String description=request.getParameter("description");
        String email=request.getParameter("email");
        String closedate=request.getParameter("closedate");
        
        bean item = new bean();
        item.setTitle(title);
        item.setCompany(company);
        item.setAddress(address);
        item.setType(type);
        item.setSalary(salary);
        item.setDescription(description);
        item.setEmail(email);
        item.setClosedate(closedate);
        HttpSession session=request.getSession();  
        int user=(int) session.getAttribute("user");
        
        add_db indb = new add_db(item);
        indb.addDb(user);
        
        response.sendRedirect("member.jsp");
 
        
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
