package cn.edu.ccu.workarea.domain;

/**
 * 操作类
 */
public class Operation {
    private Integer id;
    private String view;
    private String stopTime;
    private String investment;
    private String profit;
    private String useTime;
    private String frequency;
    private String seatNumber;
    private String proportion;
    private String value;

    public Operation() {
    }

    public Operation(Integer id, String view, String stopTime, String investment, String profit, String useTime, String frequency, String seatNumber, String proportion, String value) {
        this.id = id;
        this.view = view;
        this.stopTime = stopTime;
        this.investment = investment;
        this.profit = profit;
        this.useTime = useTime;
        this.frequency = frequency;
        this.seatNumber = seatNumber;
        this.proportion = proportion;
        this.value = value;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public String getStopTime() {
        return stopTime;
    }

    public void setStopTime(String stopTime) {
        this.stopTime = stopTime;
    }

    public String getInvestment() {
        return investment;
    }

    public void setInvestment(String investment) {
        this.investment = investment;
    }

    public String getProfit() {
        return profit;
    }

    public void setProfit(String profit) {
        this.profit = profit;
    }

    public String getUseTime() {
        return useTime;
    }

    public void setUseTime(String useTime) {
        this.useTime = useTime;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "Operation{" +
                "id=" + id +
                ", view='" + view + '\'' +
                ", stopTime='" + stopTime + '\'' +
                ", investment='" + investment + '\'' +
                ", profit='" + profit + '\'' +
                ", useTime='" + useTime + '\'' +
                ", frequency='" + frequency + '\'' +
                ", seatNumber='" + seatNumber + '\'' +
                ", proportion='" + proportion + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
