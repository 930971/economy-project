package cn.edu.ccu.workarea.service;

import cn.edu.ccu.workarea.domain.Operation;

import java.util.List;
import java.util.Map;

public interface InformationService {

    /**
     * 添加决策信息
     * @param operation
     * @return
     */
    int createInformation(Operation operation);

    /**
     * 查询决策信息
     * @param map
     * @return
     */
    List<Operation> queryOperation(Map<String, Object> map);
}
