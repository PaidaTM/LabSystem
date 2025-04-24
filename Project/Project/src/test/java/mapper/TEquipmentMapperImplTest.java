package mapper;

import model.TEquipment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class TEquipmentMapperImplTest {

    @Autowired
    private TEquipmentMapper equipmentMapper;

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void insertSelective() {
        TEquipment equipment = new TEquipment();
        equipment.setEqid(11);
        equipment.setEquipmentname("newDBeq");
        equipment.setReason("crash");
        int rows = equipmentMapper.insertSelective(equipment);
        System.out.println("rows =" + rows);
    }

    @Test
    public void selectByPrimaryKey() {
    }

    @Test
    public void selectBySelective() {
        TEquipment equipment = new TEquipment();
        equipment.setEquipmentname("barometer");
        List<TEquipment> list = equipmentMapper.selectBySelective(equipment);
        System.out.println(list);

    }

    @Test
    public void updateByPrimaryKeySelective() {
        TEquipment equipment = new TEquipment();
        equipment.setEqid(11);
        equipment.setEquipmentname("newDBeq");
        equipment.setReason("crash");
        int rows = equipmentMapper.updateByPrimaryKeySelective(equipment);
        System.out.println("rows =" + rows);
    }
}