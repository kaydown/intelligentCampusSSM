package com.service;

import java.util.List;

import com.model.Replies;

public interface RepliesService {

	List<Replies> findRepliesAll(Integer noteid);

	Replies findSingleReplies(Integer id);

	int addReplies(Replies obj);

	int updateReplies(Replies obj);

	int deleteReplies(Integer id);
}
