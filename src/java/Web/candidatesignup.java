package Web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class candidatesignup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String name = request.getParameter("name");
            name = name.replace("'", "\\'");

            String password = request.getParameter("pass");
            password = password.replace("'", "\\'");

            String t = request.getParameter("age");
            int age = Integer.parseInt(t);

            String promise = request.getParameter("promise");

            String gender = request.getParameter("gender");

            String academics = request.getParameter("academics");

            String q = "insert into candidate (name,pass,age,education,gender,promise) values('" + name + "','" + password + "','" + age + "','" + academics + "','" + gender + "','" + promise + "');";

            int ur = jdbcdao.DAOLayer.updateData(q);
            if (ur > 0) {
                String st = "Data Successfully Saved<br>Login to continue";
                request.setAttribute("msg", st);
                RequestDispatcher rd = request.getRequestDispatcher("candidatelogin.jsp");
                rd.include(request, response);

            }

        } catch (Exception e) {
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
