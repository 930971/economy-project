package cn.edu.ccu.settings.service.impl;

import cn.edu.ccu.settings.domain.User;

public interface UserServiceImpl {
    /**
     * 通过座位号查询
     * @param seatNumber
     * @return
     */
    User queryUserBySeatNumber(String seatNumber);
}
