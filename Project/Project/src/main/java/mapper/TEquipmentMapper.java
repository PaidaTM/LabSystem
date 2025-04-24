package mapper;

import model.TEquipment;

import java.util.List;

public interface TEquipmentMapper {
    int deleteByPrimaryKey(Integer eqid);

    int insert(TEquipment record);

    int insertSelective(TEquipment record);

    TEquipment selectByPrimaryKey(Integer eqid);

    List<TEquipment> selectBySelective(TEquipment record);

    int updateByPrimaryKeySelective(TEquipment record);

    int updateByPrimaryKey(TEquipment record);
}