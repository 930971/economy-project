package cn.edu.ccu.settings.web.controller;

import cn.edu.ccu.settings.domain.User;
import cn.edu.ccu.settings.service.UserService;
import cn.edu.ccu.tool.Constant;
import cn.edu.ccu.tool.ReturnObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录平台
     * @return
     */
    @RequestMapping("/settings/user/toLogin.do")
    public String toLogin() {

        return "settings/user/login";
    }

    /**
     * 通过座位号查询
     * @param seatNumber
     * @param session
     * @return
     */
    @RequestMapping("/settings/user/login.do")
    public @ResponseBody Object login(String seatNumber, HttpSession session) {

        User user = userService.queryUserBySeatNumber(seatNumber);

        ReturnObject returnObject = new ReturnObject();

        if (user == null){
            returnObject.setCode(Constant.RETURN_FAIL);
            returnObject.setMessage("座位号不存在！");
        }else {
            returnObject.setCode(Constant.RETURN_SUCCESS);

            session.setAttribute("user", user);
        }

        return returnObject;
    }

    /**
     * 退出平台
     * @param session
     * @return
     */
    @RequestMapping("/settings/user/logout.do")
    public String logout(HttpSession session){

        session.invalidate();

        return "redirect:/";
    }
}
