package service.impl;

import entity.Post;
import mapper1.postMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.postService;

import java.util.List;
@Service
public class postServiceImpl implements postService {
    @Autowired
    private postMapper postMapper;
    @Override
    public int addPost(Post post) {
        return postMapper.addPost(post);
    }

    @Override
    public int deletePost(int postid) {
        return postMapper.deletePost(postid);
    }

    @Override
    public List<Post> getPostAll() {
        return postMapper.getPostAll();
    }

    @Override
    public List<Post> queryByQuestion_Id(int question_id) {
        return postMapper.queryByQuestion_Id(question_id);
    }

    @Override
    public Post queryByPostid(int postid) {
        return postMapper.queryByPostid(postid);
    }

    @Override
    public int updatePost(Post post) {
        return postMapper.updatePost(post);
    }
}
