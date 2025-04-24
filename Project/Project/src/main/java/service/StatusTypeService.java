package service;


import model.TStatusType;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StatusTypeService {

    public List<TStatusType> getStatusTypeList(int sid,String status);

}
