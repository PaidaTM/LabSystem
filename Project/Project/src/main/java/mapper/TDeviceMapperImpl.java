package mapper;

import model.TDevice;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("deviceMapper")
public class TDeviceMapperImpl implements TDeviceMapper {

    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer dvcid) {
        session = sqlSessionFactory.openSession();
        int rows = session.delete("mapper.TDeviceMapper.deleteByPrimaryKey", dvcid);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public int insert(TDevice record) {
        return 0;
    }

    @Override
    public int insertSelective(TDevice record) {
        session = sqlSessionFactory.openSession();
        int rows = session.insert("mapper.TDeviceMapper.insertSelective", record);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public TDevice selectByPrimaryKey(Integer dvcid) {
        session = sqlSessionFactory.openSession();
        TDevice device = session.selectOne("mapper.TDeviceMapper.selectByPrimaryKey", dvcid);
        session.close();
        return device;
    }

    @Override
    public List<TDevice> selectBySelective(TDevice record) {
        session = sqlSessionFactory.openSession();
        List<TDevice> deviceList = session.selectList("mapper.TDeviceMapper.selectBySelective",record);
        session.close();
        return deviceList;
    }

    @Override
    public int updateByPrimaryKeySelective(TDevice record) {
        session = sqlSessionFactory.openSession();
        int rows = session.update("mapper.TDeviceMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public int updateByPrimaryKey(TDevice record) {
        return 0;
    }
}
