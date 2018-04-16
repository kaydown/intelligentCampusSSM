package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Note;
import com.service.NoteService;
import com.util.DateUtil;

@Controller
@RequestMapping("/note")
public class NoteController {

	@Autowired
	private NoteService noteService;
	
	@RequestMapping("/findNoteAll")
	public String findNoteAll(HttpServletRequest request) {
		List<Note> noteList = noteService.findNoteAll();
		request.setAttribute("noteList", noteList);
		return "/note_list";
	}
	
	@RequestMapping("/blogList")
	public String blogList(HttpServletRequest request) {
		List<Note> noteList = noteService.findNoteAll();
		for (int i = 0; i < noteList.size(); i++) {
			noteList.get(i).setDatetime(DateUtil.formatDate(noteList.get(i).getAddtime(), "yyyy-MM-dd HH:mm"));
			noteList.get(i).setDate(DateUtil.formatDate(noteList.get(i).getAddtime(), "yyyy-MM-dd"));
			noteList.get(i).setTime(DateUtil.formatDate(noteList.get(i).getAddtime(), "HH:mm"));
		}
		request.setAttribute("noteList", noteList);
		return "/blog_list";
	}

	@RequestMapping("/beforeAddOrUpdateNote")
	public String beforeAddOrUpdateNote(Integer noteId, HttpServletRequest request) {
		Note note = new Note();
		if (noteId != null && !noteId.equals("")) {
			note = noteService.findSingleNote(noteId);
		}
		request.setAttribute("note", note);
		return "/note_addOrEdit";
	}

	@RequestMapping("/addOrUpdateNote")
	public String addOrUpdateNote(Note note) {
		if(note.getNoteid()==null){
			noteService.addNote(note);
		}else{
			noteService.updateNote(note);
		}
		return "redirect:/note/blogList";
	}

	@RequestMapping("/deleteNote")
	public String deleteNote(Integer noteId) {
		noteService.deleteNote(noteId);
		return "redirect:/note/findNoteAll";
	}
}
