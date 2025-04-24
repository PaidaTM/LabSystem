package service;

import mapper.TEquipmentMapper;
import model.TDevice;
import model.TEquipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentService{

    @Autowired
    private TEquipmentMapper equipmentMapper;

    @Override
    public int addEquipment(TEquipment equipment) {
        return equipmentMapper.insertSelective(equipment);
    }

    @Override
    public boolean updateEquipment(TEquipment equipment) {
        int rows =  equipmentMapper.updateByPrimaryKeySelective(equipment);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public boolean removeEquipment(int eqid) {
        int rows = equipmentMapper.deleteByPrimaryKey(eqid);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public TEquipment getEquipmentByid(int eqid) {
            return equipmentMapper.selectByPrimaryKey(eqid);
    }

    @Override
    public List<TEquipment> getParentEquipment(int eqid) {

        TEquipment parentequipment = new TEquipment();
        parentequipment.setEqid(eqid);
        return equipmentMapper.selectBySelective(parentequipment);
    }



    @Override
    public List<TEquipment> getEquipmentDamagedByPricipalID( int person){
        TEquipment equipment = new TEquipment();
        equipment.setPrincipal(person);
        return equipmentMapper.selectBySelective(equipment);

    }

    @Override
    public List<TEquipment> getEquipmentListByCondition(String equipmentname) {
        TEquipment equipment = new TEquipment();
        equipment.setEquipmentname(equipmentname);
        return equipmentMapper.selectBySelective(equipment);
    }

    @Override
    public List<TEquipment> getEquipmentByCreator(int userid) {
        TEquipment equipment = new TEquipment();
        equipment.setCreatorid(userid);
        return equipmentMapper.selectBySelective(equipment);
    }




}
