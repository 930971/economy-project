package cn.edu.ccu.settings.service;

import cn.edu.ccu.settings.domain.User;
import cn.edu.ccu.settings.mapper.UserMapper;
import cn.edu.ccu.settings.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceImpl {

    @Autowired
    private UserMapper userMapper;

    /**
     * 通过座位号查询
     * @param seatNumber
     * @return
     */
    @Override
    public User queryUserBySeatNumber(String seatNumber) {
        return userMapper.selectUserBySeatNumber(seatNumber);
    }
}
