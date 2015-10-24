
package jdbcdao;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class DAOLayer {
    private static Connection con;//static to prevent multiple connections for different classes
    
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/hpstp15";
            String user = "root";
            String pwd = "givemefreedom";
            con = DriverManager.getConnection(url,user,pwd);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Connection Error : "+ex.getMessage());
        }
    }
    public static Connection getConnection()
    {
        return con;
    }
    
    public static  int updateData(String dmlQuery)
    {
        try {
            Statement st = con.createStatement();
            int ur = st.executeUpdate(dmlQuery);
            return ur;
        } catch (SQLException ex) {
            Logger.getLogger(DAOLayer.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public static ResultSet selectData(String projectionQuery)
    {
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(projectionQuery);
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DAOLayer.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
}
