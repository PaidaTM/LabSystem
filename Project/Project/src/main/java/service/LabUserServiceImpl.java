package service;

import mapper.TLabUserMapper;
import model.TDevice;
import model.TEquipment;
import model.TLabUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("labUserService")
public class LabUserServiceImpl implements LabUserService{

    @Autowired
    private TLabUserMapper labUserMapper;

    @Override
    public TLabUser login(String username, String password) {
        TLabUser user = new TLabUser();
        user.setName(username);
        user.setPassword(password);
        List<TLabUser> list = labUserMapper.selectBySelective(user);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }


    @Override
    public boolean registerUser(TLabUser user) {
        int rows = labUserMapper.insertSelective(user);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public boolean modifyUser(TLabUser user) {
        int rows = labUserMapper.updateByPrimaryKeySelective(user);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public boolean removeUser(int userid) {
        int rows = labUserMapper.deleteByPrimaryKey(userid);
        if(rows>0) return true;
        else return false;
    }

    @Override
    public TLabUser getUserByid(int userid) {
        return labUserMapper.selectByPrimaryKey(userid);
    }


    @Override
    public boolean isLabUser(int userid) {
        TLabUser user = labUserMapper.selectByPrimaryKey(userid);
        if(user!=null && user.getUtid()==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<TLabUser> GetLabUserList(String user,int utid) {
        TLabUser labUser = new TLabUser();
        labUser.setFirstname(user);
        labUser.setUtid(utid);
        return labUserMapper.selectBySelective(labUser);
    }


    @Override
    public List<TLabUser> getUserPicture(String profilephoto) {
        TLabUser user = new TLabUser();
        user.setProfilephoto(profilephoto);
        return labUserMapper.selectBySelective(user);
    }


}
