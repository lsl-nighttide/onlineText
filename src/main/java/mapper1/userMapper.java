package mapper1;

import entity.Major;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface userMapper {
    List<User> getAllByPermissions(int permissions);

    int addUser(User user);

    int deleteUser(String userid);

    int updateUser(User user);

    User queryById(String userid);

    User queryByIdAndPwd(@Param("username") String username, @Param("password") String password);

    List<User> getAll();

    int deleteMajorType(String id);

    int insertMajorType(List<Major> majors);

    int deleteUsers(List<String> list);

    int update_permissions(User user);

    int update_img(User user);
    String queryMaxUserid(int permissions);
}
