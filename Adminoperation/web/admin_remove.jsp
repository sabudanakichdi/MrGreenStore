<%-- 
    Document   : admin
    Created on : Oct 24, 2016, 11:46:34 PM
    Author     : green
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="green.css" type="text/css" >
    </head>
    <body>
        
        

        <% String classifier_name = "none";
            session.setAttribute("admin_mode", "remove");
            String db_deletion_result = (String) session.getAttribute("db_deletion_result");
         //   out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
         //   out.println("db_deletion_result = " + db_deletion_result);
            if ((String) session.getAttribute("classifier_name") != null) {
                classifier_name = (String) session.getAttribute("classifier_name");
            //    out.println("Classifier name selected = " + classifier_name);
            }%>


        <div id="big_wrapper">            
            <center><h2> Welcome Admin!! </h2></center> <br /> <br />
            <form name="admin" action="Controller" method="post">
                 <div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div>
                <nav id="links"> 
                    <ul>                        
                        <li> <a href="admin_insert.jsp" title="Insert" > <img id="insert"  border="0" src="Images/insert1.jpg" width="25" height="25" alt="Loading" /> </a> </li>
                        <li> <a href="admin_update.jsp" title="Update" > <img id="update"  border="0" src="Images/update.png" width="25" height="25" alt="Loading" /> </a> </li>
                        <li> <a href="admin_remove.jsp" title="Delete"> <img id="delete"  border="0" src="Images/delete_1.png" width="75" height="75" alt="Loading" /> </a> </li>                    
                        <li> <a href="admin_view_all.jsp" title="View" > <img id="view"  border="0" src="Images/view.png" width="25" height="25" alt="Loading" /> </a> </li>          
                    </ul>
                </nav>
                <center>      <br /><h3> Select a product to remove </h3> <br />  
                    <% if(db_deletion_result!=null){if(db_deletion_result.equals("success")){%>
                     <span style="color:green">  <b> Deletion Successful!!  </b> </span> 
                     <% } if(db_deletion_result.equals("failure")) { %>
                     <span style="color:red">  <b> Deletion Failure! Please try again!   </b> </span> 
                     <% }} %>
                     <br /> <br />
                    <select name="admin_classifer_choice">
                        <option value=""> </option>
                        <option value="product"> product </option> 
                        <option value="Coupons"> Coupons </option>
                        <option value="Orders"> Orders </option> 
                    </select> 
                    <input type="submit"  value =" > " name="admin_catagory" /> <br /> <br /> 
                    <div id="admin_mode"> </div>
                    <% if ((String) session.getAttribute("classifier_name") != null) {
                         classifier_name = (String) session.getAttribute("classifier_name");%>      
                    Catogory Selected : <span style="color:green">  <b> <%= classifier_name%> </b> </span>

                    <% }%>      <br /> <br />
                    <% if (classifier_name != null || classifier_name != "") {%>
                    Id  &nbsp; &nbsp; <input type="radio" name="admin_radio_delete" value="id"/>  &nbsp; &nbsp;
                    Name &nbsp; <input type="radio" name="admin_radio_delete" value="name" /> <br />  <br />                    
                    Id/Name <input type="text"  name="admin_id_or_name" />
                    <input type="submit" value="  Delete  " name="admin_db_delete" />
                    <% }%>
                </center>
                <br /> <br />
                <form>
                    </div>
                    </body>
                    </html>
