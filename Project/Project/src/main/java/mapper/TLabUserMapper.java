package mapper;

import model.TEquipment;
import model.TLabUser;

import java.util.List;

public interface TLabUserMapper {
    int deleteByPrimaryKey(int userid);

    int insert(TLabUser record);

    int insertSelective(TLabUser record);

    TLabUser selectByPrimaryKey(int userid);

    List<TLabUser> selectBySelective(TLabUser record);

    int updateByPrimaryKeySelective(TLabUser record);

    int updateByPrimaryKey(TLabUser record);
}