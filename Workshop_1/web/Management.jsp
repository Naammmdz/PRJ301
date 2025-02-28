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
        <h2>Welcome, <%= user.getName()%>!</h2>
        <div class="container">
            <div class="admin-control">
                <div class="admin-control-left">
                    <select name="status">
                        <option>All</option>
                        <option>Ideation</option>
                        <option>Development</option>
                        <option>Launch</option>
                        <option>Scaling</option>
                    </select>
                </div>
                <%
                    String searchTerm = request.getAttribute("searchTerm")+"";
                    searchTerm= searchTerm.equals("null")?"":searchTerm;
                %>
                <div class="admin-control-center">
                    <form action="MainController" class="form-search">        
                        <input type="hidden" name="action" value="search"/>
                        <input type="text" class="form-search-input" placeholder="Tìm kiếm tên món..." name="searchTerm" value="<%=searchTerm%>">
                        <span class="search-btn"><i class="ri-search-line"></i></span>
                    </form>
                </div>
                <div class="admin-control-right">
                    <button class="btn-control-large" id="btn-add-product"><i class="ri-add-line"></i> Create New Project</button>                  
                </div>
            </div>
            
            <%
                if (request.getAttribute("projects") != null) {
                    List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("projects");

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
                                <td>Action</td>
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
                            <td><a href="MainController?action=update&id=<%=p.getProjectId()%>&searchTerm=<%=searchTerm%>">
                                    <img src="assets/img/file-edit-line.png" style="height: 20px"/>
                                
                            </a></td>
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
        
        <div class="modal create ">
            <div class="modal-container">
                <h3 class="modal-container-title add-account-e">CREATE NEW PROJECT</h3>
<!--                <h3 class="modal-container-title edit-account-e">EDIT PROJECT</h3>-->
                <button class="modal-close"><i class="ri-close-line"></i></button>
                <div class="form-content sign-up">
                    <form action="MainController" class="create-form">
                        <input type="hidden" name="action" value="create"/>
                        <div class="form-group">
                            <label class="form-label">Project name</label>
                            <input name="project_name" type="text" class="form-control">
                            <span class="form-message-name form-message"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Description</label>
                            <textarea class="project-desc" name="Description"></textarea>
                            <span class="form-message-desc form-message"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <select name="Status">
                                <option>Ideation</option>
                                <option>Development</option>
                                <option>Launch</option>
                                <option>Scaling</option>
                            </select>
                            <span class="form-message-status form-message"></span>
                        </div>   
                        <div class="form-group edit-account-e">
                            <label class="form-label">Estimated launch</label>
                            <input name="estimated_launch" type="date" class="form-control">
                        </div>
                        <button class="form-submit add-account-e">Create</button>
<!--                        <button class="form-submit edit-account-e" id="btn-update-account"><i class="fa-regular fa-floppy-disk"></i> Lưu thông tin</button>-->
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
