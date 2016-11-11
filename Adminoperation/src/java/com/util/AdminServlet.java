package com.util;
//import com.util.validate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    int total_cart_items = 0;
    SessionBean bean = new SessionBean();
    HashMap map = new HashMap();
    ArrayList list = new ArrayList();
    ArrayList products_in_cart_list = new ArrayList();
    ArrayList quantities_in_cart = new ArrayList();
    ArrayList user_product_name = new ArrayList();
    CartDetails mycart = new CartDetails();
    ProductDetails sessionbean = new ProductDetails();
    Query queryObject = new Query();
    HashMap authentication_status_map = new HashMap();
    //ProductDetails productdetails = (ProductDetails) queryObject.getProductDetails();  //initializing productdetails object. //neeed to uncomment this line...

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        try {
            out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login_name;
        String login_password;
        String registration_username;
        String registration_password;
        String registration_emailaddress;
        boolean result;
        String username_exists;
        RequestDispatcher rd;
        HttpSession session = request.getSession(true);
        session.setAttribute("Order_Confirmation", null);

        // Case for logout!

        if (request.getParameter("signout") != null) {
            System.out.println("Reached log out in the controller!!");
            //Query.clearSession();            
            session.setAttribute("authentication", null);
            session.removeAttribute("authentication"); //clearing the authentication
            session.setAttribute("name", null); // clearing the session name
            session.removeAttribute("product_name");
            session.removeAttribute("productname");
            session.removeAttribute("db_insertion_result");
            session.removeAttribute("db_deletion_result");
            session.removeAttribute("db_update_result");            
            session.removeAttribute("productdescription");
            session.removeAttribute("brandname");
            session.removeAttribute("productprice");
            session.removeAttribute("quantity_in_cart");
            session.setAttribute("product_in_cart",null);
            session.removeAttribute("product_in_cart");
            session.setAttribute("classifier_name", null);
            session.removeAttribute("classifier_name");
            total_cart_items = 0;
            session.removeAttribute("total_cart_items");
            response.setHeader("Cache-Control", "no-store"); //when you hit back, it displays "Confirm page Submission"
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }
    
if (request.getParameter("admin_catagory") != null) {
            String classifier_name = (String) request.getParameter("admin_classifer_choice");
            System.out.println("the product selected by admin is = " + classifier_name);
            session.setAttribute("classifier_name", classifier_name);

            String admin_mode = (String) session.getAttribute("admin_mode");
            if (admin_mode.equals("insert")) {
                rd = request.getRequestDispatcher("/admin_insert.jsp");
                rd.forward(request, response);
            }
            if (admin_mode.equals("update")) {
                rd = request.getRequestDispatcher("/admin_update.jsp");
                rd.forward(request, response);
            }
            if (admin_mode.equals("remove")) {
                rd = request.getRequestDispatcher("/admin_remove.jsp");
                rd.forward(request, response);
            }
        }

        //admin db insert/update goes here
        if (request.getParameter("admin_db_changes") != null) {
            String admin_mode = (String) session.getAttribute("admin_mode"); //using admin mode to switch between insert/update
            String classifier_name = (String) session.getAttribute("classifier_name");
            String admin_product_name = request.getParameter("admin_product_name");
            String admin_product_author_store_name = request.getParameter("admin_product_author_store_name");
            String admin_product_description = request.getParameter("admin_product_description");
            String admin_product_price = request.getParameter("admin_product_price");
            if (admin_mode.equals("insert")) {
                String db_insertion_result;
                db_insertion_result = new Query().insert_data_into_db(classifier_name, admin_product_name, admin_product_author_store_name, admin_product_description, admin_product_price);
                session.setAttribute("db_insertion_result", db_insertion_result);
                rd = request.getRequestDispatcher("/admin_insert.jsp");
                rd.forward(request, response);

            }
            if (admin_mode.equals("update")) {
                String db_update_result="";
                String admin_product_id=request.getParameter("admin_product_id");
                db_update_result = new Query().update_data_into_db(classifier_name, admin_product_id, admin_product_name, admin_product_author_store_name, admin_product_description, admin_product_price);
                session.setAttribute("db_update_result", db_update_result);
                rd = request.getRequestDispatcher("/admin_update.jsp");
                rd.forward(request, response);

            }
        }//admin db insertion/update ends here
        
        //admin db remove
        if (request.getParameter("admin_db_delete") != null) {            
            String classifier_name = (String) session.getAttribute("classifier_name");
            String admin_radio_selection = request.getParameter("admin_radio_delete");
            //System.out.println("admin_radio_selection = " + admin_radio_selection);
            String admin_id_or_name = request.getParameter("admin_id_or_name");
            //System.out.println("admin_id_or_name = " + admin_id_or_name);
            String db_deletion_result = "";
            db_deletion_result = new Query().remove_data(classifier_name,admin_radio_selection,admin_id_or_name);
            session.setAttribute("db_deletion_result",db_deletion_result);
            rd = request.getRequestDispatcher("/admin_remove.jsp");
            rd.forward(request, response);
        }//admin db insertion ends here

        //admin view all mode
        if (request.getParameter("admin_view_all_products") != null) {            
            String classifier_name = request.getParameter("admin_classifer_choice");
            session.setAttribute("classifier_name",classifier_name);
            System.out.println("classifier_name from view all = " + classifier_name);
            map = new Query().get_product_info(classifier_name);            
            session.setAttribute("productname", map.get("productname"));
            session.setAttribute("brandname", map.get("brandname"));
            session.setAttribute("productdescription", map.get("productdescription"));
            session.setAttribute("productprice", map.get("productprice"));            
            session.setAttribute("productid", map.get("productid"));            
            rd = request.getRequestDispatcher("/admin_view_all.jsp");
            rd.forward(request, response);            
        }     
}
}
