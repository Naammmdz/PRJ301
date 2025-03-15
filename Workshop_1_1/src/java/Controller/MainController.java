/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private ProjectDAO pdao = new ProjectDAO();
    
    private static final String LOGIN_PAGE = "login.jsp";
    
    protected String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        
        String strUserName = request.getParameter("txtUserName");
        String strPassword = request.getParameter("txtPassword");
        if(AuthUtils.isValidLogin(strUserName, strPassword)){
            url ="Management.jsp";
            UserDTO user = AuthUtils.getUser(strUserName);
            request.getSession().setAttribute("user", user);
            // search
//            processSearch(request, response);
            response.sendRedirect("DashboardController");
        }else if (AuthUtils.getUser(strUserName) == null){
            url = LOGIN_PAGE;
            request.setAttribute("toastMessage", "Tài khoản không tồn tại!");
            request.setAttribute("toastType", "error");
        }else{
            url = LOGIN_PAGE;
            request.setAttribute("toastMessage", "Sai mật khẩu!");
            request.setAttribute("toastType", "warning");
        }
        return url;
    }
    
    protected String processLogout(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String url = LOGIN_PAGE;

        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate(); // Hủy bỏ session
            url =  LOGIN_PAGE;
        }
        return url;
    }
    
    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "Management.jsp";
        HttpSession session = request.getSession();
        
        if (AuthUtils.isAdmin(session)) {
            String searchTerm = request.getParameter("searchTerm");
            if(searchTerm==null){
                searchTerm = "";
            }
            List<ProjectDTO> pjs = pdao.searchByTitle2(searchTerm);
            request.getSession().setAttribute("projects", pjs);
            request.getSession().setAttribute("searchTerm", searchTerm);
        } else {
             List<ProjectDTO> pjs = pdao.searchByTitle2("");
            request.getSession().setAttribute("projects", pjs);
        }
        return url;
    }
    
    public String processCreate(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
         String url = LOGIN_PAGE;
         HttpSession session = request.getSession();
         
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;

                String projectName = request.getParameter("project_name");
                String description = request.getParameter("Description");
                String status = request.getParameter("Status");
                String estimatedLaunchStr = request.getParameter("estimated_launch");

                if (projectName == null || projectName.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("project_name_error", "Project name cannot be empty.");
                }
                if (status == null || status.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("project_status_error", "Project status cannot be empty.");
                }
                Date estimated_launch = null;
                if (estimatedLaunchStr != null && !estimatedLaunchStr.isEmpty()) {
                    estimated_launch = Date.valueOf(estimatedLaunchStr);
                } else {
                    checkError = true;
                    request.setAttribute("estimated_launch_error", "Estimated launch date is required.");
                }

                ProjectDTO project = new ProjectDTO(0, projectName, description, status, estimated_launch);

                if (!checkError) {
                    pdao.create(project);
                    // search
                    processSearch(request, response);
                    response.sendRedirect("Management.jsp");
                } else {
                    url = "Management.jsp";
                    request.setAttribute("project", project);
                    request.setAttribute("open", "open");
                }
            } catch (Exception e) {
            }
        }
        return url;
    }
    
    public String processUpdate(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
         String url = LOGIN_PAGE;
         HttpSession session = request.getSession();
         if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;

                int projectId = Integer.parseInt(request.getParameter("project_id_update"));
                String projectName = request.getParameter("project_name_update");
                String description = request.getParameter("Description_update");
                String status = request.getParameter("Status_update");
                String estimatedLaunchStr = request.getParameter("estimated_launch_update");

                if (projectName == null || projectName.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("project_name_update_error", "Project name cannot be empty.");
                }
                if (status == null || status.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("project_status_update_error", "Project status cannot be empty.");
                }
                Date estimated_launch = null;
                if (estimatedLaunchStr != null && !estimatedLaunchStr.isEmpty()) {
                    estimated_launch = Date.valueOf(estimatedLaunchStr);
                } else {
                    checkError = true;
                    request.setAttribute("estimated_launch__update_error", "Estimated launch date is required.");
                }

                ProjectDTO project = new ProjectDTO(projectId, projectName, description, status, estimated_launch);

                if (!checkError) {
                    pdao.update(project);
                    // search
                    processSearch(request, response);
                    request.getSession().setAttribute("toastMessageUpdate", "Updated successfully");
                    request.getSession().setAttribute("toastTypeUpdate", "success");
                    response.sendRedirect("Management.jsp");
                } else {
                    url = "Management.jsp";
                    request.setAttribute("project_update", project);
                    request.getSession().setAttribute("open_update", "open");
                }
            } catch (Exception e) {
            }
        }
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: "+ action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                }else  if (action.equals("logout")) {
                    url = processLogout(request, response);
                }
//                } else if (action.equals("search")) {
//                    // search
//                    url = processSearch(request, response);
//                } else if (action.equals("create")){
//                    url = processCreate(request, response);
//                } else  if (action.equals("delete")) {
//                    String id = request.getParameter("id");
//                    pdao.delete(id);
//                    // search
//                    processSearch(request, response);
//                    url = "Management.jsp";
//                } else  if (action.equals("update")) {
//                    url = processUpdate(request, response);
//                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            if (!response.isCommitted()) {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
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

}
