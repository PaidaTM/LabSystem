package mapper;

import model.TEquipment;
import model.TLabUser;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("labUserMapper")
public class TLabUserMapperImpl implements TLabUserMapper{

    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(int userid) {
       session = sqlSessionFactory.openSession();
       int rows = session.delete("mapper.TLabUserMapper.deleteByPrimaryKey",userid);
       session.commit();
       session.close();
       return rows;
    }

    @Override
    public int insert(TLabUser record) {
        return 0;
    }

    @Override
    public int insertSelective(TLabUser record) {
        session = sqlSessionFactory.openSession();
        int rows = session.insert("mapper.TLabUserMapper.insertSelective",record);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public TLabUser selectByPrimaryKey(int userid) {
        session = sqlSessionFactory.openSession();
        TLabUser labUser = session.selectOne("mapper.TLabUserMapper.selectByPrimaryKey",userid);
        session.close();
        return labUser;
    }

    @Override
    public List<TLabUser> selectBySelective(TLabUser record) {
        session = sqlSessionFactory.openSession();
        List<TLabUser> labUserList = session.selectList("mapper.TLabUserMapper.selectBySelective",record);
        session.close();
        return labUserList;
    }

    @Override
    public int updateByPrimaryKeySelective(TLabUser record) {
        session = sqlSessionFactory.openSession();
        int rows = session.update("mapper.TLabUserMapper.updateByPrimaryKeySelective",record);
        session.commit();
        session.close();
        return rows;
    }

    @Override
    public int updateByPrimaryKey(TLabUser record) {
        return 0;
    }
}
