/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Naammm
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */ 
    public boolean isValidLogin (String username, String password){
        return username.equals("admin")&&password.equals("12345678");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassWord");
        if(username.trim().length()==0){
            out.println("Please enter username!");
            return;
        }
        if(password.trim().length()==0){
            out.println("Please enter password!");
            return;
        }
        if(password.trim().length()<8){
            out.println("Password must be greater than 8!");
            return;
        }
        if(isValidLogin(username, password)){
            // Sử dụng RequestDispatcher để chuyển tiếp yêu cầu đến trang "search.html"
            // Ưu điểm: URL trên trình duyệt không thay đổi, chỉ xử lý nội bộ trong server
            RequestDispatcher rd = request.getRequestDispatcher("search.html");
            rd.forward(request, response);
        }else{
            // Sử dụng RequestDispatcher để chuyển tiếp yêu cầu đến trang "invalid.html"
            // Không sử dụng sendRedirect để tránh URL bị thay đổi và không cần gửi yêu cầu mới từ client
            // response.sendRedirect("invalid.html"); // Dòng này bị comment vì không cần sử dụng redirect ở đây
            RequestDispatcher rd = request.getRequestDispatcher("invalid.html");
            rd.forward(request, response);
        }
        
    }
    //RequestDispatcher:
    //
    //  Phù hợp khi cần chuyển yêu cầu đến một trang nội bộ (như search.html hoặc invalid.html trong đoạn code của bạn).
    //  Không làm lộ URL thực.
    
    //sendRedirect:
    //
    //Phù hợp khi muốn điều hướng đến một trang khác hoàn toàn (như một trang xác thực ở ứng dụng khác).
    //URL trình duyệt sẽ thay đổi, giúp dễ dàng bookmark trang hoặc chia sẻ URL.
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
