package mapper1;

import entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface commentMapper {
    int addComment(Comment comment);
    int deleteComment(int comment_id);
    List<Comment> getCommentAll();
    List<Comment> queryByPostid(int postid);
}
