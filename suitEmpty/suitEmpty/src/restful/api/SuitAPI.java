package restful.api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.springframework.web.bind.annotation.RequestParam;

import restful.bean.Result;
import restful.database.EM;
import restful.entity.User;

@Path("/suit")
public class SuitAPI {
	@POST
    @Path("/regist")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public Result regist(User user) {
		 
    	 user.setId(0);
    	 String loginname = user.getLoginname();
    	 System.out.println("loginname = " + loginname);
    	 
    	 List<User> result = EM.getEntityManager()
         		.createNamedQuery("User.findAllByName", User.class)
                 .setParameter("loginname", "%"+user.getLoginname()+"%")
                 .getResultList();
    	 
    	 if (result.size() == 0) {
         	System.out.println("数据表中不存在");
         	
         	user = EM.getEntityManager().merge(user);
            EM.getEntityManager().persist(user);
            EM.getEntityManager().getTransaction().commit();
            
            System.out.println(user.getUsername());
            return new Result(0, "添加成功", user, "");
         	
         	
         } else {
         	System.out.println("数据表中找到了");
         	return new Result(-1, "添加失败", result, "");
         }
    	 
         
    }
	
	@POST
    @Path("/getByName")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public Result getByName(User user) {
		List<User> result = EM.getEntityManager()
         		.createNamedQuery("User.findAllByName", User.class)
                 .setParameter("loginname", "%"+user.getLoginname()+"%")
                 .getResultList();
    	 
    	 if (result.size() == 0) {
         	System.out.println("数据表中不存在");
         	return new Result(0, "添加成功", result, "");
    	 } else {
          	System.out.println("数据表中找到了");
          	return new Result(-1, "添加失败", result, "");
          }
    }
}
