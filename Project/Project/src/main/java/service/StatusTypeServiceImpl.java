package service;


import mapper.TStatusTypeMapper;
import model.TStatusType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("statusTypeService")
public class StatusTypeServiceImpl implements StatusTypeService{

    @Autowired
    private TStatusTypeMapper statusTypeMapper;

    @Override
    public List<TStatusType> getStatusTypeList(int sid, String status) {
        TStatusType statusType = new TStatusType();
        statusType.setSid(sid);
        statusType.setStatus(status);
        return statusTypeMapper.selectBySelective(statusType);
    }
}
