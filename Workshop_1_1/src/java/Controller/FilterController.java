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
import java.util.List;
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
@WebServlet(name = "FilterController", urlPatterns = {"/FilterController"})
public class FilterController extends HttpServlet {

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
        String categoryName = request.getParameter("txtCategoryName");
        System.out.println(categoryName);

        ExamDAO edao = new ExamDAO();
        ExamCategoryDAO ecdao = new ExamCategoryDAO();
        if (categoryName.equals("All") || categoryName==null) {
            List<ExamCategoryDTO> examcategoryList = ecdao.readAll();
            List<ExamDTO> examList = edao.readAll();
            request.setAttribute("examcategoryList", examcategoryList);
            request.setAttribute("examList", examList);
        } else {
            ExamCategoryDTO examCategory = ecdao.readByName(categoryName);
            List<ExamDTO> examList = edao.readByCategoryId(examCategory.getCategoryId());
            List<ExamCategoryDTO> examcategoryList = ecdao.readAll();

            request.setAttribute("examcategoryList", examcategoryList);
            request.setAttribute("examList", examList);
        }

        request.setAttribute("activeExam", "active");
//        request.setAttribute("hiddenExam", "hidden");
        request.setAttribute("hiddenCategory", "hidden");
        request.setAttribute("hiddenCreate", "hidden");
//        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
        if (!response.isCommitted()) {
                RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
                rd.forward(request, response);
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
