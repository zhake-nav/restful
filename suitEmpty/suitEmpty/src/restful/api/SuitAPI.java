package restful.api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import restful.bean.Result;
import restful.database.EM;
import restful.entity.User;

@Path("/suit")
public class SuitAPI {
	@POST
    @Path("/list")
    @Consumes("application/json;charset=UTF-8")
    @Produces("application/json;charset=UTF-8")
    public Result list() {
        List<User> result = EM.getEntityManager()
                .createNamedQuery("User.findAll", User.class)
                .getResultList();
        return new Result(0, "查询成功", result, "");
    }
}
