package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Comment;

public interface CommentBiz {
	//获取全部评论
	public List<Comment> getComment(int bid);
	//增加评论
	public boolean addComment(Comment comment);
}
