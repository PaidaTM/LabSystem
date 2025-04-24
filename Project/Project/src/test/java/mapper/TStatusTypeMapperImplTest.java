package mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class TStatusTypeMapperImplTest {

    @Autowired
    private TStatusTypeMapper statusTypeMapper;

    @Test
    public void deleteByPrimaryKey() {
    }

    @Test
    public void insertSelective() {
    }

    @Test
    public void selectByPrimaryKey() {
    }

    @Test
    public void selectBySelective() {
    }

    @Test
    public void updateByPrimaryKeySelective() {
    }
}