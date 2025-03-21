/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.ExamCategoryDAO;
import dao.ExamDAO;
import dto.ExamCategoryDTO;
import dto.ExamDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author Naammm
 */
@WebServlet(name = "CreateExamController", urlPatterns = {"/CreateExamController"})
public class CreateExamController extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                String action = request.getParameter("action");
                String examTitle = request.getParameter("examTitle");
                String subject = request.getParameter("subject");
                String categoryName = request.getParameter("categoryName");
                int totalMarks = Integer.parseInt(request.getParameter("totalMarks"));
                int duration = Integer.parseInt(request.getParameter("duration"));

                ExamDAO examDAO = new ExamDAO();
                ExamCategoryDAO ecdao = new ExamCategoryDAO();

                ExamCategoryDTO examCategory = ecdao.readByName(categoryName);
                boolean success = examDAO.create(new ExamDTO(0, examTitle, subject, examCategory.getCategoryId(), totalMarks, duration));

                if (success) {
                    response.sendRedirect("DashboardController");
                }
            } catch (Exception e) {
            }
        } else{
            response.sendRedirect("DashboardController");
        }
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
