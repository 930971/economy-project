package cn.edu.ccu.settings.domain;

/**
 * 用户类
 */
public class User {
    private Integer id;
    private String seatNumber;
    private String totalAssets;

    public User() {
    }

    public User(Integer id, String seatNumber, String totalAssets) {
        this.id = id;
        this.seatNumber = seatNumber;
        this.totalAssets = totalAssets;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getTotalAssets() {
        return totalAssets;
    }

    public void setTotalAssets(String totalAssets) {
        this.totalAssets = totalAssets;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", seatNumber='" + seatNumber + '\'' +
                ", totalAssets='" + totalAssets + '\'' +
                '}';
    }
}
