package mapper;

import model.TStatusType;

import java.util.List;

public interface TStatusTypeMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(TStatusType record);

    int insertSelective(TStatusType record);

    TStatusType selectByPrimaryKey(Integer sid);

    List<TStatusType> selectBySelective(TStatusType record);

    int updateByPrimaryKeySelective(TStatusType record);

    int updateByPrimaryKey(TStatusType record);
}