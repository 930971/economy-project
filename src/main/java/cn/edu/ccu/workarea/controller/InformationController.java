package cn.edu.ccu.workarea.controller;

import cn.edu.ccu.settings.domain.User;
import cn.edu.ccu.tool.Constant;
import cn.edu.ccu.tool.ReturnObject;
import cn.edu.ccu.workarea.domain.Operation;
import cn.edu.ccu.workarea.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InformationController {

    @Autowired
    private InformationService informationService;

    /**
     * 添加决策信息
     * @param operation
     * @param session
     * @return
     */
    @RequestMapping("/workarea/operation/createInformation.do")
    public @ResponseBody Object createInformation(Operation operation, HttpSession session) {
        User user = (User) session.getAttribute("user");

        operation.setSeatNumber(user.getSeatNumber());

        ReturnObject returnObject = new ReturnObject();

        try {
            int information = informationService.createInformation(operation);

            if (information > 0){
                returnObject.setCode(Constant.RETURN_SUCCESS);
            } else {
                returnObject.setCode(Constant.RETURN_FAIL);
            }
        } catch (Exception e){
            e.printStackTrace();

            returnObject.setCode(Constant.RETURN_FAIL);
        }

        return returnObject;
    }

    /**
     * 查询决策信息
     * @param operation
     * @return
     */
    @RequestMapping("/workarea/operation/queryInformation.do")
    public @ResponseBody Object queryInformation(Operation operation) {

        Map<String, Object> map = new HashMap<>();
        map.put("seatNumber", operation.getSeatNumber());
        map.put("frequency", operation.getFrequency());
        map.put("proportion", operation.getProportion());
        map.put("value", operation.getValue());
        map.put("view", operation.getView());
        map.put("stopTime", operation.getStopTime());
        map.put("investment", operation.getInvestment());
        map.put("profit", operation.getProfit());
        map.put("useTime", operation.getUseTime());

        List<Operation> operationsList = informationService.queryOperation(map);

        Map<String, Object> reMap = new HashMap<>();
        reMap.put("operationsList", operationsList);

        return reMap;
    }

}
