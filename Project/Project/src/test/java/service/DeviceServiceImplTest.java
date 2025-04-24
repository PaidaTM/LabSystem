package service;

import mapper.TDeviceMapper;
import mapper.TEquipmentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class DeviceServiceImplTest {

    @Autowired
    private TDeviceMapper deviceMapper;

    @Test
    public void addDevice() {
    }

    @Test
    public void updateDevice() {
    }

    @Test
    public void deleteDevice() {
    }

    @Test
    public void getDeviceById() {
    }

    @Test
    public void getDeviceListByEquipmentId() {
    }

    @Test
    public void getDeviceListByCondition() {
    }
}