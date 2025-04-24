package mapper;

import model.TLabUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class TLabUserMapperImplTest extends TLabUserMapperImpl {
    @Autowired
    private TLabUserMapper labUserMapper;

    @Test
    public void deleteByPrimaryKey() {
        int rows = labUserMapper.deleteByPrimaryKey(1);
        System.out.println("rows = " + rows);
    }

    @Test
    public void insertSelective() {
        TLabUser user = new TLabUser();
        user.setUserid(1);
        user.setName("ptm");
        user.setFirstname("Paidamoyo");
        user.setLastname("Mazamban");
        user.setPassword("abc123");
        user.setGender("M");
        user.setPhone("187870000");
        user.setEducaton("Science");
        user.setCollegename("SilkRoad");
        user.setProfilephoto("Picture.jpg");
        user.setUtid(1);
        user.setMail("paida@ytbu.edu.cn");
        int rows = labUserMapper.insertSelective(user);
        System.out.println("rows =" + rows);
    }

    @Test
    public void selectByPrimaryKey() {
        TLabUser user= labUserMapper.selectByPrimaryKey(1);
        System.out.println(user);
    }

    @Test
    public void selectBySelective() {
        TLabUser user = new TLabUser();
        user.setGender("M");
        List<TLabUser> userList = labUserMapper.selectBySelective(user);
        System.out.println("userList =" + userList);
    }

    @Test
    public void updateByPrimaryKeySelective() {
        TLabUser user = new TLabUser();
        user.setUserid(1);
        user.setPassword("abc123");
        user.setName("paida");
        user.setGender("M");
        user.setPhone("187870000");
        user.setEducaton("Science");
        user.setCollegename("SilkRoad");
        user.setUtid(1);
        user.setMail("paida@ytbu.edu.cn");
        int rows = labUserMapper.updateByPrimaryKeySelective(user);
        System.out.println("rows =" + rows);
    }
}