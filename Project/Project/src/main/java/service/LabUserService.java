package service;

import model.TLabUser;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User business class interface written by paidamoyo takudzwa mazambani
 * @author ptm
 */
@Service
public interface LabUserService {

        /**
         * User login service method
         * @param username   user name for login
         * @param password   password for login
         * @return  VUser   successful return user object, otherwise return null
         */
        public TLabUser login(String username, String password);

        /**
         * Registered users (including lab administrators and ordinary members)
         * @param user TUser object containing user registration information
         * @return boolean,True is returned for successful and false for failed
         */
        public boolean registerUser(TLabUser user);

        /**
         * Modify user information
         * @param user TUser object containing user modification information
         * @return boolean,Return true for success and false for failure
         */
        public boolean modifyUser(TLabUser user);

        /**
         * Remove the user base on userid
         * @param userid
         * @return   boolean,Return true for success and false for failure
         */
        public boolean removeUser(int userid);

        /**
         * Returns the user object of the specified userid
         * @param userid  Userid to query
         * @return  The tuser object is returned successfully,
         * and null is returned in case of failure
         */
        public TLabUser getUserByid(int userid);


        /**
         * Query whether the user is a laboratory member
         * @param userid
         * @return boolean, The lab member returns true, not false
         */
        public boolean isLabUser(int userid);

        /**
         * Query all laboratory users
         * @param user
         * @return user record
         */
        public List<TLabUser> GetLabUserList(String user,int utid);


        public List<TLabUser> getUserPicture(String profilephoto);
}
