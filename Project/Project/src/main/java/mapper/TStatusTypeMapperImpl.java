package mapper;

import model.TStatusType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("statusTypeMapper")
public class TStatusTypeMapperImpl implements TStatusTypeMapper{

    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;




    @Override
    public int deleteByPrimaryKey(Integer sid) {
        return 0;
    }

    @Override
    public int insert(TStatusType record) {
        return 0;
    }

    @Override
    public int insertSelective(TStatusType record) {
        return 0;
    }

    @Override
    public TStatusType selectByPrimaryKey(Integer sid) {
        session = sqlSessionFactory.openSession();
        TStatusType statusType = session.selectOne("mapper.TStatusTypeMapper.selectByPrimaryKey",sid);
        session.close();
        return statusType;
    }

    @Override
    public List<TStatusType> selectBySelective(TStatusType record) {
        session = sqlSessionFactory.openSession();
        List<TStatusType> statusTypeList = session.selectList("mapper.TStatusTypeMapper.selectBySelective",record);
        session.close();
        return statusTypeList;
    }

    @Override
    public int updateByPrimaryKeySelective(TStatusType record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(TStatusType record) {
        return 0;
    }
}
