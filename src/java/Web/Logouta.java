
package Web;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import static org.jboss.weld.context.cache.RequestScopedBeanCache.invalidate;

public class Logouta {
    
    public String execute(){  
        HttpSession session=ServletActionContext.getRequest().getSession(false);  
        if(session==null || session.getAttribute("logina")==null){  
            return "login";  
        }  
        else{ 
            
            session.removeAttribute("namea");
            session.removeAttribute("logina");
            session.removeAttribute("msga");
            session.invalidate();
            //((org.apache.struts2.dispatcher.SessionMap) session).invalidate();
            return "success";  
        }  
    }  
}
