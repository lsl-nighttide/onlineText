package service;

import entity.Comment;

import java.util.List;

public interface commentService {
    int addComment(Comment comment);
    int deleteComment(int comment_id);
    List<Comment> getCommentAll();
    List<Comment> queryByPostid(int postid);
}
