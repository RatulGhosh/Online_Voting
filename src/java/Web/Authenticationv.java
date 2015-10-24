package Web;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

public class Authenticationv extends ActionSupport implements ServletRequestAware {

    HttpServletRequest req;
    String name;
    String pass;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        req = hsr;
        //throw new UnsupportedOperationException("Not supported yet.");

    }

    public HttpServletRequest getReq() {
        return req;
    }

    public void setReq(HttpServletRequest req) {
        this.req = req;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String execute() throws Exception {

        try {

            String q = "Select *from voter where name='" + name + "' and pass='" + pass + "'";
            //out.println(q);
            ResultSet rs = jdbcdao.DAOLayer.selectData(q);
            if (rs.next()) {
                String message = "Welcome " + rs.getString(2);
                req.setAttribute("msg", message);
                return SUCCESS;

            } else {
                req.setAttribute("msg","INVALID USER NAME OR PASSWORD");
                return ERROR;
            }

        } catch (Exception e) {
            return ERROR;

        }

    }
}
