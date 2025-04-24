package mapper;

import model.TDevice;

import java.util.List;

public interface TDeviceMapper {
    int deleteByPrimaryKey(Integer dvcid);

    int insert(TDevice record);

    int insertSelective(TDevice record);

    TDevice selectByPrimaryKey(Integer dvcid);

    List<TDevice> selectBySelective(TDevice record);

    int updateByPrimaryKeySelective(TDevice record);

    int updateByPrimaryKey(TDevice record);
}