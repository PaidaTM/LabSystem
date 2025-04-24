package model;

public class TEquipment {
    private Integer eqid;

    private String createddate;

    private String updateddate;

    private String deleteddate;

    private Integer creatorid;

    private Integer updaterid;

    private Integer type;

    private Integer balance;

    private Integer number;

    private String reason;

    private Integer repairneed;

    private String mantaindate;

    private Integer principal;

    private String phone;

    private String cost;

    private String address;

    private String equipmentname;

    private Integer labid;

    private String labname;

    public Integer getEqid() {
        return eqid;
    }

    public void setEqid(Integer eqid) {
        this.eqid = eqid;
    }

    public String getCreateddate() {
        return createddate;
    }

    public void setCreateddate(String createddate) {
        this.createddate = createddate == null ? null : createddate.trim();
    }

    public String getUpdateddate() {
        return updateddate;
    }

    public void setUpdateddate(String updateddate) {
        this.updateddate = updateddate == null ? null : updateddate.trim();
    }

    public String getDeleteddate() {
        return deleteddate;
    }

    public void setDeleteddate(String deleteddate) {
        this.deleteddate = deleteddate == null ? null : deleteddate.trim();
    }

    public Integer getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(Integer creatorid) {
        this.creatorid = creatorid;
    }

    public Integer getUpdaterid() {
        return updaterid;
    }

    public void setUpdaterid(Integer updaterid) {
        this.updaterid = updaterid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Integer getRepairneed() {
        return repairneed;
    }

    public void setRepairneed(Integer repairneed) {
        this.repairneed = repairneed;
    }

    public String getMantaindate() {
        return mantaindate;
    }

    public void setMantaindate(String mantaindate) {
        this.mantaindate = mantaindate == null ? null : mantaindate.trim();
    }

    public Integer getPrincipal() {
        return principal;
    }

    public void setPrincipal(Integer principal) {
        this.principal = principal;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost == null ? null : cost.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEquipmentname() {
        return equipmentname;
    }

    public void setEquipmentname(String equipmentname) {
        this.equipmentname = equipmentname == null ? null : equipmentname.trim();
    }

    public Integer getLabid() {
        return labid;
    }

    public void setLabid(Integer labid) {
        this.labid = labid;
    }

    public String getLabname() {
        return labname;
    }

    public void setLabname(String labname) {
        this.labname = labname == null ? null : labname.trim();
    }

    @Override
    public String toString() {
        return "TEquipment{" +
                "eqid=" + eqid +
                ", createddate='" + createddate + '\'' +
                ", updateddate='" + updateddate + '\'' +
                ", deleteddate='" + deleteddate + '\'' +
                ", creatorid=" + creatorid +
                ", updaterid=" + updaterid +
                ", type=" + type +
                ", balance=" + balance +
                ", number=" + number +
                ", reason='" + reason + '\'' +
                ", repairneed=" + repairneed +
                ", mantaindate='" + mantaindate + '\'' +
                ", principal=" + principal +
                ", phone='" + phone + '\'' +
                ", cost='" + cost + '\'' +
                ", address='" + address + '\'' +
                ", equipmentname='" + equipmentname + '\'' +
                ", labid=" + labid +
                ", labname='" + labname + '\'' +
                '}';
    }
}