package service.impl;

import entity.Comment;
import mapper1.commentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.commentService;

import java.util.List;

@Service
public class commentServiceImpl implements commentService {
    @Autowired
    private commentMapper commentMapper;

    @Override
    public int addComment(Comment comment) {
        return commentMapper.addComment(comment);
    }

    @Override
    public int deleteComment(int comment_id) {
        return commentMapper.deleteComment(comment_id);
    }

    @Override
    public List<Comment> getCommentAll() {
        return commentMapper.getCommentAll();
    }

    @Override
    public List<Comment> queryByPostid(int postid) {
        return commentMapper.queryByPostid(postid);
    }
}
