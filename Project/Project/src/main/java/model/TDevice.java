package model;

public class TDevice {
    private Integer dvcid;

    private String createddate;

    private String updateddate;

    private String deleteddate;

    private Integer creatorid;

    private Integer updaterid;

    private Integer type;

    private String name;

    private String brand;

    private Integer number;

    private Integer status;

    private Integer sumprice;

    private Integer unitprice;

    private String instructions;

    private String imagelist;

    private String expirationdate;

    private String remark;

    private Integer labid;

    private String labname;

    private Integer eqid;

    public Integer getDvcid() {
        return dvcid;
    }

    public void setDvcid(Integer dvcid) {
        this.dvcid = dvcid;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSumprice() {
        return sumprice;
    }

    public void setSumprice(Integer sumprice) {
        this.sumprice = sumprice;
    }

    public Integer getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Integer unitprice) {
        this.unitprice = unitprice;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions == null ? null : instructions.trim();
    }

    public String getImagelist() {
        return imagelist;
    }

    public void setImagelist(String imagelist) {
        this.imagelist = imagelist == null ? null : imagelist.trim();
    }

    public String getExpirationdate() {
        return expirationdate;
    }

    public void setExpirationdate(String expirationdate) {
        this.expirationdate = expirationdate == null ? null : expirationdate.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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

    public Integer getEqid() {
        return eqid;
    }

    public void setEqid(Integer eqid) {
        this.eqid = eqid;
    }

    @Override
    public String toString() {
        return "TDevice{" +
                "dvcid=" + dvcid +
                ", createddate='" + createddate + '\'' +
                ", updateddate='" + updateddate + '\'' +
                ", deleteddate='" + deleteddate + '\'' +
                ", creatorid=" + creatorid +
                ", updaterid=" + updaterid +
                ", type=" + type +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", number=" + number +
                ", status=" + status +
                ", sumprice=" + sumprice +
                ", unitprice=" + unitprice +
                ", instructions='" + instructions + '\'' +
                ", imagelist='" + imagelist + '\'' +
                ", expirationdate='" + expirationdate + '\'' +
                ", remark='" + remark + '\'' +
                ", labid=" + labid +
                ", labname='" + labname + '\'' +
                ", eqid=" + eqid +
                '}';
    }
}