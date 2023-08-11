package cn.edu.ccu.workarea.service.impl;

import cn.edu.ccu.workarea.domain.Operation;
import cn.edu.ccu.workarea.mapper.InformationMapper;
import cn.edu.ccu.workarea.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InformationServiceImpl implements InformationService {

    @Autowired
    private InformationMapper informationMapper;

    /**
     * 添加决策信息
     * @param operation
     * @return
     */
    @Override
    public int createInformation(Operation operation) {
        return informationMapper.insertInformation(operation);
    }

    /**
     * 查询决策信息
     * @param map
     * @return
     */
    @Override
    public List<Operation> queryOperation(Map<String, Object> map) {
        return informationMapper.selectOperation(map);
    }
}
