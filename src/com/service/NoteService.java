package com.service;

import java.util.List;

import com.model.Note;

public interface NoteService {

	List<Note> findNoteAll();

	Note findSingleNote(Integer id);

	int addNote(Note obj);

	int updateNote(Note obj);

	int deleteNote(Integer id);
}
