package cn.edu.ccu.workarea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class OperationIndexController {

    @RequestMapping("/workarea/operation/index.do")
    public String index(){
        return "workarea/operation/index";
    }

    @RequestMapping("/workarea/operation/work.do")
    public String work() {
        return "workarea/operation/workArea";
    }

    @RequestMapping("/workarea/information/inform.do")
    public String inform() {
        return "workarea/information/index";
    }

    @RequestMapping("/workarea/operation/await.do")
    public String await(HttpSession session) {

        session.setAttribute("bigFrequency", 1);
        session.setAttribute("smallFrequency", 1);

        return "workarea/operation/await";
    }

    @RequestMapping("/workarea/operation/resolve.do")
    public String resolve() {
        return "workarea/operation/resolve";
    }

    @RequestMapping("/workarea/operation/judge.do")
    public String judge() {
        return "workarea/operation/judge";
    }

    @RequestMapping("/workarea/operation/layout.do")
    public String layout() {
        return "workarea/operation/layout";
    }

    @RequestMapping("/workarea/operation/trend.do")
    public String trend() {
        return "workarea/operation/trend";
    }

    @RequestMapping("/workarea/operation/rest.do")
    public String rest(HttpSession session) {

        int small = (Integer) session.getAttribute("smallFrequency");
        int big = (Integer) session.getAttribute("bigFrequency");

        if (big == 3 && small == 12) {
            small = 0;
            big = 1;
            session.setAttribute("smallFrequency", small);
            session.setAttribute("bigFrequency", big);
        }
        if (big < 4 && small == 12) {
            small = 0;
            big++;
            session.setAttribute("smallFrequency", small);
            session.setAttribute("bigFrequency", big);

        }
        if (big < 4 && small < 12) {
            small++;
            session.setAttribute("smallFrequency", small);
        }

        return "workarea/operation/rest";
    }

}
