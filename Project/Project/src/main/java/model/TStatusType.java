package model;

public class TStatusType {
    private Integer sid;

    private String status;

    private String condition;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition == null ? null : condition.trim();
    }

    @Override
    public String toString() {
        return "TStatusType{" +
                "sid=" + sid +
                ", status='" + status + '\'' +
                ", condition='" + condition + '\'' +
                '}';
    }
}