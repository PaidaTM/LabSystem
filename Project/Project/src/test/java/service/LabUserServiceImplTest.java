package service;

import mapper.TLabUserMapper;
import model.TLabUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class LabUserServiceImplTest extends LabUserServiceImpl {

    @Autowired
    private TLabUserMapper labUserMapper;

    @Test
    public void login() {
        TLabUser user = new TLabUser();
        user.setName("nomsa");
        user.setPassword("123456");
        List<TLabUser> list = labUserMapper.selectBySelective(user);
        System.out.println(list);
    }

    @Test
    public void isUseridValid() {
    }

    @Test
    public void registerUser() {
    }

    @Test
    public void modifyUser() {
    }

    @Test
    public void removeUser() {
    }

    @Test
    public void getUserByid() {
    }

    @Test
    public void isLabUser() {
    }
}