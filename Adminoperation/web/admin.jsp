<%-- 
    Document   : admin
    Created on : Oct 21, 2016, 1:33:34 PM
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
        
        
        
        <%String admin_name = (String) session.getAttribute("name");%>
        <div id="big_wrapper">            
            <center><h2> Welcome <%= admin_name %>!! </h2></center> <br /> <br />
            <form name="admin" action="Controller" method="post">
                 <div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div>
                <nav id="links"> 
                    <ul>                        
                        <li> <a href="admin_insert.jsp" title="Insert" > <img id="insert"  border="0" src="Images/insert1.jpg" width="75" height="75" alt="Loading" /> </a> </li>
                        <li> <a href="admin_update.jsp" title="Update" > <img id="insert"  border="0" src="Images/update.png" width="75" height="75" alt="Loading" /> </a> </li>
                        <li> <a href="admin_remove.jsp" title="Delete" > <img id="insert"  border="0" src="Images/delete_1.png" width="75" height="75" alt="Loading" /> </a> </li>                    
                        <li> <a href="admin_view_all.jsp" title="View" > <img id="insert"  border="0" src="Images/view.png" width="75" height="75" alt="Loading" /> </a> </li>                    
                    </ul>
                </nav>
                <form>
                    </div>
                    </body>
                    </html>
