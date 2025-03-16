/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.ExamDAO;
import dao.QuestionDAO;
import dto.ExamDTO;
import dto.QuestionDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "TakeExamController", urlPatterns = {"/TakeExamController"})
public class TakeExamController extends HttpServlet {

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
        if (AuthUtils.isLoggedIn(session)) {
            String method = request.getMethod();
            if ("GET".equalsIgnoreCase(method)) {
                handleGet(request, response);
            } else if ("POST".equalsIgnoreCase(method)) {
                handlePost(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Phương thức không được hỗ trợ");
            }
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
    private void handleGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            String examId = request.getParameter("examId");
            
            if (examId == null) {
                response.sendRedirect("DashboardController");
                return;
            }
            
            ExamDAO examDAO = new ExamDAO();
            ExamDTO exam = examDAO.readById(examId);
            
            QuestionDAO questionDAO = new QuestionDAO();
            List<QuestionDTO> questionList = questionDAO.getQuestionsByExamId(examId);
            
            request.setAttribute("exam", exam);
            request.setAttribute("questionList", questionList);
            request.getRequestDispatcher("exam_detail.jsp").forward(request, response);
        }
    }

    private void handlePost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            int examId = Integer.parseInt(request.getParameter("examId"));
            String[] questionTexts = request.getParameterValues("questionText[]");
            String[] optionsA = request.getParameterValues("optionA[]");
            String[] optionsB = request.getParameterValues("optionB[]");
            String[] optionsC = request.getParameterValues("optionC[]");
            String[] optionsD = request.getParameterValues("optionD[]");
            String[] correctOptions = request.getParameterValues("correctOption[]");

            List<QuestionDTO> questions = new ArrayList<>();
            for (int i = 0; i < questionTexts.length; i++) {
                questions.add(new QuestionDTO(0, examId, questionTexts[i], optionsA[i], optionsB[i], optionsC[i], optionsD[i], correctOptions[i]));
            }

            QuestionDAO questionDAO = new QuestionDAO();
            boolean success = questionDAO.createMultiple(questions);

            if (success) {
                response.sendRedirect("DashboardController");
            }
        } catch (Exception e) {
        }
    }
}
