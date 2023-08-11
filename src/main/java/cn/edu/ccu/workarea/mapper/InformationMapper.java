package cn.edu.ccu.workarea.mapper;

import cn.edu.ccu.workarea.domain.Operation;

import java.util.List;
import java.util.Map;

public interface InformationMapper {

    /**
     * 添加决策信息
     * @param operation
     * @return
     */
    int insertInformation(Operation operation);

    /**
     * 查询决策信息
     * @param map
     * @return
     */
    List<Operation> selectOperation(Map<String, Object> map);
}
