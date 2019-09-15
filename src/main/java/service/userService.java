package service;

import entity.Major;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface userService {
    List<User> getAllByPermissions(int permissions);
    int addUser(User user);
    int deleteUser(String userid);
    int updateUser(User user);
    User queryById(String userid);
    User login(@Param("username")String username, @Param("password")String password);
    List<User> getAll();
    int deleteMajorType(String id);
    int insertMajorType(List<Major> majors);
    int deleteUsers(List<String> list);
    int update_permissions(User user);
    int update_img(User user);
    String queryMaxUserid(int permissions);
}
