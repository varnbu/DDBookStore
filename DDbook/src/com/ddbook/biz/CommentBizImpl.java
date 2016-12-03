package com.ddbook.biz;

import java.util.List;

import com.ddbook.dao.CommentDao;
import com.ddbook.po.Comment;

public class CommentBizImpl implements CommentBiz{
	CommentDao cdao = new CommentDao();
	@Override
	public List<Comment> getComment(int bid) {
		String sql = "select * from commentinfo where bid="+bid;
		return cdao.query(sql, Comment.class);
	}

	@Override
	public boolean addComment(Comment comment) {
		String sql ="insert into commentinfo(bid,orderid,content,grade)values(?,?,?,?)";
		Object[] params={comment.getBid(),comment.getOrderid(),comment.getContent(),comment.getGrade()};
		return cdao.update(sql, params);
	}
	
}
