package cn.edu.ccu.tool;

/**
 * 返回数据类
 */
public class ReturnObject {
    private String code;
    private String message;

    public ReturnObject() {
    }

    public ReturnObject(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "ReturnObject{" +
                "code='" + code + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
