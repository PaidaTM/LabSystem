package mapper;

import model.TDevice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;


@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class TDeviceMapperImplTest {

        @Autowired
    private TDeviceMapper deviceMapper;

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void insertSelective() {
        TDevice device = new TDevice();
        device.setDvcid(14);
        device.setCreatorid(1);
        device.setLabid(2);
        device.setStatus(3);
        device.setName("new");
        device.setName("MicroScope");
        int rows = deviceMapper.insertSelective(device);
        System.out.println("rows =" + rows);

    }

    @Test
    public void selectByPrimaryKey() {
        TDevice device = deviceMapper.selectByPrimaryKey(12);
        System.out.println(device);
    }

    @Test
    public void selectBySelective() {
        TDevice device = new TDevice();
        device.setName("st");
        List<TDevice> list = deviceMapper.selectBySelective(device);
        System.out.println(list);
    }

    @Test
    public void updateByPrimaryKeySelective() {
        TDevice device = new TDevice();
        device.setDvcid(12);
        device.setCreatorid(1);
        device.setLabid(2);
        device.setStatus(2);
        device.setName("new");
        device.setName("NewDbDevice");
        int rows = deviceMapper.updateByPrimaryKeySelective(device);
        System.out.println("rows =" + rows);

    }
}