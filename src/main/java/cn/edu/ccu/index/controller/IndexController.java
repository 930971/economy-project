package cn.edu.ccu.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    /**
     * 欢迎页
     * @return
     */
    @RequestMapping("/")
    public String index() {
        return "index";
    }
}
