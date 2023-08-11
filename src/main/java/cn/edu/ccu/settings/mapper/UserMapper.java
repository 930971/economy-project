package cn.edu.ccu.settings.mapper;

import cn.edu.ccu.settings.domain.User;

public interface UserMapper {
    /**
     * 通过座位号查询
     * @param seatNumber
     * @return
     */
    User selectUserBySeatNumber(String seatNumber);
}
