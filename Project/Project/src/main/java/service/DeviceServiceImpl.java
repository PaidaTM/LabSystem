package service;

import mapper.TDeviceMapper;
import model.TDevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("deviceService")
public class DeviceServiceImpl implements DeviceService{

    @Autowired
    private TDeviceMapper deviceMapper;

    @Override
    public int addDevice(TDevice device) {
        return deviceMapper.insertSelective(device);
    }

    @Override
    public boolean updateDevice(TDevice device) {
        int rows = deviceMapper.updateByPrimaryKeySelective(device);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public boolean deleteDevice(int dvcId) {
        int rows = deviceMapper.deleteByPrimaryKey(dvcId);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public TDevice getDeviceById(int dvcId) {
        return deviceMapper.selectByPrimaryKey(dvcId);
    }


    @Override
    public List<TDevice> getDeviceListByEquipmentId(int eqId) {
        TDevice device = new TDevice();
        device.setEqid(eqId);
        return deviceMapper.selectBySelective(device);
    }

    @Override
    public List<TDevice> getDeviceListByCondition(String devicename) {
     TDevice device = new TDevice();
     device.setName(devicename);
     return deviceMapper.selectBySelective(device);
    }
}
