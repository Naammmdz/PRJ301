<%-- 
    Document   : Management
    Created on : Feb 28, 2025, 2:31:13 AM
    Author     : Naammm
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Management</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css">
        <link rel="stylesheet" href="assets/css/management.css"> 
    </head>
    <body>
        <%  if (session.getAttribute("user") != null) {
            UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <header class="header">
            <div class="header-left">
                <h2 class="welcome-text">Welcome, <%= user.getName()%>!</h2>
            </div>
            <div class="header-right">
                <form action="MainController" method="POST">
                    <button type="submit" name="action" value="logout" class="btn-logout"><i class="ri-logout-box-line"></i> Logout</button>
                </form>
            </div>           
        </header>

            
            
        <div class="container">
            <% if (user.getRole().equals("Team Member")) { %>
                <div class="admin-control">
            <% } else { %>
                <div class="admin-control open">
            <% } %>
<!--                <div class="admin-control-left">
                    <select name="status">
                        <option>All</option>
                        <option>Ideation</option>
                        <option>Development</option>
                        <option>Launch</option>
                        <option>Scaling</option>
                    </select>
                </div>-->
                <%
                    String searchTerm = session.getAttribute("searchTerm")+"";
                    searchTerm= searchTerm.equals("null")?"":searchTerm;
//                    session.removeAttribute("searchTerm");
                %>
                <div class="admin-control-center">
                    <form action="MainController" class="form-search" method="GET">        
                        <input type="hidden" name="action" value="search"/>
                        <input type="text" class="form-search-input" placeholder="Search project..." name="searchTerm" value="<%=searchTerm%>">
                        <span class="search-btn"><i class="ri-search-line"></i></span>
                    </form>
                </div>
                <div class="admin-control-right">
                    <button class="btn-control-large" id="btn-add-project"><i class="ri-add-line"></i> Create New Project</button>                  
                </div>
            </div>
            
            <%
                if (session.getAttribute("projects") != null) {
                    List<ProjectDTO> projects = (List<ProjectDTO>) session.getAttribute("projects");

            %>
            <div  class="table">
                    <table width="100%">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Project Name</td>
                                <td>Description</td>
                                <td>Status</td>
                                <td>Estimated Launch</td>
                                <% if (user.getRole().equals("Founder")) { %>
                                    <td>Action</td>
                                <% }%>
                                
                            </tr>
                        </thead>
                        
                        <tbody >
                        <%for (ProjectDTO p : projects) {
                            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                        %>   
                        <tr>
                            <td><%=p.getProjectId()%></td>
                            <td><%=p.getProjectName()%></td>
                            <td><%=p.getDescription()%></td>
                            <td><%=p.getStatus()%></td>
                            <td><%=sdf.format(p.getEstimatedLaunch())%></td>
                            <% if (user.getRole().equals("Founder")) { %>
                                <td>
                                    <a class="btn-edit-project" 
                                        data-id="<%= p.getProjectId()%>"
                                        data-name="<%= p.getProjectName()%>"
                                        data-description="<%= p.getDescription()%>"
                                        data-status="<%= p.getStatus()%>"
                                        data-launch="<%= p.getEstimatedLaunch()%>">
                                        <img src="assets/img/file-edit-line.png" style="height: 20px"/>
                                    </a>
                                    <a href="MainController?action=delete&id=<%=p.getProjectId()%>&searchTerm=<%=searchTerm%>">
                                        <img src="assets/img/delete-bin-line.png" style="height: 20px"/>
                                    </a>
                                </td>
                            <% }%>

                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
            </div>
        </div>
        <%    }
            } else { %>
            <div class="access-denied-section">
                <img class="access-denied-img" src="assets/img/access-denied.webp" alt="">
            </div>
        <% 
            }
        %>
        
        
        <%  String messageNameError = request.getAttribute("project_name_error")+"";
            messageNameError= messageNameError.equals("null")?"":messageNameError;
            String messageDateError = request.getAttribute("estimated_launch_error")+"";
            messageDateError= messageDateError.equals("null")?"":messageDateError;
            String open = request.getAttribute("open")+"";
            open= open.equals("null")?"":open;
            
            ProjectDTO pdto = new ProjectDTO();
            try {
                pdto = (ProjectDTO) request.getAttribute("project");
            } catch (Exception e) {
                pdto = new ProjectDTO();
            }
            if (pdto == null) {
                pdto = new ProjectDTO();
            }
        %>
        <div class="modal add-project  <%=open%>">
            <div class="modal-container">
                <h3 class="modal-container-title add-project-e">CREATE NEW PROJECT</h3>
                <button class="modal-close"><i class="ri-close-line"></i></button>
                <div class="form-content">
                    <form action="MainController" class="create-form" method="POST">
                        <input type="hidden" name="action" value="create"/>
                        <div class="form-group">
                            <label class="form-label">Project name</label>
                            <input name="project_name" type="text" class="form-control" value="<%=pdto.getProjectName()%>">
                            <span class="form-message"><%=messageNameError%></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Description</label>
                            <textarea class="project-desc" name="Description" ><%=pdto.getDescription()%></textarea>
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <select name="Status">
                                <option><%=pdto.getStatus()%></option>
                                <option>Ideation</option>
                                <option>Development</option>
                                <option>Launch</option>
                                <option>Scaling</option>
                            </select>
                            <span class="form-message"></span>
                        </div>   
                        <div class="form-group">
                            <label class="form-label">Estimated launch</label>
                            <input name="estimated_launch" type="date" class="form-control">
                            <span class="form-message"><%=messageDateError%></span>
                        </div>
                        <button class="form-submit">Create</button>
                    </form>
                </div>
            </div>
        </div>
        <%  String messageUpdateNameError = request.getAttribute("project_name_update_error")+"";
            messageUpdateNameError= messageUpdateNameError.equals("null")?"":messageUpdateNameError;
            String messageUpdateDateError = request.getAttribute("estimated_launch__update_error")+"";
            messageUpdateDateError= messageUpdateDateError.equals("null")?"":messageUpdateDateError;
            String open_update = session.getAttribute("open_update")+"";
            session.removeAttribute("open_update");
            open_update= open_update.equals("null")?"":open_update;
            
            ProjectDTO pUP = new ProjectDTO();
            try {
                pUP = (ProjectDTO) request.getAttribute("project_update");
            } catch (Exception e) {
                pUP = new ProjectDTO();
            }
            if (pUP == null) {
                pUP = new ProjectDTO();
            }
        %>                        
        <div class="modal edit-project  <%=open_update%>">
            <div class="modal-container">
                <h3 class="modal-container-title edit-project-e">EDIT PROJECT</h3>
                <button class="modal-close"><i class="ri-close-line"></i></button>
                <div class="form-content">
                    <form action="MainController" class="create-form" method="POST">
                        <input type="hidden" name="action" value="update"/>
                        <input name="project_id_update" type="text" style="display: none" value="<%=pUP.getProjectId()%>">
                        <div class="form-group">
                            <label class="form-label">Project name</label>
                            <input name="project_name_update" type="text" class="form-control" value="<%=pUP.getProjectName()%>">
                            <span class="form-message"><%=messageUpdateNameError%></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Description</label>
                            <textarea class="project-desc" name="Description_update"><%=pUP.getDescription()%></textarea>
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <select name="Status_update">
                                <option><%=pUP.getStatus()%></option>
                                <option>Ideation</option>
                                <option>Development</option>
                                <option>Launch</option>
                                <option>Scaling</option>
                            </select>
                            <span class="form-message"></span>
                        </div>   
                        <div class="form-group">
                            <label class="form-label">Estimated launch</label>
                            <input name="estimated_launch_update" type="date" class="form-control">
                            <span class="form-message"><%=messageUpdateDateError%></span>
                        </div>
                        <button class="form-submit">Update</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="assets/js/main.js"></script>
    </body>
</html>
