package com.service.impl;

import com.dao.NoteMapper;
import com.model.Note;
import com.service.NoteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NoteServiceImpl implements NoteService {

    @Resource
    private NoteMapper noteMapper;

    @Override
    public List<Note> findNoteAll() {
        return noteMapper.findNoteAll();
    }

    @Override
    public Note findSingleNote(Integer id) {
        return noteMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addNote(Note obj) {
        return noteMapper.insertSelective(obj);
    }

    @Override
    public int updateNote(Note obj) {
        return noteMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteNote(Integer id) {
        return noteMapper.deleteByPrimaryKey(id);
    }
}
