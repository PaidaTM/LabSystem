package service;

import mapper.TEquipmentMapper;
import model.TEquipment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class EquipmentServiceImplTest {

    @Autowired
    private TEquipmentMapper equipmentMapper;

    @Test
    public void addEquipment() {
        TEquipment equipment = new TEquipment();
        equipment.setEquipmentname("aa");
        int rows = equipmentMapper.insertSelective(equipment);
        System.out.println("rows =" + rows);
    }

    @Test
    public void updateEquipment() {
    }

    @Test
    public void removeEquipment() {
    }

    @Test
    public void getEquipmentByid() {
    }

    @Test
    public void getEquipmentListByCondition() {
    }

    @Test
    public void getEquipmentByUser() {
    }
}