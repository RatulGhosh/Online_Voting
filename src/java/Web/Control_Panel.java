package Web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Control_Panel extends HttpServlet {

    String[] menu = {"HOME", "CONTACT", "DELETE USERS", "ACTIVATE", "RESET", "RESTART WEB","CHANGE PASSWORD", "LOGOUT"};
    String[] link = {"", "", "", "", "", "","change_password.html", "LogOut"};

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        /*out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Control_Panel</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet Control_Panel at " + request.getContextPath() + "</h1>");
        out.println("</body>");
        out.println("</html>");*/
        
        HttpSession s = request.getSession(false);
       

        if (s != null) {
            String u = (String) s.getAttribute("uid");

            out.print("<h2 align=center>ADMIN CONTROL PANEL</h2>");
            out.print("<hr>");
            out.print("<center>");
            for (int i = 0; i < menu.length; i++) {
                out.print("<a href='" + link[i] + "'>" + menu[i] + "</a> |");
            }
            out.print("<center>");
            String dm = (String) request.getAttribute("msg");
            out.print("<hr>" + dm + "<h4>");
            out.print("WELCOME " + u);
            out.print("</h4>");
            out.println("<br><br><br><br>");
            ServletConfig cfg = getServletConfig();
            String am = cfg.getInitParameter("email");
            out.println("ADMIN EMAIL : " + am);

            ServletContext ctx = getServletContext();
            String copy = ctx.getInitParameter("crs");
            out.println("<br>COPYRIGHT : " + copy);
        } else {
            out.println("Please login to access CP");
            out.println("<br>");
            out.println("<a href=login.html>GO TO LOGIN</a>");
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
