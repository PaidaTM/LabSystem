package mapper;

import model.TEquipment;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("equipmentMapper")
public class TEquipmentMapperImpl implements TEquipmentMapper {

    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;


    @Override
    public int deleteByPrimaryKey(Integer eqid) {
        session = sqlSessionFactory.openSession();
        int rows = session.delete("mapper.TEquipmentMapper.deleteByPrimaryKey", eqid);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public int insert(TEquipment record) {
        return 0;
    }

    @Override
    public int insertSelective(TEquipment record) {
        session = sqlSessionFactory.openSession();
        int rows = session.insert("mapper.TEquipmentMapper.insertSelective", record);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public TEquipment selectByPrimaryKey(Integer eqid) {
        session = sqlSessionFactory.openSession();
        TEquipment equipment = session.selectOne("mapper.TEquipmentMapper.selectByPrimaryKey", eqid);
        session.close();
        return equipment;
    }

    @Override
    public List<TEquipment> selectBySelective(TEquipment record) {
        session = sqlSessionFactory.openSession();
        List<TEquipment> equipmentList = session.selectList("mapper.TEquipmentMapper.selectBySelective", record);
        session.close();
        return equipmentList;
    }

    @Override
    public int updateByPrimaryKeySelective(TEquipment record) {
        session = sqlSessionFactory.openSession();
        int rows = session.update("mapper.TEquipmentMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public int updateByPrimaryKey(TEquipment record) {
        return 0;
    }
}
