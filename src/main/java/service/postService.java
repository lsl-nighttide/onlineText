package service;

import entity.Post;

import java.util.List;

public interface postService {
    int addPost(Post post);
    int deletePost(int postid);
    List<Post> getPostAll();
    List<Post> queryByQuestion_Id(int question_id);
    Post queryByPostid(int postid);
    int updatePost(Post post);
}
