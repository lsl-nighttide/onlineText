package service.impl;

import entity.Major;
import entity.User;
import mapper1.userMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.userService;

import java.util.List;

@Service
public class userServiceImpl implements userService {
    @Autowired
    private userMapper userMapper;


    @Override
    public List<User> getAllByPermissions(int permissions) {
        return userMapper.getAllByPermissions(permissions);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUser(String userid) {
        return userMapper.deleteUser(userid);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User queryById(String userid) {
        return userMapper.queryById(userid);
    }

    @Override
    public User login(String username, String password) {
        return userMapper.queryByIdAndPwd(username, password);
    }

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    @Override
    public int deleteMajorType(String id) {
        return userMapper.deleteMajorType(id);
    }

    @Override
    public int insertMajorType(List<Major> majors) {
        return userMapper.insertMajorType(majors);
    }

    @Override
    public int deleteUsers(List<String> list) {
        return userMapper.deleteUsers(list);
    }

    @Override
    public int update_permissions(User user) {
        return userMapper.update_permissions(user);
    }

    @Override
    public int update_img(User user) {
        return userMapper.update_img(user);
    }

    @Override
    public String queryMaxUserid(int permissions) {
        return userMapper.queryMaxUserid(permissions);
    }
}
