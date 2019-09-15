package mapper1;

import entity.Post;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface postMapper {
    int addPost(Post post);
    int deletePost(int postid);
    List<Post> getPostAll();
    List<Post> queryByQuestion_Id(int question_id);
    Post queryByPostid(int postid);
    int updatePost(Post post);
}
