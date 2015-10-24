package Web;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import java.sql.ResultSet;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.*;
import static org.jboss.weld.context.cache.RequestScopedBeanCache.invalidate;

public class Authenticationa implements SessionAware, ServletRequestAware {

    private HttpServletRequest req;
    private String name;

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
    private String pass;
    private SessionMap<String, Object> sessionMap;

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

    public String execute() throws Exception {

        try {

            String q = "Select *from admin where name='" + name + "' and pass='" + pass + "'";
            //out.println(q);
            ResultSet rs = jdbcdao.DAOLayer.selectData(q);
            if (rs.next()) {
                String message = "Welcome " + rs.getString(2);
                req.setAttribute("msg", message);
                sessionMap.put("logina", "true");
                sessionMap.put("namea", name);
                sessionMap.put("msga", "Welcome " + name);
                return SUCCESS;

            } else {
                req.setAttribute("msg", "INVALID USER NAME OR PASSWORD");
                return ERROR;
            }

        } catch (Exception e) {
            return ERROR;

        }

    }

    @Override
    public void setSession(Map<String, Object> map) {

        sessionMap = (SessionMap) map;
    }

    public String logout() {
        if (sessionMap != null) {
            sessionMap.invalidate();
            return "login";
        }
        //HttpSession session = ServletActionContext.getRequest().getSession(false);
        //session.removeAttribute("namea");
        //session.removeAttribute("logina");
        //session.removeAttribute("msga");
        //session.invalidate();

        //((org.apache.struts2.dispatcher.SessionMap) session).invalidate();
        //((org.apache.struts2.dispatcher.SessionMap)ActionContext.getContext().getSession()).invalidate();
        return "success";
    }
}
